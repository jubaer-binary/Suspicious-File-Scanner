#!/bin/bash

echo "##########################--Suspicious Files Scanning--#############################\n###################################################################\n"

FILETYPES=( 'mp3' 'mp4' 'mov' 'avi' 'jpg' 'png' 'gif' 'pdf' 'docx' 'ppt' 'pptx' )

for types in ${FILETYPES[@]}; do

FILESIZES=( '-3M,+50M' '-10M,+500M' '-10M,+500M' '-10M,+500M' '-9k,+10M' '-2k,+10M' '-6,+10M' '-600k,+10M' '-600k,+10M,' '-1M,+10M' '-1M,+10M' )
IFS=','
read -ra ADDR <<< "$FILESIZES"

for i in "${ADDR[@]}";

SCANFILE=$( find / -name "*$types" 2>&1 -size $i | grep -v "Permission denied" | grep -v "Operation not permitted" | grep -v "Not a directory"  | grep -v "No such file or directory" | xargs -I{} ls -lah "{}" )

echo "$SCANFILE\n"
done
done
