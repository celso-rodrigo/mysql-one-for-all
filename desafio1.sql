DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.subscriptions(
  subscription_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
  subscription_type VARCHAR(13) NOT NULL,
  subscription_cost FLOAT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.users(
  user_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
  username VARCHAR(30) NOT NULL,
  user_age INT NOT NULL,
  subscription_type_id INT NOT NULL,
  subscription_date DATETIME NOT NULL,
  FOREIGN KEY (subscription_type_id) REFERENCES subscriptions (subscription_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.artist(
  artist_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
  artist_name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
  album_name VARCHAR(40) NOT NULL,
  artist_id INT NOT NULL,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
  song_name VARCHAR(40) NOT NULL,
  artist_id INT NOT NULL,
  album_id  INT NOT NULL,
  length_seconds INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  FOREIGN KEY (album_id) REFERENCES album (album_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.playback_history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  listened_date DATE NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id)
) ENGINE=InnoDB;

CREATE TABLE SpotifyClone.artist_followers(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.subscriptions 
(subscription_type, subscription_cost) VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users 
(username, user_age, subscription_type_id, subscription_date) VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artist 
(artist_name) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.album 
(album_name, artist_id, release_year) VALUES
  ('Renaissance', 1, 2022),
  ('jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.songs 
(song_name, artist_id, album_id, length_seconds) VALUES
  ('BREAK MY SOUL', 1, 1, 279),
  ('VIRGO’S GROOVE', 1, 1, 369),
  ('ALIEN SUPERSTAR', 1, 1, 116),
  ('Don’t Stop Me Now', 2, 2, 203),
  ('Under Pressure', 2, 3, 152),
  ('Como Nossos Pais', 3, 4, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
  ('Samba em Paris', 4, 6, 267),
  ('The Bard’s Song', 5, 7, 244),
  ('Feeling Good', 6, 8, 100);

INSERT INTO SpotifyClone.playback_history 
(user_id, song_id, listened_date) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.artist_followers 
(user_id, artist_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
