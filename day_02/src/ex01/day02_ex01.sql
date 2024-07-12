SELECT
    gs.date_series:: date
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
    RIGHT JOIN (
        SELECT
            generate_series('2022-01-01':: date, '2022-01-10':: date, '1 day') AS date_series
    ) gs ON pv.visit_date = gs.date_series
WHERE
    pv.person_id IS NULL
ORDER BY
    gs.date_series ASC;