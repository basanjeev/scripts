#!/usr/bin/python

import datetime
import calendar
import urllib 
import sys
from bs4 import BeautifulSoup

#Initialization
start = datetime.datetime.strptime(sys.argv[2], '%d-%b-%Y')
end   = datetime.datetime.strptime(sys.argv[3], '%d-%b-%Y')
startm = datetime.datetime.strftime(start, "%Y-%B")
endm   = datetime.datetime.strftime(end, "%Y-%B")
f = open(sys.argv[1]+"_"+startm + "_" + endm +".txt",'w')

def print_matching_records(threads):
	years = end.year - start.year + 1
	months = end.month - start.month + 1

	for idx, link in enumerate(threads):
		soup1 = BeautifulSoup(str(link))
		subject = soup1.find("div", "forum-topic-title")
		authorline = soup1.find("div", "byline")
		temp = authorline.contents[2].split(',')[0]
		index  = temp.find("on on ") + 6
		created = temp[index:]
		author = authorline.span.string
		cdate = datetime.datetime.strptime(created, '%d %b %Y')
		
		lcline = soup1.find("td", "views-field views-field-last-updated active")
		temp = lcline.contents[0].split(',')[0]
		index  = temp.find("on on ") + 19
		commentdate = temp[index:]
		commentdate.replace(' ','')
		lcdate = datetime.datetime.strptime(commentdate, '%d %b %Y')
		commentor = lcline.contents[3].string

		if(cdate>=start and cdate <=end):
			filestr = "C=" + author +  "-" + created + "-" + subject.a.string + "-" + commentdate + "-" + commentor + "\n"
			print filestr
			f.write(filestr.encode('utf-8'))
		if(lcdate>=start and lcdate <=end):
			filestr = "A=" + author +  "-" + created + "-" + subject.a.string + "-" + commentdate + "-" + commentor + "\n"
			print filestr
			f.write(filestr.encode('utf-8'))

if __name__ == "__main__":
	url = "https://developer.tizen.org/forums/" + sys.argv[1] + "?page=%d"

	for i in range(0,10):
		sock = urllib.urlopen(url % i)
		print url % i 
		starthtml = sock.read() 
		soup = BeautifulSoup(starthtml)
		threadseven = soup.find_all("tr", "even")
		print_matching_records(threadseven)
		threadsodd = soup.find_all("tr", "odd")
		print_matching_records(threadsodd)
	f.close()