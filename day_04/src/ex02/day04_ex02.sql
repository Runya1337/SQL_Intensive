create view v_generated_dates as
SELECT
    date:: date
FROM
    generate_series(
        '2022-01-01':: date,
        '2022-01-31':: date,
        '1 day':: interval
    ) AS date
ORDER BY
    1