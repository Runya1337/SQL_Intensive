SELECT
    name
FROM
    person
    INNER JOIN person_order ON person.id = person_order.person_id
    INNER JOIN menu ON person_order.menu_id = menu.id
WHERE
    gender = 'male'
    AND address IN ('Samara', 'Moscow')
    AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY
    name DESC;