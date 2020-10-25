#!/usr/bin/python3

import pickler

def main():
	list = [ 'a', 'b', 'c' ]
	pickler.pickle_save(list, "pickletest.dat")
	newlist = pickler.pickle_load("pickletest.dat")
	print ("New List = " )
	print(newlist)

if __name__ == '__main__':
	main()
	
