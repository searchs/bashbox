#!/usr/bin/env bash

##########################################
#
#     GENERATE  FILE DETAILS
#
##########################################

filename=$1

current_time=`date +%F_%T`
echo $current_time

row_count=`wc -l $filename | awk '{print $1}'`
file_size=`wc -c $filename | awk '{print $1}'`
md5_hash=`md5 $filename`
# echo $md5_hash
read -a arr <<< $md5_hash
# echo $arr
arr_length=$(echo ${#arr[@]})
echo $arr_length
hash_value=$(echo ${arr[3]})

name=$(echo $filename | cut -f 1 -d '.')
manifest_headers="current_time,file_name,total_rows,file_size_bytes,hash_value"
manifest_report=manifest_${name}.csv
# echo $manifest_report
echo $manifest_headers > $manifest_report
echo "$current_time,$filename,$row_count,$file_size,$hash_value" >> $manifest_report
