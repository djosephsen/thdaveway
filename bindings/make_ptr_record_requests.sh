#!/usr/bin/env bash

SUB='PTR Record Setup'
SEV='urgent'
SER='amazon-route53'
CAT='other'


while read i; do 
  H=$(echo ${i} | cut -d\  -f3)
  E=$(echo ${i} | cut -d\  -f2)
  BOD="Please create the following PTR records:
Hostname: ${H} IP: ${E}"
  echo "aws --region us-east-1 support create-case --subject='${SUB}' --severity-code='${SEV}' --service-code=${SER} --category-code=${CAT} --communication-body='${BOD}'"
  echo
done
