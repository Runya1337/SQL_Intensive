WITH temp AS (
  SELECT
    u.name,
    u.lastname,
    b.type,
    SUM(money) AS volume,
    temp_1.name AS currency_name,
    b.currency_id,
    temp_1.last_up
  FROM "user" u
  FULL JOIN balance b ON u.id = b.user_id
  FULL JOIN (
    SELECT id, name, MAX(updated) AS last_up
    FROM currency GROUP BY (id, name)
  ) AS temp_1 ON temp_1.id = b.currency_id
  GROUP BY(u.name, u.lastname, b.type, b.currency_id, temp_1.name, temp_1.last_up)
)
SELECT
  COALESCE(t.name, 'not defined') AS name,
  COALESCE(t.lastname, 'not defined') AS lastname,
  t.type,
  t.volume,
  COALESCE(t.currency_name, 'not defined') AS currency_name,
  COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
  COALESCE(t.volume, 1) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM temp t
LEFT JOIN currency c ON c.id = t.currency_id
AND c.updated = t.last_up
ORDER BY 1 DESC, 2, 3;
