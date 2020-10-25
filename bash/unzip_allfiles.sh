for i in `ls *.zip`; do newdir=${i%.zip}; mkdir $newdir; cd $newdir; unzip ../$i; cd ..; done
