#!/bin/bash

i=86780000
pre="http://ipsweb.ptcmysore.gov.in/ipswebtracking/IPSWeb_item_events.asp?itemid=EM0"
post="IN&Submit=Submit"
while [ $i -lt 86789999 ]
do
	wget --save-headers -O a.html --server-response "$pre$i$post"
	length=`cat a.html | grep Content-Length | tr -s ' ' | cut -d ' ' -f2`
	i=`expr $i + 1`
	rm a.html
	echo $length >> output.txt
done
