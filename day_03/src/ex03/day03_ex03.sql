(SELECT
	pizzeria.name
FROM
	pizzeria
	INNER JOIN
		person_visits ON pizzeria.id = person_visits.pizzeria_id
	INNER JOIN
		person ON person.id = person_visits.person_id
WHERE
	gender = 'male'
EXCEPT ALL
SELECT
	pizzeria.name
FROM
	pizzeria
	INNER JOIN
		person_visits ON pizzeria.id = person_visits.pizzeria_id
	INNER JOIN
		person ON person.id = person_visits.person_id
WHERE
	gender = 'female')
UNION ALL
(SELECT
	pizzeria.name
FROM
	pizzeria
	INNER JOIN
		person_visits ON pizzeria.id = person_visits.pizzeria_id
	INNER JOIN
		person ON person.id = person_visits.person_id
WHERE
	gender = 'female'
EXCEPT ALL
SELECT
	pizzeria.name
FROM
	pizzeria
	INNER JOIN
		person_visits ON pizzeria.id = person_visits.pizzeria_id
	INNER JOIN
		person ON person.id = person_visits.person_id
WHERE
	gender = 'male')
ORDER BY
	1