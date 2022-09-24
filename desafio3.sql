SELECT user_name AS usuario,
  (SELECT COUNT(user_id) FROM SpotifyClone.history_of_reproductions ) AS qt_de_musicas_ouvidas
 FROM SpotifyClone.users