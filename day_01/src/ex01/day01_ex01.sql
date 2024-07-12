SELECT object_name

FROM
	(SELECT 
        name AS object_name,
        1 AS order_flag
    FROM 
        person

    UNION ALL

    SELECT 
        pizza_name,
        2 AS order_flag
    FROM 
        menu

    ORDER BY 
        order_flag,
        object_name) AS test