#!/usr/bin/python

import pickle

def pickle_save (list, file):
	try:
		with open(file, 'wb') as pickle_file:
			pickle.dump(list, pickle_file)
	except:
		print("Sorry cannot open the file: pickle error")
	finally:
		pickle_file.close()

def pickle_load (file):
	try:
		with open(file, 'rb') as pickle_file:
			list = pickle.load(pickle_file)
			print (list)
			return list
	except:
		print("Sorry cannot open the file: pickle error")
	finally:
		pickle_file.close()
