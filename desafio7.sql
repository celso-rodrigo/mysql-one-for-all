SELECT 
	art.artist_name AS artista,
	alb.album_name AS album,
	COUNT(af.artist_id) AS seguidores
FROM SpotifyClone.artist AS art
RIGHT JOIN SpotifyClone.album AS alb
ON alb.artist_id = art.artist_id
LEFT JOIN SpotifyClone.artist_followers AS af
ON af.artist_id = art.artist_id
GROUP BY album, art.artist_name
ORDER BY seguidores DESC, artista, album;
