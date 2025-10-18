'''
Question : Write a solution to find the the users who have had at least two session of the same type (either 'Viewer' or 'Streamer') with a maximum gap of 12 hours between sessions.
Logic: 
  1. For each user and session type, find the previous session’s end time using LAG(session_end).
  2. LAG(session_end)
'''

WITH session_diff  AS (
  SELECT
    user_id,
    session_type,            
    session_start,
    LAG(session_end) OVER (
      PARTITION BY user_id, session_type
      ORDER BY session_end
    ) AS prev_session_end
  FROM Sessions
)
SELECT DISTINCT user_id
FROM session_diff 
WHERE prev_session_end IS NOT NULL
  AND TIMESTAMPDIFF(hour, prev_session_end, session_start) <= 12
ORDER BY user_id;
