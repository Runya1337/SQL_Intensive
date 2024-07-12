SELECT
	order_date,
	CONCAT(person.name, '(age:', person.age, ')') AS person_information
FROM
	(SELECT
		order_date,
		person_id AS id
	FROM
		person_order)
NATURAL JOIN
	person
ORDER BY
	order_date,
	person_information