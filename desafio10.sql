SELECT
	song.song_name AS nome,
  COUNT(hi.song_id) AS reproducoes
  FROM SpotifyClone.history_of_reproductions AS hi
INNER JOIN SpotifyClone.songs AS song
	ON song.song_id = hi.song_id
INNER JOIN SpotifyClone.users AS us
	ON hi.user_id = us.user_id
WHERE us.plan_id = 1 OR us.plan_id = 3
GROUP BY
	song.song_name
ORDER BY nome;