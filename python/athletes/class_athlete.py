#!/usr/bin/python3

class Athlete(list):
	def __init__(self, a_name, a_dob=None, times=[]):
		list.__init__([])
		self.name = a_name
		self.dob = a_dob
		self.extend(times)

	def top3(self):
		return (sorted(set([sanitize(i) for i in self]))[0:3])

def get_coach_data(filename):
	try:
		with open(filename) as f:
			data = f.readline()
			temp1 = data.strip().split(',')
			return (Athlete(temp1.pop(0), temp1.pop(0), temp1))
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

	print(james.name +"'s (Born:"+james.dob+") fastest times are " + str(james.top3()))
	print(mikey.name +"'s (Born:"+mikey.dob+") fastest times are " + str(mikey.top3()))
	print(sarah.name +"'s (Born:"+sarah.dob+") fastest times are " + str(sarah.top3()))
	print(julie.name +"'s (Born:"+julie.dob+") fastest times are " + str(julie.top3()))
