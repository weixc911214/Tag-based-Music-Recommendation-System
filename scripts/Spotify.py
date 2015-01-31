from rq import Queue
from redis import Redis
from Count import count_words_at_url
import time
import spotipy
from Queue import Queue
import json
spotify = spotipy.Spotify()

'''
test Spotify API and down the data using APIs

'''

def get_artist_id_by_name(name):
	results = spotify.search(q='artist:' + name, type='artist')
	return results["artists"]["items"][0]["id"]

def get_artist_name_by_id(id):
	results = spotify.artist(id)
	return results["name"].encode("utf8")

def clear_redis(r):
	for key in r.keys():
		r.delete(key)
	print r.keys()


if __name__ == "__main__":
	name = "Justin Bieber"
	artist_id = get_artist_id_by_name(name)
	#print artist_id


	#Tell RQ what Redis connection to use
	r = Redis()

	if len(r.keys()) > 0:
		clear_redis(r)

	r.sadd(name, artist_id)

	output_file = open("artists_list", "w")

	q = Queue()
	q.put(artist_id)
	count = 1000

	while q.qsize() > 0 and count > 0:
		artist_id = q.get()
		content = json.dumps(spotify.artist(artist_id))
		output_file.write(content)
		output_file.write("\n")
		#print content
		print "artist: %s, id: %s, count: %d" %(get_artist_name_by_id(artist_id), str(artist_id), count)
		artists = spotify.artist_related_artists(artist_id)

		for artist in artists["artists"]:
			artist_name = artist["name"].encode("utf8")
			artist_id = artist["id"]
			if r.sadd(artist_name, artist_id) == 1:
				q.put(artist_id)
		count = count - 1
	output_file.close()