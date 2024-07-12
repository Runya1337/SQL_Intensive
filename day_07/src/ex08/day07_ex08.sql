SELECT 
    p1.address,
    p.name,
    COUNT(*)
FROM 
    person_order
    INNER JOIN menu m ON person_order.menu_id = m.id 
    INNER JOIN pizzeria p ON m.pizzeria_id = p.id
    INNER JOIN person p1 ON p1.id = person_order.person_id
GROUP BY 
    p1.address,
    p.name
ORDER BY 
    1,
    2;
