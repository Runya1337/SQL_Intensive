insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
CREATE FUNCTION fnc_nearest_day(balance_update_day TIMESTAMP, id_cur BIGINT)
RETURNS TIMESTAMP AS $$
DECLARE
    nearest_update_date TIMESTAMP;
BEGIN
    SELECT
        COALESCE(
            (SELECT MAX(c1.updated)
             FROM currency c1
             WHERE id_cur=c1.id AND balance_update_day >= c1.updated),
            (SELECT MIN(c2.updated)
             FROM currency c2
             WHERE id_cur=c2.id AND balance_update_day < c2.updated)
        )
    INTO nearest_update_date;
    RETURN nearest_update_date;
END;
$$ LANGUAGE plpgsql;


SELECT COALESCE(u.name,'not defined') AS name,
       COALESCE(u.lastname,'not defined') AS lastname,
       c.name AS currency_name,
       b.money * c.rate_to_usd  AS currency_in_usd
FROM balance b
LEFT JOIN "user" u ON b.user_id = u.id
INNER JOIN currency c ON b.currency_id = c.id
                             AND c.updated=fnc_nearest_day(b.updated, b.currency_id)
ORDER BY name DESC, lastname, currency_name;






