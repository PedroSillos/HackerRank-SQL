SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(RIGHT(CITY,1)) NOT IN ('A','E','I','O','U')