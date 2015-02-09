-- For: W4111 Intro to DBs Project 1.1
-- Created by: Xuejun Wang, Xiaochen Wei
-- Created on: Feb 8th 2015

-- tables

-- Table album
CREATE TABLE albums (
    album_id int    NOT NULL ,
    album_name varchar(255)    NOT NULL ,
    published_date date    NOT NULL ,
    image_url varchar(255)    NOT NULL ,
    artist_id int    NOT NULL ,
    CONSTRAINT album_pk PRIMARY KEY (album_id)
);

-- Table artists
CREATE TABLE artists (
    artist_id int    NOT NULL ,
    artist_name varchar(255)    NOT NULL ,
    artist_image varchar(255)    NOT NULL ,
    artist_style varchar(255)    NOT NULL ,
    CONSTRAINT artists_pk PRIMARY KEY (artist_id)
);

-- Table companies
CREATE TABLE companies (
    company_id int    NOT NULL ,
    company_name varchar(255)    NOT NULL ,
    CONSTRAINT companies_pk PRIMARY KEY (company_id)
);

-- Table playlists
CREATE TABLE playlists (
    list_id int    NOT NULL ,
    user_id int    NOT NULL ,
    list_name varchar(255)    NOT NULL ,
    CONSTRAINT playlists_pk PRIMARY KEY (list_id,user_id,tag_id)
);

-- Table prefered_songs
CREATE TABLE prefered_songs (
    user_id int    NOT NULL ,
    track_id int    NOT NULL ,
    CONSTRAINT prefered_songs_pk PRIMARY KEY (user_id,track_id)
);

-- Table publications
CREATE TABLE publications (
    album_id int    NOT NULL ,
    artist_id int    NOT NULL ,
    company_id int    NOT NULL ,
    CONSTRAINT publications_pk PRIMARY KEY (album_id,artist_id,company_id)
);

-- Table songs
CREATE TABLE songs (
    track_id int    NOT NULL ,
    artist_id int    NOT NULL ,
    album_id int    NOT NULL ,
    resource_url varchar(255)    NOT NULL ,
    name varchar(255)    NOT NULL ,
    CONSTRAINT songs_pk PRIMARY KEY (track_id)
);

-- Table tags
CREATE TABLE tags (
    tag_id int    NOT NULL ,
    tag_type varchar(255)    NOT NULL ,
    tag_name varchar(255)    NOT NULL ,
    CONSTRAINT tags_pk PRIMARY KEY (tag_id)
);

-- Table users
CREATE TABLE users (
    user_id int    NOT NULL ,
    user_name varchar(255)    NOT NULL ,
    user_pwd varchar(255)    NOT NULL ,
    profile varchar(255)    NOT NULL ,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
);

-- Table descriptions
CREATE TABLE descriptions (
    tag_id int    NOT NULL ,
    description_id int    NOT NULL ,
    description_type int    NOT NULL ,
    CONSTRAINT descriptions_pk PRIMARY KEY (tag_id, description_type, description_id)
);


-- Table descriptions
CREATE TABLE listed_songs (
    track_id int    NOT NULL ,
    list_id int    NOT NULL ,
    CONSTRAINT descriptions_pk PRIMARY KEY (track_id, list_id)
);

-- foreign keys

-- Reference:  listed_songs (table: playlists)
ALTER TABLE listed_songs ADD CONSTRAINT lists_FK FOREIGN KEY listed_songs (list_id)
    REFERENCES playlists (list_id);

-- Reference:  listed_songs (table: songs)
ALTER TABLE listed_songs ADD CONSTRAINT songs_FK FOREIGN KEY listed_songs (track_id)
    REFERENCES songs (track_id);

-- Reference:  descriptions (table: tags)
ALTER TABLE descriptions ADD CONSTRAINT descriptions FOREIGN KEY descriptions (tag_id)
    REFERENCES tags (tag_id);


-- Reference:  album_publications (table: album)


ALTER TABLE albums ADD CONSTRAINT album_publications FOREIGN KEY album_publications (album_id)
    REFERENCES publications (album_id)
    ON DELETE CASCADE
    ON UPDATE SET DEFAULT;
-- Reference:  album_song (table: album)


ALTER TABLE albums ADD CONSTRAINT album_song FOREIGN KEY album_song (album_id)
    REFERENCES songs (tag_id)
    ON DELETE CASCADE
    ON UPDATE SET DEFAULT;
-- Reference:  album_tags (table: tags)


-- ALTER TABLE tags ADD CONSTRAINT album_tags FOREIGN KEY album_tags (tag_id)
--     REFERENCES album (tag_id);
-- Reference:  artists_album (table: artists)


ALTER TABLE artists ADD CONSTRAINT artists_album FOREIGN KEY artists_album (artist_id)
    REFERENCES album (artist_id);
-- Reference:  playlists_songs (table: playlists)


ALTER TABLE playlists ADD CONSTRAINT playlists_songs FOREIGN KEY playlists_songs (track_id)
    REFERENCES songs (track_id)
    ON DELETE CASCADE
    ON UPDATE SET NULL;
-- Reference:  playlists_tags (table: tags)


-- ALTER TABLE tags ADD CONSTRAINT playlists_tags FOREIGN KEY playlists_tags (tag_id)
--     REFERENCES playlists (tag_id);
-- Reference:  prefered_songs_users (table: users)


ALTER TABLE users ADD CONSTRAINT prefered_songs_users FOREIGN KEY prefered_songs_users (user_id)
    REFERENCES prefered_songs (user_id)
    ON DELETE CASCADE
    ON UPDATE SET DEFAULT;
-- Reference:  publications_artists (table: publications)


ALTER TABLE publications ADD CONSTRAINT publications_artists FOREIGN KEY publications_artists (artist_id)
    REFERENCES artists (artist_id);
-- Reference:  publications_companies (table: companies)


ALTER TABLE companies ADD CONSTRAINT publications_companies FOREIGN KEY publications_companies (company_id)
    REFERENCES publications (company_id);
-- Reference:  song_tags (table: tags)


-- ALTER TABLE tags ADD CONSTRAINT song_tags FOREIGN KEY song_tags (tag_id)
--     REFERENCES songs (tag_id);
-- Reference:  songs_artists (table: artists)


ALTER TABLE artists ADD CONSTRAINT songs_artists FOREIGN KEY songs_artists (artist_id)
    REFERENCES songs (artist_id);
-- Reference:  songs_prefered_songs (table: songs)


ALTER TABLE songs ADD CONSTRAINT songs_prefered_songs FOREIGN KEY songs_prefered_songs (track_id)
    REFERENCES prefered_songs (track_id)
    ON DELETE CASCADE
    ON UPDATE SET DEFAULT;
-- Reference:  users_playlists (table: playlists)


ALTER TABLE playlists ADD CONSTRAINT users_playlists FOREIGN KEY users_playlists (user_id)
    REFERENCES users (user_id)
    ON DELETE CASCADE
    ON UPDATE SET DEFAULT;



-- End of file.

