SELECT
	song.song_name AS nome_musica,
  CASE
		WHEN song.song_name LIKE '%Bard%' THEN REPLACE("The Bard’s Song", 'Bard', 'QA')
    WHEN song.song_name LIKE '%Amar%' THEN REPLACE('O Medo de Amar é o Medo de Ser Livre', 'Amar', 'Code Review')
    WHEN song.song_name LIKE '%Pais%' THEN REPLACE('Como Nossos Pais', 'Pais', 'Pull Requests')
    WHEN song.song_name LIKE '%SOUL%' THEN REPLACE('BREAK MY SOUL', 'SOUL', 'CODE')
    WHEN song.song_name LIKE '%SUPERSTAR%' THEN REPLACE('ALIEN SUPERSTAR', 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
FROM SpotifyClone.songs AS song
GROUP BY  nome_musica, novo_nome
HAVING nome_musica <> novo_nome
ORDER BY
  nome_musica DESC;