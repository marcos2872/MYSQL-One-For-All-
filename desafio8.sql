SELECT artist.artist_name AS artista,
  album.album_name AS album
FROM SpotifyClone.artists AS artist
INNER JOIN SpotifyClone.albums AS album ON album.artist_id = artist.artist_id
WHERE artist.artist_name = "Elis Regina"
GROUP BY  artista, album
ORDER BY  artista ASC, album;