#!/bin/bash

# backupFolder="backup"
# mkdir -p $backupFolder

input_start=2021-09-10
# input_start=2021-11-29

# input_end=

# After this, startdate and enddate will be valid ISO 8601 dates,
# or the script will have aborted when it encountered unparseable data
# such as input_end=abcd

# Linux
# startdate=$(date -I -d "$input_start") || exit -1
# enddate=$(date -I)     || exit -1
# enddate=$(date -I -d "$enddate + 1 day")

#Mac
startdate=$(gdate -d "$input_start" +"%Y-%m-%d")
enddate=$(gdate +"%Y-%m-%d")
enddate=$(gdate  -d "$enddate + 1 day" +"%Y-%m-%d")

d="$startdate"
while [ "$d" != "$enddate" ]; do 
  echo $d
  mmmmdd=$(echo $d | cut -c1-7)
  inputFilename=database.sqlite.$mmmmdd
  outputFilename=backup/$d.dump
  echo $inputFilename
  cat $inputFilename | grep $d > $outputFilename

  #Linux
  #d=$(gdate -I -d "$d + 1 day" +"%Y-%m-%d")
  #Mac
  d=$(gdate -d "$d + 1 day" +"%Y-%m-%d")


done

