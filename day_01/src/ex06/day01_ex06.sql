SELECT action_date, person.name
FROM 
(SELECT
    order_date AS action_date,
    person_id
FROM
    person_order

INTERSECT ALL

SELECT
    visit_date AS action_date,
    person_id
FROM
    person_visits)
JOIN
	person ON person.id = person_id
ORDER BY 
    action_date, 
    person.name DESC