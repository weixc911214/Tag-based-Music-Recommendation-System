-- Created by Xuejun Wang(xw2355) & Xiaochen Wei(xw2353)
-- Created on Feb, 25, 2015, Wednesday
-- For w4111 Project 1 part 2
-- Intersting query examples

-- 1. find out music taste of a user 10
-- by finding out tags associated with the songs a user likes
Select T.tag_name 
from tags T, tag_for_song TS, prefered_songs P
where T.tag_id = TS.tag_id
	and TS.track_id = P.track_id and P.user_id = 10;

-- 2. find out the name of the artist whose song is liked most by user 1111
-- The name of the artist whose songs have the highest number of 
-- occurances in user 1111 prefered_songs
-- First find number of occurances for all artists whose songs is liked by user
create view Count
as select S.artist_id as artist_id, count(S.artist_id) as artist_count
from songs S, prefered_songs P
where S.track_id = P.track_id and P.user_id = 10
group by S.artist_id;
-- then find the maximum 
select A.artist_name
from artists A, Count C
where A.artist_id = C.artist_id and C.artist_count = (select max(C.artist_count) from Count C);
drop view Count;


-- 3. The name of the users who have included the same song in their playlists
select U.user_name
from users U, playlists PL, listed_songs LS, songs S
where S.name like '%Back To December_%' and S.track_id = LS.track_id and LS.list_id = PL.list_id
	and PL.user_id = U.user_id;
