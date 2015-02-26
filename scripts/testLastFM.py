from libfm import LibFM
from libfm import LibFMError
import json
# create a handler instance with API key and application secret
lib_fm = LibFM('9b763a9a320e5719c1c9851fc7d71850', 'a10aa8e3f09af99b71d728953c6bd755')

def get_artist_info(artist):

    info = lib_fm.read('artist.getInfo', artist = artist)
    bio = info["artist"]["bio"]
    name = info["artist"]["name"]
    tags = info["artist"]["tags"]
    image = info["artist"]["image"]
    similar = info["artist"]["similar"]

    taglist = list()
    for tag in tags["tag"]:
        taglist.append(tag["name"])
    #print taglist

    print json.dumps(taglist)

    artist_list = list()
    for artist in similar["artist"]:
        artist_list.append(artist["name"])

    print json.dumps(artist_list)

    print image[0]["#text"]

    return artist

def get_songs_by_artist(artist):
    info = lib_fm.read('artist.getTopTracks', artist = artist)
    for track in info["toptracks"]["track"]:
        name = track["name"]
        artist = track["artist"]
        url = track["url"]
        
        try:
            image = track["image"]
        except:
            image = ""

        print name
        if len(image) > 0:
            print image[0]["#text"]
        print url
        print artist

        print "----"


def get_albums_by_artist(artist):
    info = lib_fm.read('artist.getTopAlbums', artist = artist)
    for album in info["topalbums"]["album"]:
        name = album["name"]
        artist = album["artist"]
        url = album["url"]
        image = album["image"]
        
        print "artist: " + str(artist["name"])
        print "album_name: " + str(name)
        print "url: " + str(url)
        print "image: " + str(image[-1]["#text"])
        print "----"


def get_songs_by_album(artist, album):
    info = lib_fm.read('album.getInfo', artist = artist, album = album)
    for track in info["album"]["tracks"]["track"]:
        #print track
        name = track["name"]
        artist = track["artist"]
        url = track["url"]
        #print track["@attr"]
        #
        print name
        print artist["name"]
        print url

        print "---"


def get_tags_by_artist(artist):
    info = lib_fm.read('artist.getTopTags', artist = artist)
    for tag in info["toptags"]["tag"]:
        print tag["name"]

try:
    lib_fm.create_mobile_session('weixc1234', 'wxc16888')

    # simple read
    '''
    get the info of artist
    '''

    #info = lib_fm.read('artist.getInfo', artist='Usher')
    #get_songs_by_artist("Usher")
    get_tags_by_artist("Taylor Swift")


    # # simple write
    # lib_fm.write('artist.addTags', artist='Black Sabbath',
    #              tags='metal, classic rock')
except LibFMError, err:
    print err
