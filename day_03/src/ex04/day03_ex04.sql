(SELECT
	pizzeria.name
FROM
	person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON menu.id = person_order.menu_id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
	person.gender = 'female'
EXCEPT
SELECT
	pizzeria.name
FROM
	person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON menu.id = person_order.menu_id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
	person.gender = 'male')
UNION
(SELECT
	pizzeria.name
FROM
	person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON menu.id = person_order.menu_id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
	person.gender = 'male'
EXCEPT
SELECT
	pizzeria.name
FROM
	person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON menu.id = person_order.menu_id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
	person.gender = 'female')