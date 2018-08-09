#!/bin/sh

CMD='grep'
SUFIX='app1v.cc.prd.sparkpost'
LOG='/var/log/messages'
TODAY="$(date | cut -d\  -f2,3)"
PAT="${TODAY}.*drop messages"

for i in a b c d e
do
  out=$(ssh -t ${i}.${SUFIX} "sudo ${CMD} '${PAT}' ${LOG} | tail -n1" 2>/dev/null)
  if [ "${?}" -eq 0 ]
  then 
    echo ${i}.${SUFIX}: 
    echo "${out}"
  fi
done
