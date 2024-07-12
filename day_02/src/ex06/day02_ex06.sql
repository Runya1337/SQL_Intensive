SELECT
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    person_order
    INNER JOIN person ON person.id = person_order.person_id
    INNER JOIN menu ON menu.id = person_order.menu_id
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE
    person.name = 'Denis'
    or person.name = 'Anna'
ORDER BY
    1,
    2