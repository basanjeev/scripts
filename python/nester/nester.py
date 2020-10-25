#This is a test function

import sys

def repeat_loop(newlist, indent=True, level=0, fh=sys.stdout):
	for i in newlist:
		if isinstance(i,list):
			repeat_loop(i,indent, level+1, fh)
		else:
			if indent:
				for j in range(level):
					print("\t", end='', file=fh)
			print(i, file=fh)
