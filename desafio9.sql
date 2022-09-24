SELECT
	COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.playback_history AS ph
INNER JOIN SpotifyClone.users AS u
ON u.user_id = ph.user_id
GROUP BY u.username
HAVING u.username = 'Barbara Liskov';
