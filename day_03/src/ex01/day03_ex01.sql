WITH
    nevse AS (
        SELECT
            DISTINCT menu_id
        FROM
            person_order
    )
SELECT
    id
FROM
    menu
WHERE
    id NOT IN (
        SELECT
            menu_id
        FROM
            nevse
    )
ORDER BY
	1