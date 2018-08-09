#!/bin/sh

#CMD='zgrep'
CMD='grep'
SUFIX='log1.admin.prd.sparkpost'
LOG='/var/log/td-agent/td-agent.log'
#LOG='/var/log/td-agent/td-agent.log-20180717.gz'
PAT="${1}.*account_creation"
#PAT='Not authorized'

for i in  b c d
do
  out=$(ssh -t ${i}.${SUFIX} "sudo ${CMD} '${PAT}' ${LOG}" 2>/dev/null)
  if [ "${?}" -eq 0 ]
  then 
    echo ${i}.${SUFIX}: 
    echo "${out}"
    exit 0
  fi
  echo ${i}
done
