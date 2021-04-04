-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.1.72-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for music
CREATE DATABASE IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `music`;

-- Dumping structure for table music.album
CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  `date_release` datetime DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `genres_id` int(11) DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_id` (`genres_id`),
  KEY `added_by_user_id` (`added_by_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table music.album: 1 rows
DELETE FROM `album`;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` (`id`, `title`, `cover_image`, `date_release`, `date_added`, `date_modified`, `genres_id`, `added_by_user_id`) VALUES
	(1, 'Album 1', NULL, '1970-01-01 00:00:00', '2021-04-03 21:58:57', '2021-04-03 21:58:57', 1, 1);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;

-- Dumping structure for table music.albums_artists
CREATE TABLE IF NOT EXISTS `albums_artists` (
  `album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`artist_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.albums_artists: 0 rows
DELETE FROM `albums_artists`;
/*!40000 ALTER TABLE `albums_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums_artists` ENABLE KEYS */;

-- Dumping structure for table music.album_rating
CREATE TABLE IF NOT EXISTS `album_rating` (
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`album_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.album_rating: 0 rows
DELETE FROM `album_rating`;
/*!40000 ALTER TABLE `album_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_rating` ENABLE KEYS */;

-- Dumping structure for table music.artist
CREATE TABLE IF NOT EXISTS `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `avatar_file` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `info` text,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by_user_id` (`added_by_user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table music.artist: 1 rows
DELETE FROM `artist`;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` (`id`, `name`, `avatar_file`, `country`, `info`, `date_added`, `date_modified`, `added_by_user_id`) VALUES
	(1, 'Artist 1', NULL, NULL, NULL, '2021-04-03 21:58:57', '2021-04-03 21:58:57', 1);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;

-- Dumping structure for table music.genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table music.genre: 1 rows
DELETE FROM `genre`;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id`, `name`) VALUES
	(1, 'Nhạc trẻ');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Dumping structure for table music.playlist
CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by_user_id` (`added_by_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.playlist: 0 rows
DELETE FROM `playlist`;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;

-- Dumping structure for table music.playlists_tracks
CREATE TABLE IF NOT EXISTS `playlists_tracks` (
  `playlist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `track_id` (`track_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.playlists_tracks: 0 rows
DELETE FROM `playlists_tracks`;
/*!40000 ALTER TABLE `playlists_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_tracks` ENABLE KEYS */;

-- Dumping structure for table music.playlist_rating
CREATE TABLE IF NOT EXISTS `playlist_rating` (
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`playlist_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.playlist_rating: 0 rows
DELETE FROM `playlist_rating`;
/*!40000 ALTER TABLE `playlist_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_rating` ENABLE KEYS */;

-- Dumping structure for table music.play_count
CREATE TABLE IF NOT EXISTS `play_count` (
  `track_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`track_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.play_count: 0 rows
DELETE FROM `play_count`;
/*!40000 ALTER TABLE `play_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `play_count` ENABLE KEYS */;

-- Dumping structure for table music.track
CREATE TABLE IF NOT EXISTS `track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by_user_id` (`added_by_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.track: 0 rows
DELETE FROM `track`;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
/*!40000 ALTER TABLE `track` ENABLE KEYS */;

-- Dumping structure for table music.tracks_artists
CREATE TABLE IF NOT EXISTS `tracks_artists` (
  `track_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`track_id`,`artist_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.tracks_artists: 0 rows
DELETE FROM `tracks_artists`;
/*!40000 ALTER TABLE `tracks_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracks_artists` ENABLE KEYS */;

-- Dumping structure for table music.track_rating
CREATE TABLE IF NOT EXISTS `track_rating` (
  `track_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `star` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`track_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table music.track_rating: 0 rows
DELETE FROM `track_rating`;
/*!40000 ALTER TABLE `track_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_rating` ENABLE KEYS */;

-- Dumping structure for table music.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `roles` int(11) DEFAULT NULL,
  `avatar_file` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `otp_code` varchar(10) DEFAULT NULL,
  `otp_expiration_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table music.user: 1 rows
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `roles`, `avatar_file`, `date_created`, `otp_code`, `otp_expiration_datetime`) VALUES
	(1, 'Sang', 'abc@abc.xyz', '1234', NULL, NULL, '2021-04-03 21:58:57', NULL, '1970-01-01 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
