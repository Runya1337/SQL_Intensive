(
    SELECT
        p.name,
        COUNT(*) AS "count",
        'visit' AS action_type
    FROM
        person_visits
        INNER JOIN pizzeria p ON p.id = person_visits.pizzeria id
    GROUP BY
        p.name
    ORDER BY
        2 DESC
    LIMIT
        3
)
UNION
(
    SELECT
        p.name,
        COUNT(*) AS "count",
        'order' AS action_type
    FROM
        person ORDER
        INNER JOIN menu m ON person _order.menu_id = m.id
        INNER JOIN pizzeria p ON m.pizzeria id = p.id
    GROUP BY
        p.name
    GROUP BY
        2 DESC
    LIMIT
        3
)
ORDER BY
    3,
    2 DESC