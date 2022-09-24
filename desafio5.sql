SELECT song.song_name AS cancao,
  COUNT(history.song_id) AS reproducoes
FROM SpotifyClone.songs AS song
INNER JOIN SpotifyClone.history_of_reproductions AS history ON song.song_id = history.song_id
GROUP BY song.song_id
ORDER BY  reproducoes DESC, cancao ASC
LIMIT 2;