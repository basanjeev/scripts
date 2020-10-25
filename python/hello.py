#!/usr/bin/python -tt

import sys

print "Hello Loaded"

def cat(filename):
	"""
		This is a test documentation.
	"""

	try:
		f = open(filename, 'rU')
	#for line in f:
	#	print line,
	#lines = f.readlines()
		fullstring = f.read()
	#print lines
		print fullstring,
		f.close()
	except IOError:
		print "IOError ", filename

def Hello(name):
	if name == 'Sanjeev' or name == 'Test':
		print 'Alert: ',name,' Mode'
	else:
		print 'Else ', name
		#does_not_exist(name)

	name = name + "!!!!!"
	print "Hello", name

def main():
	args = sys.argv[1:]
	for arg in args:
		cat(arg)
#	print "Hello"
#	print sys.argv

if __name__ == "__main__":
	main()
