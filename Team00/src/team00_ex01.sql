CREATE TABLE nodes
(
    point1 VARCHAR,
    point2 VARCHAR,
    cost   INTEGER
);

INSERT INTO nodes(point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('d', 'c', 30),
       ('c', 'd', 30),
       ('b', 'c', 35),
       ('c', 'b', 35);

WITH RECURSIVE
        rec AS (SELECT nodes.point2                  AS end_,
                       cost                          AS sumcost,
                       '{a,' || nodes.point2::bpchar AS tour,
                       1                             AS len
                FROM nodes
                WHERE point1 = 'a'

                UNION ALL

                SELECT nodes.point2                AS end_,
                       rec.sumcost + cost          AS sumcost,
                       tour || ',' || nodes.point2 AS tour,
                       len + 1                     AS len
                FROM nodes
                         JOIN rec ON end_ = nodes.point1
                WHERE len < 4),

        second AS (SELECT sumcost     AS total_cost,
                          tour || '}' AS tour
                   FROM rec
                   WHERE len = 4
                     AND tour LIKE '%a'
                     AND (tour LIKE '%b%')
                     AND (tour LIKE '%c%')
                     AND (tour LIKE '%d%'))

SELECT *
FROM second
ORDER BY 1, 2;