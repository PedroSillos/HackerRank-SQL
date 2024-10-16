SELECT max(CASE 
            WHEN occupation = 'Doctor'
                THEN name
            END) AS Doctor
    ,max(CASE 
            WHEN occupation = 'Professor'
                THEN name
            END) AS Professor
    ,max(CASE 
            WHEN occupation = 'Singer'
                THEN name
            END) AS Singer
    ,max(CASE 
            WHEN occupation = 'Actor'
                THEN name
            END) AS Actor
FROM (
    SELECT name
        ,occupation
        ,row_number() OVER (
            PARTITION BY occupation ORDER BY name
            ) AS rn
    FROM occupations
    ) A
GROUP BY A.rn;