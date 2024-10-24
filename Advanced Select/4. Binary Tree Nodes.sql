SELECT N
    ,CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (
            SELECT DISTINCT b1.N
            FROM BST b1
            INNER JOIN BST b2 ON b1.N = b2.P AND  b1.P IS NOT NULL
        )
            THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM BST
ORDER BY N