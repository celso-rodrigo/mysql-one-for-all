SELECT 
	u.username AS usuario,
	IF(YEAR(MAX(ph.listened_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users AS u
LEFT JOIN SpotifyClone.playback_history AS ph
ON ph.user_id = u.user_id
GROUP BY u.username
ORDER BY usuario;
