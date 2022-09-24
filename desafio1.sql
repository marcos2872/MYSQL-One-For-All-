DROP database IF EXISTS SpotifyClone ;
CREATE database IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.plans (
  plan_id INT AUTO_INCREMENT PRIMARY KEY,
  plan_category VARCHAR(50) NOT NULL,
  plan_price DOUBLE NOT NULL,
  INDEX plan_category (plan_category ASC),
  INDEX plan_price (plan_price ASC))
ENGINE = InnoDB;

 INSERT INTO SpotifyClone.plans (plan_category, plan_price)
  VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

CREATE TABLE IF NOT EXISTS SpotifyClone.users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_age INT NOT NULL,
  user_signature VARCHAR(50) NOT NULL,
  plan_id INT,
  FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
  INDEX user_age (user_age ASC),
  INDEX user_name (user_name ASC))
ENGINE = InnoDB;

  INSERT INTO SpotifyClone.users (user_name, user_age, user_signature, plan_id )
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1), ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4), ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4), ('Paulo Freire', 19 , '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2), ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3), ('Jorge Amado', 58, '2017-02-17', 3);
    
CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(50) NOT NULL,
  INDEX artist_name (artist_name ASC))
ENGINE = InnoDB;

  INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
    ('Beyoncé'), ('Queen'), ('Elis Regina'),
    ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');
    
CREATE TABLE IF NOT EXISTS SpotifyClone.albums (
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(50) NOT NULL,
  album_release INT(5) NOT NULL,
  artist_id INT,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
  INDEX album_release (album_release ASC),
  INDEX album_name (album_name ASC))
ENGINE = InnoDB;

  INSERT INTO SpotifyClone.albums (album_name, album_release, artist_id)
  VALUES
    ('Renaissance', 2022, 1), ('Jazz', 1978, 2), ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3), ('Vento de Maio', 2001, 3), ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5), ('I Put A Spell On You', 2012, 6);

CREATE TABLE SpotifyClone.songs(
    song_id INT AUTO_INCREMENT  PRIMARY KEY,
    song_name VARCHAR(45) NOT NULL,
    lasting_seconds INT NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    FOREIGN KEY (album_id) REFERENCES albums (album_id))
ENGINE = InnoDB;

  INSERT INTO SpotifyClone.songs (song_name, lasting_seconds, album_id, artist_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1), ('VIRGO`S GROOVE', 369, 1, 1), ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don`t Stop Me Now', 203, 2 ,2), ('Under Pressure', 152, 3, 2), ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 	207, 5, 3), ('Samba em Paris', 267, 6, 4),
    ('The Bard`s Song', 244, 7, 5), ('Feeling Good', 100, 8, 6);

CREATE TABLE IF NOT EXISTS SpotifyClone.history_of_reproductions (
  history_of_reproduction DATETIME NOT NULL,
  song_id INT,
  user_id INT,
  FOREIGN KEY (song_id) REFERENCES songs (song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT PRIMARY KEY(song_id, user_id),
  INDEX history_of_reproduction (history_of_reproduction ASC))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.history_of_reproductions (history_of_reproduction, song_id, user_id)
  VALUES
    ('2022-02-28 10:45:55', 8, 1), ('2020-05-02 05:30:35', 2, 1), ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2), ('2020-01-02 07:40:33', 7, 2), ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3), ('2021-08-15 17:10:10', 8, 4), ('2022-01-09 01:44:33', 8, 5),
    ('2020-08-06 15:23:43', 5 ,5), ('2017-01-24 00:31:17', 7, 6), ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7), ('2012-03-17 14:56:41', 4, 8), ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);

CREATE TABLE SpotifyClone.followers(
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    CONSTRAINT PRIMARY KEY(artist_id, user_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.followers(user_id, artist_id)
  VALUES
    (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4),
    (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);