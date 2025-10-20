PowerWash Simulator – Cohort Retention SQL
This query uses the player_logged_in.csv file from the PowerWash Simulator dataset.
It converts login timestamps to daily events, identifies each player's first login date, and calculates D1, D3, and D7 cohort retention rates.
Columns used:
pid – unique player ID
Time_utc – login timestamp (UTC)

🎯 Purpose of the Analysis  

The goal of this analysis is to measure player retention over time using a cohort-based approach:
Group players by their first login date (cohort date)
Track how many of them return on Day +1, +3, and +7
Compute retention rates (D1, D3, D7) for each cohort
