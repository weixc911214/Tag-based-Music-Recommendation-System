-- MySQL dump 10.13  Distrib 5.6.23, for osx10.8 (x86_64)
--
-- Host: cs4111.cnjryr7wwjlv.us-west-2.rds.amazonaws.com    Database: cs4111
-- ------------------------------------------------------
-- Server version	5.6.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `album_id` int(11) NOT NULL DEFAULT '0',
  `album_name` varchar(255) NOT NULL,
  `published_date` date DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `artist_id` int(11) NOT NULL,
  `description_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `album_artist_idx` (`artist_id`),
  CONSTRAINT `album_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Shake It Off',NULL,'http://userserve-ak.last.fm/serve/300x300/100639533.png',8,''),(2,'Red',NULL,'http://userserve-ak.last.fm/serve/300x300/100131453.png',8,''),(3,'Speak Now',NULL,'http://userserve-ak.last.fm/serve/300x300/88221907.png',8,''),(4,'Taylor Swift',NULL,'image: http://userserve-ak.last.fm/serve/300x300/101535007.png',8,''),(5,'We Are Never Ever Getting Back Together',NULL,'image: http://userserve-ak.last.fm/serve/300x300/81006257.png',8,''),(6,'I Knew You Were Trouble.',NULL,'image: http://userserve-ak.last.fm/serve/300x300/82750441.png',8,''),(7,'22',NULL,'http://userserve-ak.last.fm/serve/300x300/86819203.png',8,''),(8,'Songs About Jane',NULL,'http://userserve-ak.last.fm/serve/300x300/50461839.png',2,''),(9,'Maps',NULL,'http://userserve-ak.last.fm/serve/300x300/102731005.png',2,''),(10,'V',NULL,'http://userserve-ak.last.fm/serve/300x300/100770593.png',2,''),(11,'Overexposed',NULL,'http://userserve-ak.last.fm/serve/300x300/98970721.png',2,'');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL DEFAULT '0',
  `artist_name` varchar(255) NOT NULL,
  `artist_image` varchar(255) DEFAULT NULL,
  `artist_style` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Justin Timberlake','http://userserve-ak.last.fm/serve/34/98873013.png','[\"pop\", \"rnb\", \"dance\", \"male vocalists\", \"hip-hop\"]'),(2,'Maroon 5','http://userserve-ak.last.fm/serve/34/89687701.jpg','[\"rock\", \"pop\", \"pop rock\", \"alternative\", \"alternative rock\"]'),(3,'Bruno Mars','http://userserve-ak.last.fm/serve/34/77980442.png','[\"pop\", \"rnb\", \"male vocalists\", \"r&b\", \"slow jams\"]'),(4,'Jason Mraz','http://userserve-ak.last.fm/serve/34/20715175.jpg','[\"singer-songwriter\", \"acoustic\", \"pop\", \"alternative\", \"rock\"]'),(5,'OneRepublic','http://userserve-ak.last.fm/serve/34/90300835.png','[\"rock\", \"pop rock\", \"alternative\", \"alternative rock\", \"indie\"]'),(6,'Adele','http://userserve-ak.last.fm/serve/34/103557209.png','[\"soul\", \"female vocalists\", \"british\", \"singer-songwriter\", \"indie\"]'),(7,'Amy Winehouse','http://userserve-ak.last.fm/serve/34/27937567.png','[\"soul\", \"jazz\", \"female vocalists\", \"british\", \"singer-songwriter\"]'),(8,'Taylor Swift','http://userserve-ak.last.fm/serve/34/102229039.png','[\"country\", \"pop\", \"female vocalists\", \"singer-songwriter\", \"acoustic\"]'),(9,'One Direction','http://userserve-ak.last.fm/serve/34/102181231.png','[\"pop\", \"british\", \"one direction\", \"boyband\", \"x factor\"]'),(10,'Usher',NULL,'[\"rnb\", \"hip-hop\", \"pop\", \"soul\", \"rap\"]');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(255) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Big Machine Records');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listed_songs`
--

DROP TABLE IF EXISTS `listed_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listed_songs` (
  `track_id` int(11) NOT NULL DEFAULT '0',
  `list_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_id`,`list_id`),
  KEY `lists_FK_idx` (`list_id`),
  CONSTRAINT `lists_FK` FOREIGN KEY (`list_id`) REFERENCES `playlists` (`list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `songs_FK` FOREIGN KEY (`track_id`) REFERENCES `songs` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listed_songs`
--

LOCK TABLES `listed_songs` WRITE;
/*!40000 ALTER TABLE `listed_songs` DISABLE KEYS */;
INSERT INTO `listed_songs` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(3,2);
/*!40000 ALTER TABLE `listed_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists` (
  `list_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `description_type` varchar(45) DEFAULT NULL,
  `list_name` varchar(255) NOT NULL,
  PRIMARY KEY (`list_id`),
  KEY `user_list_idx` (`user_id`),
  CONSTRAINT `user_list` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,10,'','playlist1'),(2,2,'','playlist2'),(3,3,'','playlist3'),(4,4,'','playlist4'),(5,5,'','playlist5'),(6,6,'','playlist6'),(7,10,'','playlist7'),(8,2,'','playlist8'),(9,1,'','playlist9'),(10,10,'','playlist10');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefered_songs`
--

DROP TABLE IF EXISTS `prefered_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefered_songs` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `track_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`track_id`),
  KEY `prefered_songs_track_idx` (`track_id`),
  CONSTRAINT `prefered_songs_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prefered_songs_track` FOREIGN KEY (`track_id`) REFERENCES `songs` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefered_songs`
--

LOCK TABLES `prefered_songs` WRITE;
/*!40000 ALTER TABLE `prefered_songs` DISABLE KEYS */;
INSERT INTO `prefered_songs` VALUES (10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(10,11);
/*!40000 ALTER TABLE `prefered_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `album_id` int(11) NOT NULL DEFAULT '0',
  `artist_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`artist_id`,`company_id`),
  KEY `artist_public_idx` (`artist_id`),
  KEY `company_public_idx` (`company_id`),
  CONSTRAINT `artist_public` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_public` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `company_public` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,8,1),(2,8,1),(3,8,1),(4,8,1),(5,8,1),(6,8,1),(7,8,1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `track_id` int(11) NOT NULL DEFAULT '0',
  `artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `resource_url` varchar(255) DEFAULT NULL,
  `description_type` varchar(45) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`track_id`),
  KEY `album_song_idx` (`album_id`),
  KEY `artist_song_idx` (`artist_id`),
  CONSTRAINT `album_song` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `artist_song` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,8,3,'http://www.last.fm/music/Taylor+Swift/_/Mine+(Karaoke+Version)','','Mine (Karaoke Version)'),(2,8,3,'http://www.last.fm/music/Taylor+Swift/_/Sparks+Fly+(Karaoke+Version)','','Sparks Fly (Karaoke Version)'),(3,8,3,'http://www.last.fm/music/Taylor+Swift/_/Back+To+December+(Karaoke+Version)','','Back To December (Karaoke Version)'),(4,8,3,'http://www.last.fm/music/Taylor+Swift/_/Speak+Now+(Karaoke+Version)','','Speak Now (Karaoke Version)'),(5,8,3,'http://www.last.fm/music/Taylor+Swift/_/Dear+John+(Karaoke+Version)','','Dear John (Karaoke Version)'),(6,8,3,'http://www.last.fm/music/Taylor+Swift/_/Mean+(Karaoke+Version)','','Mean (Karaoke Version)'),(7,8,3,'http://www.last.fm/music/Taylor+Swift/_/The+Story+Of+Us+(Karaoke+Version)','','The Story Of Us (Karaoke Version)'),(8,8,3,'http://www.last.fm/music/Taylor+Swift/_/Never+Grow+Up+(Karaoke+Version)','','Never Grow Up (Karaoke Version)'),(9,8,3,'http://www.last.fm/music/Taylor+Swift/_/Enchanted+(Karaoke+Version)','','Enchanted (Karaoke Version)'),(10,8,3,'http://www.last.fm/music/Taylor+Swift/_/Better+Than+Revenge+(Karaoke+Version)','','Better Than Revenge (Karaoke Version)'),(11,8,3,'http://www.last.fm/music/Taylor+Swift/_/Innocent+(Karaoke+Version)','','Innocent (Karaoke Version)'),(12,8,3,'http://www.last.fm/music/Taylor+Swift/_/Haunted+(Karaoke+Version)','','Haunted (Karaoke Version)'),(13,8,3,'http://www.last.fm/music/Taylor+Swift/_/Last+Kiss+(Karaoke+Version)','','Last Kiss (Karaoke Version)');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_for_album`
--

DROP TABLE IF EXISTS `tag_for_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_for_album` (
  `tag_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`album_id`),
  KEY `to_album_idx` (`album_id`),
  CONSTRAINT `tag_to_tag_for_album` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `album_to_tag_for_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_for_album`
--

LOCK TABLES `tag_for_album` WRITE;
/*!40000 ALTER TABLE `tag_for_album` DISABLE KEYS */;
INSERT INTO `tag_for_album` VALUES (1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3);
/*!40000 ALTER TABLE `tag_for_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_for_list`
--

DROP TABLE IF EXISTS `tag_for_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_for_list` (
  `tag_id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`list_id`),
  KEY `to_list_idx` (`list_id`),
  CONSTRAINT `to_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `to_list` FOREIGN KEY (`list_id`) REFERENCES `playlists` (`list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_for_list`
--

LOCK TABLES `tag_for_list` WRITE;
/*!40000 ALTER TABLE `tag_for_list` DISABLE KEYS */;
INSERT INTO `tag_for_list` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `tag_for_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_for_song`
--

DROP TABLE IF EXISTS `tag_for_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_for_song` (
  `tag_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`track_id`),
  KEY `track_to_tag_for_song_idx` (`track_id`),
  CONSTRAINT `tag_to_tag_for_song` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `track_to_tag_for_song` FOREIGN KEY (`track_id`) REFERENCES `songs` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_for_song`
--

LOCK TABLES `tag_for_song` WRITE;
/*!40000 ALTER TABLE `tag_for_song` DISABLE KEYS */;
INSERT INTO `tag_for_song` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `tag_for_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `tag_type` varchar(255) DEFAULT NULL,
  `tag_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'','country'),(2,'','pop'),(3,'','female vocalists'),(4,'','singer-songwriter'),(5,'','acoustic'),(6,'','taylor swift'),(7,'','country pop'),(8,'','american'),(9,'','female vocalist'),(10,'','female'),(11,'','contemporary country'),(12,'','Love'),(13,'','00s'),(14,'','modern country');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'root','',''),(1,'xw2353','xw2353',''),(2,'aaaaa','aaaaa',''),(3,'bbbbb','bbbbb',''),(4,'ccccc','ccccc',''),(5,'ddddd','ddddd',''),(6,'eeeee','eeeee',''),(7,'fffff','fffff',''),(8,'ggggg','ggggg',''),(9,'hhhhh','hhhhh',''),(10,'admin','admin','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-25 23:06:38
