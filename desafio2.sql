SELECT
	COUNT(DISTINCT  son.song_id)  AS 'cancoes',
	COUNT(DISTINCT art.artist_id)  AS 'artistas',
	COUNT(DISTINCT alb.album_id)  AS 'albuns'
FROM SpotifyClone.songs AS son
INNER JOIN SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
;
