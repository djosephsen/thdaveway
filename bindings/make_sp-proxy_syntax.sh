#!/usr/bin/env bash

while read i
do
  INT=$(echo ${i} | cut -d\  -f1)
  EXT=$(echo ${i} | cut -d\  -f2)
  URL=$(echo ${i} | cut -d\  -f3)
  cat template | sed -e "s/%INT%/${INT}/" -e "s/%EXT%/${EXT}/" -e "s/%URL%/${URL}/"
done
