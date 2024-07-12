SELECT 
    id AS object_id,
    pizza_name AS name
FROM 
    menu

UNION ALL

SELECT 
	id,
    name

FROM 
    person

ORDER BY 
    object_id, name;