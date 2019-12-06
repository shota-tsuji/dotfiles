#!/bin/bash

# Move to the directory where this script exists.
cd `dirname $0`

#for file in `\find . -maxdepth 1 -type f`;
for file in $(find $PWD -maxdepth 1 -type f);
do
	#echo ${file##*/}
	if [ ${file##*/} = *rc ]; then
		rc_file=${file##*/}
		echo ${rc_file}
		readlink rc_file
	fi
done
