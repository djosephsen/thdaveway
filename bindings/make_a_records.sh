#!/usr/bin/env bash

#create A records from the IN file

while read i
do
  EXT=$(echo ${i} | cut -d\  -f2)
  PRE=$(echo ${i} | cut -d\  -f3 | cut -d. -f1)
  POST=$(echo ${i} | cut -d\  -f3 |  sed -e 's/^[^.]*\.//g')

  echo "cli53 rc ${POST} '${PRE} 60 A ${EXT}'"
  echo
done
