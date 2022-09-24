SELECT COUNT(hi.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.history_of_reproductions AS hi
INNER JOIN SpotifyClone.users AS us ON us.user_id = hi.user_id
WHERE us.user_name = "Barbara Liskov";