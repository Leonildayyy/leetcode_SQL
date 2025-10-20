PowerWash Simulator – Cohort Retention SQL
This query uses the player_logged_in.csv file from the PowerWash Simulator dataset.
It converts login timestamps to daily events, identifies each player's first login date, and calculates D1, D3, and D7 cohort retention rates.
Columns used:
pid – unique player ID
Time_utc – login timestamp (UTC)
