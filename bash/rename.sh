#! /bin/bash

rm -f /tmp/clean_dir_file_names*
cd /home/sanjeev/Music/
find .  | awk '{ print length(), $0 | "sort -n -r" }' | grep -v '^1 \.$' | cut -d/ -f2- > /tmp/clean_dir_file_names_1

touch /tmp/clean_dir_file_names_2
while read line
do
	BASE=`basename "$line"`
	NEWBASE=`basename "$line" | perl -e '$N = <>; chomp ($N); $N =~ s/[^a-zA-Z0-9-_.]/_/g; $N =~ s/_+/_/g; $N= lc($N); $N =~ s/_([a-z])/_.uc($1)/eg; print ucfirst($N);' `
	if [ "$BASE" != "$NEWBASE" ]
	then
		OLDPATH=$(echo "$line" | sed -r 's/([^a-zA-Z0-9./_-])/\\\1/g')
		DIR=$(dirname "$line" | sed -r 's/([^a-zA-Z0-9./_-])/\\\1/g')
		echo "mv -i $OLDPATH $DIR/$NEWBASE" >> /tmp/clean_dir_file_names_2
	fi
done </tmp/clean_dir_file_names_1
exit
