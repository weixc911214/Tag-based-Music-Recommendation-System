from rq import Queue
from redis import Redis
#from Count import count_words_at_url
import time
import spotipy
from Queue import Queue
import json
from libfm import LibFM
from libfm import LibFMError
import pymysql as sql
from random import randint
spotify = spotipy.Spotify()
lib_fm = LibFM('9b763a9a320e5719c1c9851fc7d71850', 'a10aa8e3f09af99b71d728953c6bd755')
lib_fm.create_mobile_session('weixc1234', 'wxc16888')

db = sql.connect(host='cs4111.cnjryr7wwjlv.us-west-2.rds.amazonaws.com', user='xw2355xw2353', passwd='musicrecommendation', db='cs4111', cursorclass=sql.cursors.DictCursor)
cursor = db.cursor()

tags_list = list()

'''
test Spotify API and down the data using APIs

'''

def get_artist_id_by_name(name):
	results = spotify.search(q='artist:' + name, type='artist')
	return results["artists"]["items"][0]["uri"]

def get_artist_name_by_id(id):
	results = spotify.artist(id)
	return results["name"].encode("utf8")

def clear_redis(r):
	for key in r.keys():
		r.delete(key)
	print r.keys()


def get_albums_by_artist(urn):
	# urn = 'spotify:artist:3jOstUTkEu2JkjvRdBA5Gu'
	results = spotify.artist_albums(urn, album_type='album')
	albums = results['items']

	return albums

def get_tags(artist):
	tags = artist["genres"]
	for tag in tags:
		if tag not in tags_list:
			tags_list.append(tag)

def update_artist(artist):
	

	name = artist["name"]
	popularity = artist["popularity"]
	image = ""
	try:
		image = artist["images"][-1]["url"]
	except:
		pass


	insert_sql = "insert into artists(artist_name, artist_image, popularity) values (\"%s\", \"%s\", \"%s\")" %(name, image, popularity)
	cursor.execute(insert_sql)
	db.commit()

	select_sql = "select * from artists where artist_name like \"%s\"" %name

	cursor.execute(select_sql)

	result = cursor.fetchall()
	artist_id = result[-1]["artist_id"]
	return artist_id, name
	# do the update

def update_album(album, artist_id, artist_name):
	#album_name = album["name"]
	album_name = album["name"]

	image = ""
	try:
		image = album["images"][-1]["url"]
	except:
		pass

	popularity = randint(0, 99)

	insert_sql = "insert into albums(album_name, image_url, artist_id, popularity) values(\"%s\", \"%s\", \"%s\", \"%s\")" %(album_name, image, artist_id, popularity)
	cursor.execute(insert_sql)
	db.commit()

	select_sql = "select * from albums where album_name like \"%s\"" %album_name

	cursor.execute(select_sql)

	result = cursor.fetchall()

	album_id = result[-1]["album_id"]
	#update_album_tag(album_name, artist_name)

	return album_id

def update_track_tag():

	for track_id in range(3344, 7193):
		for i in range(0, 3):
			tag_id = randint(16, 133)
			try:
				sql = "insert into tag_for_song(track_id, tag_id) values(\"%s\", \"%s\")" %(track_id, tag_id)
				cursor.execute(sql)
				db.commit()
			except:
				pass



	# try:
	# 	info = lib_fm.read('album.getTopTags', artist = artist_name, album = album_name)
	# except:
	# 	print "ERROR: %s do not have tags" %artist_name


def update_track(track, artist_id, album_id):
	#print track.keys()
	#print track.keys()
	track_name = track["name"]

	preview_url = track["preview_url"]
	popularity = randint(0, 99)

	try:
		insert_sql = "insert into songs(artist_id, album_id, resource_url, name, popularity) values (\"%s\", \"%s\", \"%s\", \"%s\", \"%s\")" %(artist_id, album_id, preview_url, track_name, popularity)
		cursor.execute(insert_sql)
		db.commit()

		select_sql = "select * from songs where name like \"%s\"" %track_name

		cursor.execute(select_sql)

		result = cursor.fetchall()

		track_id = result[-1]["track_id"]
	except:
		pass

	#print track_id

def update_tag(tags_list):
	for tag in tags_list:
		sql = "insert into tags(tag_name) values(\"%s\")" %tag
		cursor.execute(sql)
		db.commit()

def update_album_tag():
	for album_id in range(385, 663):
		for i in range(0, 3):
			tag_id = randint(16, 133)
			try:
				sql = "insert into tag_for_album(album_id, tag_id) values(\"%s\", \"%s\")" %(album_id, tag_id)
				cursor.execute(sql)
				db.commit()
			except:
				pass

if __name__ == "__main__":
	name = "Justin Bieber"

	artist_list = list()

	url = get_artist_id_by_name(name)
	#print artist_id
	artist_list.append(url)
	artists = spotify.artist_related_artists(url)

	input_file = open("artists_list")

	contents = input_file.readlines()



	print contents[1]
	#print artist_list

	for artist in contents[:50]:
		try:
			artist = json.loads(artist)
			#get_tags(artist)
			
			# update artist info to databse
			artist_id, artist_name = update_artist(artist)



			uri = artist["uri"]

			albums = get_albums_by_artist(uri)


			for album in albums:

				#print album
				#update album info in databse
				album_id = update_album(album, artist_id, artist_name)

				tmp_id = album["id"]

				tracks = spotify.album_tracks(tmp_id)

				tracks = tracks["items"]
				for track in tracks:
					update_track(track, artist_id, album_id)
					
			print "Finish insert artist: %s" %artist_name
		except:
			pass

		

	# #Tell RQ what Redis connection to use
	# update_tag(tags_list)
	
	#update_track_tag()
	#update_album_tag()


