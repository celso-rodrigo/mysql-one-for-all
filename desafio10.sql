SELECT 
	s.song_name AS nome,
	COUNT(ph.song_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.playback_history AS ph
ON ph.song_id = s.song_id
INNER JOIN SpotifyClone.users AS u
ON u.user_id = ph.user_id
WHERE u.subscription_type_id = 1 OR u.subscription_type_id = 4
GROUP BY nome
ORDER BY nome;
