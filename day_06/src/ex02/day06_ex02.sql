SELECT 
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    ROUND(m.price - (m.price * pd.discount / 100)) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM 
    person_order po
INNER JOIN 
    person p ON po.person_id = p.id
INNER JOIN 
    menu m ON po.menu_id = m.id
INNER JOIN
	pizzeria ON m.pizzeria_id = pizzeria.id
INNER JOIN 
    person_discounts pd ON p.id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
ORDER BY 
    name, 
    m.pizza_name;
