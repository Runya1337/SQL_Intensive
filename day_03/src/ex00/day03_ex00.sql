SELECT
	menu.pizza_name AS pizza_name,
	menu.price AS price,
	pizzeria.name AS pizzeria_name,
	person_visits.visit_date AS visit_date
FROM
	person_visits
	INNER JOIN person ON person_visits.person_id = person.id
	INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE
	price >= 800
	AND price <= 1000
	AND person.name = 'Kate'
ORDER BY
	1,
	2,
	3