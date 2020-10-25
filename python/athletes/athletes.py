#!/usr/bin/python3

def get_coach_data(filename):
	try:
		with open(filename) as f:
			data = f.readline()
			temp1 = data.strip().split(',')
			return ({'Name':temp1.pop(0), 'DOB':temp1.pop(0), 'Times':str(sorted(set([sanitize(i) for i in temp1]))[0:3])})
	except IOError as ioerr:
		print('File error: ' + str(ioerr))
		return(None)
	finally:
		f.close()

def sanitize(time_string):
	if '-' in time_string:
		splitter = '-'
	elif ':' in time_string:
		splitter = ':'
	else:
		return(time_string)
	(mins, secs) = time_string.split(splitter)
	return(mins + '.' + secs)

if __name__ == '__main__':
	james = get_coach_data('james.txt')
	mikey = get_coach_data('mikey.txt')
	julie = get_coach_data('julie.txt')
	sarah = get_coach_data('sarah.txt')

	print(james['Name'] +"'s (Born:"+james['DOB']+") fastest times are " + james['Times'])
	print(mikey['Name'] +"'s (Born:"+mikey['DOB']+") fastest times are " + mikey['Times'])
	print(sarah['Name'] +"'s (Born:"+sarah['DOB']+") fastest times are " + sarah['Times'])
	print(julie['Name'] +"'s (Born:"+julie['DOB']+") fastest times are " + julie['Times'])
