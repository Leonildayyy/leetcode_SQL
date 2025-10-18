WITH first_login AS (
  SELECT player_id, MIN(event_date) AS first_login
  FROM Activity
  GROUP BY player_id
),
retained AS (
  SELECT a.player_id
  FROM Activity a
  JOIN first_login f
  ON a.player_id = f.player_id
  WHERE a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
)
SELECT 
  ROUND(
    COUNT(DISTINCT retained.player_id) / COUNT(DISTINCT first_login.player_id),
    2
  ) AS fraction
FROM first_login
LEFT JOIN retained
ON first_login.player_id = retained.player_id;
