#!/usr/bin/python

import datetime
import calendar
import urllib 
import sys
from bs4 import BeautifulSoup

if __name__ == "__main__":

	#Initialization
	start = datetime.datetime.strptime(sys.argv[2], '%d-%b-%Y')
	end   = datetime.datetime.strptime(sys.argv[3], '%d-%b-%Y')
	
	years = end.year - start.year + 1
	months = end.month - start.month + 1
	startm = datetime.datetime.strftime(start, "%Y-%B")
	endm   = datetime.datetime.strftime(end, "%Y-%B")
	f = open(sys.argv[1]+"_"+startm + "_" + endm +".txt",'w')

	for i in range(start.year, end.year + 1):
		sm = start.month
		em = 12

		if(i>end.year):
			break
		if(i==end.year):
			em = end.month
		if(i>start.year):
			sm = 1
		
		print i, start.year, sm, em
		
		for j in range(sm, em + 1):
			m = calendar.month_name[j]
			print m
			
			ym = str(i) + "-" + m
			print ym

			url = "https://lists.tizen.org/pipermail/" + sys.argv[1] + "/" + ym
			
			sock = urllib.urlopen(url + "/thread.html") 
			starthtml = sock.read() 
			soup = BeautifulSoup(starthtml)
			count = -1

			subjects = soup.find_all('a')
			for idx, link in enumerate(subjects):
				linkref = link.get('href')
				if(linkref is not None and linkref.find('html')>=0 and linkref.find("#")==-1):
					sock1 = urllib.urlopen(url + "/" + linkref)
					sthreadhtml1 = sock1.read() 
					soup1 = BeautifulSoup(sthreadhtml1)
					for link1 in soup1.find_all('a'):
						linkref1 = link1.get('title')
						if(linkref1 is not None):
							#print "author = ",soup1.body.b.string, "date = ", soup1.body.i.string, "title=", linkref1
							emaildate = datetime.datetime.strptime(soup1.body.i.string, "%a %b %d %H:%M:%S %Z %Y")
							temp = emaildate.strftime("%d-%B-%Y")
							print temp
							line = temp + "," + linkref1 + "," + soup1.body.b.string
							f.write(line.encode('utf8') + '\n')
							f.flush()
	f.close()