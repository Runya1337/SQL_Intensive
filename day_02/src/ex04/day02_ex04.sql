SELECT
	menu.pizza_name AS pizza_name,
	pizzeria.name AS pizzeria_name,
	menu.price AS price
FROM
	menu
JOIN
	pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
	pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
ORDER BY
	1, 2