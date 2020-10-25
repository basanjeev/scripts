#!/usr/bin/python -tt

import re
import sys


def find(pat, text):
	match = re.search(pat, text)


	if match: # None
		print match.group()
	else:
		print "Not Found"

def main():
	print sys.argv[1], sys.argv[2]
	find(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
	main()
