SELECT p.name,
       CASE
           WHEN po.menu_id = 13 THEN 'Menu 13'
           WHEN po.menu_id = 14 THEN 'Menu 14'
           WHEN po.menu_id = 18 THEN 'Menu 18'
           ELSE 'Other Menu'
       END AS check_name
FROM person p
JOIN person_order po ON p.id = po.person_id
WHERE po.menu_id IN (13, 14, 18) AND po.order_date = '2022-01-07'
ORDER BY p.name;