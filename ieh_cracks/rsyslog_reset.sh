#!/bin/sh

SUFIX='app1v.cc.prd.sparkpost'

for i in a b c d e
do
  ssh -t ${i}.${SUFIX} "sudo /etc/init.d/rsyslog restart"
done
