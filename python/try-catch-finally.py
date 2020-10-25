#!/usr/bin/python3

import os;
import nester;

def main():
	man = []
	other_man = []
	try:
		file1 = open(os.getcwd() + '/sketch.txt')
		print(os.getcwd())

		for line in file1:
			try:
				(role,line_spoken) = line.split(':', 1)
				line_spoken = line_spoken.strip()
				if role == 'Man':
					man.append(line_spoken)
				else:
					other_man.append(line_spoken)
			except ValueError:
				pass

	except IOError as err: 
		print('data file is missing' + str(err))
	finally:
		if 'file1' in locals():
			file1.close()
	
	try:
		with open('man.txt', 'w') as file1, open('other.txt', 'w') as file2:
			nester.repeat_loop (man, fh=file1)
			nester.repeat_loop (other_man, fh=file2)

	except IOError:
		print ('Could not open files for writing')

	finally:
		print("Closing files")
		file1.close()
		file2.close()
		print("Finished closing")


if __name__ == '__main__':
	main()



