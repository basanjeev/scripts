#!/bin/bash
HOST=http://www.santabanta.com
IMGPATH=/home/sanjeev/Media/Pictures/Wallpapers

rm wallpaper.html
rm backdrop.list

CAT_BABES=28
BABES=babes
BABESR=Babes
CAT_NAME_BIKINI=bikini
CAT_NAME_BIKINIS=bikini
CAT_NAME_BIKINIR=Bikini
CAT_NAME_MISCBABES=miscellaneous%20babes
CAT_NAME_BEACHBABES=beach%20babes
CAT_NAME_NEGLIGEE=negligee

catsearch=$CAT_BABES
locals=$BABES
localr=$BABESR
cats=$CAT_NAME_BIKINIS
catr=$CAT_NAME_BIKINIR
echo $locals

CAT_INDIANF=2
INDIANC=indian_females
INDIANS=indian%20%20celebrities\(f\)
INDIANR=Indian%20%20Celebrities\(F\)

CAT_GLOBALF=8
GLOBALC=global_females
GLOBALS=global%20celebrities\(f\)
GLOBALR=Global%20Celebrities\(F\)

CAT_HINDU=34
HINDUC=hinduism
HINDUS=hinduism
HINDUR=Hinduism

FIND_URL="$HOST/wallpapers/parent.asp?order=name&catid="
CAT_URL="$HOST/wallpapers/category.asp?catname="
SEARCH_URL=$HOST/wallpapers

if [ "$1" = "$CAT_NAME_BIKINI" ]
then
    FIND_URL=$CAT_URL
    catsearch=$1
fi

if [ "$1" = "$GLOBALC" ]
then
    catsearch=$CAT_GLOBALF
    locals=$GLOBALS
    localr=$GLOBALR
fi

if [ "$1" = "$INDIANC" ]
then
    catsearch=$CAT_INDIANF
    locals=$INDIANS
    localr=$INDIANR
fi

if [ "$1" = "$HINDUC" ]
then
    catsearch=$CAT_HINDU
    locals=$HINDUS
    localr=$HINDUR
fi

wget $FIND_URL$catsearch -O wallpaper.html
i=0
echo $locals
for file in `cat wallpaper.html | grep jpg | grep $locals | cut -d'"' -f4`
do
    temp=${file//\/$locals\//\/$localr\/}
    pathfix=${temp//medium1/full5}
    jpeg=${pathfix//\/media/\/media1}
    withcat=${jpeg//\/$cats\//\/$catr\/}
    echo "Final URL = " $withcat
    wget $withcat -O $IMGPATH/$i.jpg
    i=$(($i + 1))
done

DISPLAY=:0.0 xfdesktop --reload
