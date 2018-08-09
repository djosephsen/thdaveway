#!/bin/sh

#CMD='zgrep'
CMD='grep'
SUFIX='app1v.cc.prd.sparkpost'
#LOG='/var/log/msys-nginx/api.log'
LOG='/var/log/msys-nginx/api.log-20180801'
PAT="POST.*v1/account HTTP/1.1.*${1}"

for i in a b c d e
do
  out=$(ssh -t ${i}.${SUFIX} "${CMD} '${PAT}' ${LOG}" 2>/dev/null)
  if [ "${?}" -eq 0 ]
  then 
    echo ${i}.${SUFIX}: 
    echo "${out}"
    exit 0
  fi
done
