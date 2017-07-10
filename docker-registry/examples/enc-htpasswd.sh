#!/bin/bash

INPUT=$1
OUTPUT=$2

[ -f "${OUTPUT}" ] && rm -f "${OUTPUT}" 

while read line
do
  USER=$(echo ${line} | cut -f1 -d':')
  PASS=$(echo ${line} | cut -f2 -d':')
  docker run \
    --rm \
    xmartlabs/htpasswd \
    ${USER} ${PASS} \
    | tee -a "${OUTPUT}"
done < ${INPUT}

sed -i "/^$/d" "${OUTPUT}"