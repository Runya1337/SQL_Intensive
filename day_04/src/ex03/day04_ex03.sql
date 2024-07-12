SELECT
    gv.date AS missing_date
FROM
    v_generated_dates gv
WHERE
    NOT EXISTS (
        SELECT
            visit_date 
        FROM
            person_visits pv
        WHERE
            pv.visit_date = gv.date
    )
ORDER BY
    missing_date;