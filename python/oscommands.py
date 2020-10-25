#!/usr/bin/python -tt

import os
import sys
import commands

def main():
	#filenames = os.listdir(sys.argv[1])
	#print filenames
	#for filename in filenames:
	#	path = os.path.join(sys.argv[1], filename)
	#	print path
	#	print os.path.abspath(path)
	#	if os.path.exists(path):
	#		print "is there"
	#	else:
	#		print "is not there"
	cmd = 'ls -al ' + sys.argv[1]
	(status, output) = commands.getstatusoutput(cmd)
	if status:
		sys.stderr.write('there was an error'+ output)
		sys.exit(1)
		

if __name__ == "__main__":
	main()