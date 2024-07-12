WITH
    nevse AS (
        SELECT
            DISTINCT menu_id
        FROM
            person_order
    )
SELECT
	pizza_name,
	price,
	pizzeria.name AS pizzeria_name
FROM
    menu
	INNER JOIN
		pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE
    menu.id NOT IN (
        SELECT
            menu_id
        FROM
            nevse
    )
ORDER BY
	1,
	2