#!/usr/bin/env bash

SUB='PTR Record Setup'
SEV='urgent'
SER='amazon-route53'
CAT='other'
BOD="Please create the following PTR records:"


while read i; do 
  H=$(echo ${i} | cut -d\  -f3)
  E=$(echo ${i} | cut -d\  -f2)
  BOD="${BOD}
Hostname: ${H} IP: ${E}"
done

echo "aws --region us-east-1 support create-case --subject='${SUB}' --severity-code='${SEV}' --service-code=${SER} --category-code=${CAT} --communication-body='${BOD}'"
