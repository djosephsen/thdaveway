all:
	apt-get update
	apt-get install -y libpcap0.8-dev
	ldconfig
	go get
	CGO_ENABLED=1 GOOS=linux go build -a -ldflags '-extldflags "-static"' .
