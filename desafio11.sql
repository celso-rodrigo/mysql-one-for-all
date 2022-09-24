SELECT 
	os.song_name AS nome_musica,
	CASE 
		WHEN ns.song_name LIKE '%Bard%' THEN REPLACE(ns.song_name, 'Bard', 'QA')
 		WHEN ns.song_name LIKE '%Amar%' THEN REPLACE(ns.song_name, 'Amar', 'Code Review')
		WHEN ns.song_name LIKE '%Pais%' THEN REPLACE(ns.song_name, 'Pais', 'Pull Requests')
		WHEN ns.song_name LIKE '%SOUL%' THEN REPLACE(ns.song_name, 'SOUL', 'CODE')
		WHEN ns.song_name LIKE '%SUPERSTAR%' THEN REPLACE(ns.song_name, 'SUPERSTAR', 'SUPERDEV')
	END	AS novo_nome
FROM SpotifyClone.songs AS os
INNER JOIN SpotifyClone.songs AS ns
ON ns.song_name = os.song_name
WHERE 
  os.song_name LIKE '%Bard%' OR
  os.song_name LIKE '%Amar%' OR
  os.song_name LIKE '%Pais%' OR
  os.song_name LIKE '%SOUL%' OR
  os.song_name LIKE '%SUPERSTAR%'
ORDER BY nome_musica DESC;
