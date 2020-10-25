#!/usr/bin/python3

class Athlete(list):
	def __init__(self, a_name,a_dob,times):
		list.__init__([])
		self.name = a_name
		self.dob = a_dob
		self.extend(times)

	@property
	def top3(self):
		return(sorted(set([self.sanitize(i) for i in self]))[0:3])

	def sanitize(self,time_string):
		if '-' in time_string:
			splitter = '-'
		elif ':' in time_string:
			splitter = ':'
		else:
			return(time_string)
		(mins, secs) = time_string.split(splitter)
		return(mins + '.' + secs)
