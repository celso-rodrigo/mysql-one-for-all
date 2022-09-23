SELECT 
	u.username AS usuario,
	COUNT(ph.song_id) AS qt_de_musicas_ouvidas,
	ROUND(SUM(s.length_seconds / 60), 2) AS total_minutos
FROM SpotifyClone.users AS u
LEFT JOIN SpotifyClone.playback_history AS ph
ON ph.user_id = u.user_id
LEFT JOIN SpotifyClone.songs AS s
ON s.song_id = ph.song_id
GROUP BY u.username
ORDER BY u.username;
