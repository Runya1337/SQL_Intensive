SELECT
    pizzeria.name
FROM
    person_visits
    INNER JOIN person ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE
    person.name = 'Dmitriy'
    AND menu.price < 800
    AND person_visits.visit_date = '2022-01-08'
ORDER BY
    1