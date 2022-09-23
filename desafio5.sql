SELECT
	s.song_name AS cancao,
	COUNT(ph.listened_date) AS reproducoes
FROM SpotifyClone.songs AS s
LEFT JOIN SpotifyClone.playback_history AS ph
ON ph.song_id = s.song_id
GROUP BY s.song_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;
