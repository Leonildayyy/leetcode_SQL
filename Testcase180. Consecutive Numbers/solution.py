/* 
Business scenario: detect suspicious behavior such as 3 consecutive identical transactions 
(e.g. fraud or order brushing).
Use LAG() to compare current row with the previous 2 rows.
If all 3 are equal, mark as consecutive.
*/
SELECT DISTINCT Num AS ConsecutiveNums
FROM (
    SELECT Num,
           LAG(Num,1) OVER (ORDER BY Id) AS prev_num,
           LAG(Num,2) OVER (ORDER BY Id) AS prev2_num
    FROM Logs
) t
WHERE Num = prev_num AND Num = prev2_num;
