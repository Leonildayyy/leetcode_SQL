/*
Business scenario: identify "power users" who log in for at least 5 consecutive days 
(e.g., retention analysis or detecting highly engaged customers).
Use ROW_NUMBER with date arithmetic (date - row_number) to group consecutive days.
Count the length of each consecutive segment, keep those with length >= 5.
*/

WITH dedup AS (
  SELECT 
    a.id, a.name, DATE(l.login_date) AS d
  FROM Accounts a
  JOIN Logins l ON a.id = l.id
  GROUP BY a.id, a.name, DATE(l.login_date)       
), -- step 1: deduplicate per day
seg AS (
  SELECT
    id,
    name,
    d,
    DATE_SUB(d, INTERVAL ROW_NUMBER() OVER (PARTITION BY id ORDER BY d) DAY) AS grp
  FROM dedup                                        
) -- step 2: assign segment key for consecutive days
SELECT DISTINCT id, name
FROM seg
GROUP BY id, name, grp
HAVING COUNT(*) >= 5  -- step 3: filter segments of length >= 5                          
ORDER BY id;
