/* 
Use SUM() OVER (ORDER BY turn) to calculate the cumulative weight--- running total
cum_weight = total until this person.
Pick the last person with cum_weight <= 1000.
*/
WITH turn AS (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS cum_weight
    FROM Queue
)
SELECT
    person_name
FROM turn
WHERE cum_weight <= 1000
ORDER BY cum_weight DESC 
LIMIT 1;
