# -*- coding: utf-8 -*-
from libfm import LibFM
from libfm import LibFMError
import json
import redis


class LastFM():

    '''
    初始化LastFM,连接redis server
    '''
    def __init__(self, redis):
        self.redis = redis

        # create a handler instance with API key and application secret
        self.lib_fm = LibFM('9b763a9a320e5719c1c9851fc7d71850', 'a10aa8e3f09af99b71d728953c6bd755')
        self.lib_fm.create_mobile_session('weixc1234', 'wxc16888')

    '''
    通过一个artist的名字得到与其相似的artist

    INPUT: artist  例如： 'Usher'
    ===
    OUTPUT: artist_list 形式为数组，每个元素为一个artist，包含属性url, image, name
    '''
    def get_similar_artists_by_artist(self, artist):
        info = self.lib_fm.read('artist.getInfo', artist = artist)
        similar = info["artist"]["similar"]["artist"]

        return similar

    '''
    通过一个artist的名字得到其最热门的歌曲

    INPUT: artist  例如： 'Usher'
    '''
    # TODO(wei) Change the return object
    def get_top_songs_by_artist(self, artist):
        info = self.lib_fm.read('artist.getTopTracks', artist = artist)
        for track in info["toptracks"]["track"]:
            print track
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

    '''
    根据artist得到对应的tags
    INPUT:artist
    ===
    OUTPUT: tags [Usher, ..., ...]
    '''
    def get_tags_by_artist(self, artist):
        info = self.lib_fm.read('artist.getTopTags', artist = artist)
        tags = [tag["name"] for tag in info["toptags"]["tag"]]
        return tags

    # TODO(wei) change the result of function
    def get_albums_by_artist(self, artist):
        info = self.lib_fm.read('artist.getTopAlbums', artist = artist)
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

        return list()

    # TODO(wei) get the songs of a album
    def get_songs_by_album(self, artist, album):
        info = self.lib_fm.read('album.getInfo', artist = artist, album = album)
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
        return list()


if __name__ == "__main__":

    r = redis.StrictRedis(host = "104.236.123.173")
    last_fm = LastFM(redis = r)
    last_fm.get_songs_by_album("Usher", "Confessions")
    # try:
    #     artist = r.lpop("artist")
    #
    #     # get similar artists and put them into the redis list
    #     artists_list = last_fm.get_similar_artists_by_artist(artist)
    #     for art in artists_list:
    #         r.lpush("artist", art)
    #
    #     # get the albums of artist
    #
    #     albums_list = last_fm.get_albums_by_artist(artist)
    #     # get the tracks by albums
    #     for album in albums_list:
    #         # TODO update artist-album-relation
    #         tracks = last_fm.get_songs_by_album(artist, album)
    #
    #
    #         for track in tracks:
    #             # TODO update track-artist-relation
    #             pass
    #
    # except LibFMError, err:
    #     print err
