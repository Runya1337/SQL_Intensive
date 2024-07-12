SELECT 
    pizzeria.name,
    person.name
FROM
    person_visits
JOIN
    person ON person.id = person_visits.person_id
JOIN
	pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE
    person_visits.visit_date BETWEEN '2022-01-07' AND '2022-01-09' 