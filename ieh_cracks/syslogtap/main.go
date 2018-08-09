package main

import (
  "fmt"
  "github.com/google/gopacket/pcap"
  "github.com/google/gopacket"
  "os"
  "strings"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}

func main() {
  outfile := "/tmp/accounts_payloads.log"
  os.Remove(outfile)
  f, err := os.Create(outfile)
  check(err)
  handle, err := pcap.OpenLive("eth0", 4096, true, pcap.BlockForever)
  check(err)
  err = handle.SetBPFFilter("tcp and port 5140")
  check(err)
  packetSource := gopacket.NewPacketSource(handle, handle.LinkType())
  for packet := range packetSource.Packets() {
    if app := packet.ApplicationLayer(); app != nil {
      pl := string(app.Payload())
      pls := strings.Split(pl,"\n")
      match := `POST /api/v1/account`
        for _,str := range pls {
          if strings.Contains(str, match) {
          fmt.Printf("%s matched %s\n",str,match)
          f.WriteString(fmt.Sprintf("%s\n",str))
        }
      }
    }
  }
}
