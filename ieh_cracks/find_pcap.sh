#!/bin/sh

#CMD='zgrep'
CMD='grep'
SUFIX='log1.admin.prd.sparkpost'
LOG='/tmp/accounts_payloads.log'
PAT="POST.*v1/account HTTP/1.1.*${1}"

for i in b c d
do
  out=$(ssh -t ${i}.${SUFIX} "${CMD} '${PAT}' ${LOG}" 2>/dev/null)
  if [ "${?}" -eq 0 ]
  then 
    echo ${i}.${SUFIX}: 
    echo "${out}"
    exit 0
  fi
  echo ${i}
done
