SELECT us.user_name AS usuario,
  COUNT(hi.history_of_reproduction) AS qt_de_musicas_ouvidas,
  ROUND((SUM(son.lasting_seconds)) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.history_of_reproductions AS hi ON hi.user_id = us.user_id
INNER JOIN SpotifyClone.songs AS son ON son.song_id = hi.song_id
GROUP BY us.user_name
ORDER BY us.user_name;