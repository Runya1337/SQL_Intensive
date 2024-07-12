WITH
    gs AS (
        SELECT
            generate_series(
                '2022-01-01':: date,
                '2022-01-10':: date,
                '1 day':: interval
            ) AS missing_date
    )
SELECT
    gs.missing_date:: date
FROM
    (
        SELECT
            person_id,
            visit_date
        FROM
            person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) pv
    RIGHT JOIN gs ON pv.visit_date = gs.missing_date
WHERE
    pv.person_id IS NULL
ORDER BY
    gs.missing_date ASC;