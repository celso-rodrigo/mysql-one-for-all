SELECT
	FORMAT(MIN(s.subscription_cost), 2) AS faturamento_minimo,
	FORMAT((MAX(s.subscription_cost)), 2) AS faturamento_maximo,
	FORMAT(SUM(s.subscription_cost) / COUNT(s.subscription_cost), 2) AS faturamento_medio,
	FORMAT(SUM(s.subscription_cost), 2) AS faturamento_total
FROM SpotifyClone.subscriptions AS s
LEFT JOIN SpotifyClone.users AS u
ON u.subscription_type_id = s.subscription_id;