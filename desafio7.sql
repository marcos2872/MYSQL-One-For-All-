SELECT artist.artist_name AS artista,
  album.album_name AS album,
  COUNT(fllo.artist_id) AS seguidores
FROM SpotifyClone.artists AS artist
INNER JOIN SpotifyClone.albums AS album ON album.artist_id = artist.artist_id
INNER JOIN SpotifyClone.followers AS fllo ON artist.artist_id = fllo.artist_id
GROUP BY  artista, album
ORDER BY seguidores DESC, artista ASC, album;