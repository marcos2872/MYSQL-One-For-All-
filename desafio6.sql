SELECT CONVERT(CONCAT(MIN(plan.plan_price), '.00'), CHAR) AS faturamento_minimo,
  CONVERT(MAX(plan.plan_price), CHAR) AS faturamento_maximo,
  CONVERT(ROUND((SUM(plan.plan_price) / (COUNT(us.plan_id))), 2), CHAR) AS faturamento_medio,
  CONVERT(ROUND(SUM(plan.plan_price), 2), CHAR) AS faturamento_total
FROM SpotifyClone.plans AS plan
JOIN SpotifyClone.users AS us ON plan.plan_id = us.plan_id;