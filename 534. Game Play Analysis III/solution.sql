/* 
Use SUM() OVER (PARTITION BY player_id ORDER BY event_date) 
to calculate the running total of games for each player.
This ensures we get a cumulative value up to that day 
(instead of the overall total).
*/
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM Activity
