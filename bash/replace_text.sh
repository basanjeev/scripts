#!/bin/bash

for file in `ls .`
do
	echo "Processing $file $1 $2"
	sed "s/\<$1\>/\<$2\>/g" $file > ./temp
	mv ./temp  $file
done
