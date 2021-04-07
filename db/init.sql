-- --------------------------------------------------------
-- Host:                         10.10.10.105
-- Server version:               10.4.17-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for music
CREATE DATABASE IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `music`;

-- Dumping structure for table music.album
CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  `year_release` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `genre_name` varchar(100) DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_name` (`genre_name`),
  KEY `added_by_user_id` (`added_by_user_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`genre_name`) REFERENCES `genre` (`name`),
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`added_by_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.album: ~3 rows (approximately)
DELETE FROM `album`;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` (`id`, `title`, `cover_image`, `year_release`, `date_added`, `date_modified`, `genre_name`, `added_by_user_id`) VALUES
	(1, 'Album 1', 'al-1', 2021, '2021-04-07 08:47:17', '2021-04-07 08:47:17', 'Genre 1', 1),
	(2, 'Album 2', 'al-2', 2020, '2021-04-07 08:47:17', '2021-04-07 08:47:17', 'Genre 1', 1),
	(3, 'Album 3', 'al-3', 2018, '2021-04-07 08:47:17', '2021-04-07 08:47:17', 'Genre 2', 1);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;

-- Dumping structure for table music.albums_artists
CREATE TABLE IF NOT EXISTS `albums_artists` (
  `album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`artist_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `albums_artists_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `albums_artists_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.albums_artists: ~4 rows (approximately)
DELETE FROM `albums_artists`;
/*!40000 ALTER TABLE `albums_artists` DISABLE KEYS */;
INSERT INTO `albums_artists` (`album_id`, `artist_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 3);
/*!40000 ALTER TABLE `albums_artists` ENABLE KEYS */;

-- Dumping structure for table music.album_rating
CREATE TABLE IF NOT EXISTS `album_rating` (
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`album_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `album_rating_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `album_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.album_rating: ~0 rows (approximately)
DELETE FROM `album_rating`;
/*!40000 ALTER TABLE `album_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_rating` ENABLE KEYS */;

-- Dumping structure for table music.artist
CREATE TABLE IF NOT EXISTS `artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `avatar_file` varchar(100) DEFAULT NULL,
  `cover_file` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by_user_id` (`added_by_user_id`),
  CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`added_by_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.artist: ~3 rows (approximately)
DELETE FROM `artist`;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` (`id`, `name`, `avatar_file`, `cover_file`, `description`, `date_added`, `date_modified`, `added_by_user_id`) VALUES
	(1, 'Artist 1', 'at-1', 'at-cv-1', 'hông có gì cả!!', '2021-04-07 08:47:18', '2021-04-07 08:47:18', 1),
	(2, 'Artist 2', 'at-2', 'at-cv-2', 'hông có gì cả!!', '2021-04-07 08:47:18', '2021-04-07 08:47:18', 1),
	(3, 'Artist 3', 'at-3', 'at-cv-3', 'hông có gì cả!!', '2021-04-07 08:47:18', '2021-04-07 08:47:18', 1);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;

-- Dumping structure for table music.genre
CREATE TABLE IF NOT EXISTS `genre` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.genre: ~2 rows (approximately)
DELETE FROM `genre`;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`name`) VALUES
	('Genre 1'),
	('Genre 2');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Dumping structure for table music.played
CREATE TABLE IF NOT EXISTS `played` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `track_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `played_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `played_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.played: ~3 rows (approximately)
DELETE FROM `played`;
/*!40000 ALTER TABLE `played` DISABLE KEYS */;
INSERT INTO `played` (`id`, `user_id`, `track_id`, `count`, `time`) VALUES
	(1, 1, 1, 1, '2021-04-07 08:47:18'),
	(2, 1, 2, 1, '2021-04-07 08:47:19'),
	(3, 1, 1, 2, '2021-04-07 08:47:19');
/*!40000 ALTER TABLE `played` ENABLE KEYS */;

-- Dumping structure for table music.playlist
CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by_user_id` (`added_by_user_id`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`added_by_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.playlist: ~2 rows (approximately)
DELETE FROM `playlist`;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` (`id`, `name`, `is_public`, `date_added`, `date_modified`, `added_by_user_id`) VALUES
	(1, 'Playlist 1', 1, '2021-04-07 08:47:18', '2021-04-07 08:47:18', 1),
	(2, 'Playlist 2', 1, '2021-04-07 08:47:18', '2021-04-07 08:47:18', 1);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;

-- Dumping structure for table music.playlists_tracks
CREATE TABLE IF NOT EXISTS `playlists_tracks` (
  `playlist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `playlists_tracks_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlists_tracks_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.playlists_tracks: ~2 rows (approximately)
DELETE FROM `playlists_tracks`;
/*!40000 ALTER TABLE `playlists_tracks` DISABLE KEYS */;
INSERT INTO `playlists_tracks` (`playlist_id`, `track_id`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `playlists_tracks` ENABLE KEYS */;

-- Dumping structure for table music.playlist_rating
CREATE TABLE IF NOT EXISTS `playlist_rating` (
  `playlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`playlist_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `playlist_rating_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlist_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.playlist_rating: ~0 rows (approximately)
DELETE FROM `playlist_rating`;
/*!40000 ALTER TABLE `playlist_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_rating` ENABLE KEYS */;

-- Dumping structure for table music.track
CREATE TABLE IF NOT EXISTS `track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `genre_name` varchar(100) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `added_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_name` (`genre_name`),
  KEY `album_id` (`album_id`),
  KEY `added_by_user_id` (`added_by_user_id`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`genre_name`) REFERENCES `genre` (`name`),
  CONSTRAINT `track_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `track_ibfk_3` FOREIGN KEY (`added_by_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.track: ~2 rows (approximately)
DELETE FROM `track`;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` (`id`, `name`, `duration`, `date_added`, `date_modified`, `genre_name`, `album_id`, `added_by_user_id`) VALUES
	(1, 'Track 1', 120, '2021-04-07 08:47:18', '2021-04-07 08:47:18', 'Genre 1', 1, 1),
	(2, 'Track 2', 120, '2021-04-07 08:47:18', '2021-04-07 08:47:18', 'Genre 1', 1, 1);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;

-- Dumping structure for table music.tracks_artists
CREATE TABLE IF NOT EXISTS `tracks_artists` (
  `track_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`track_id`,`artist_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `tracks_artists_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  CONSTRAINT `tracks_artists_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.tracks_artists: ~3 rows (approximately)
DELETE FROM `tracks_artists`;
/*!40000 ALTER TABLE `tracks_artists` DISABLE KEYS */;
INSERT INTO `tracks_artists` (`track_id`, `artist_id`) VALUES
	(1, 1),
	(1, 2),
	(2, 1);
/*!40000 ALTER TABLE `tracks_artists` ENABLE KEYS */;

-- Dumping structure for table music.track_rating
CREATE TABLE IF NOT EXISTS `track_rating` (
  `track_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`track_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `track_rating_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  CONSTRAINT `track_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.track_rating: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table music.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `roles`, `avatar_file`, `date_created`, `otp_code`, `otp_expiration_datetime`) VALUES
	(1, 'Sang', 'u1@gmail.com', 'pbkdf2:sha256:150000$0g8bHcwy$5b842bc3f8290e60e33077fd1e5103646d64b32bf55140e13696e7ea08081107', NULL, NULL, '2021-04-07 08:47:17', NULL, '1970-01-01 00:00:00'),
	(2, 'User 2', 'u2@gmail.com', 'pbkdf2:sha256:150000$vTbN8ytI$916e5f359e49347dc7ca6ad22b58a8e9b0eaf0b2ccb81ce55f849df7caf8c248', NULL, NULL, '2021-04-07 08:47:17', NULL, '1970-01-01 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
