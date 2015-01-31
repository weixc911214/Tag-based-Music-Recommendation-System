import json

'''
test file to print the contents of artists_list downloaded from Spotify

'''

input_file = open("artists_list")

contents = input_file.readlines()
count = 0
for line in contents[:5]:
	artist = json.loads(line)
	if artist["popularity"] > 80:
		#print count
		count = count + 1
		print artist
		#print artist["name"].encode("utf8")
		#print artist["popularity"]