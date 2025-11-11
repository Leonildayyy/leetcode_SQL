/* 
1. Use LEFT JOIN to include users who have no orders in 2019
2. Apply the date filter inside the ON clause so that users without orders are not filtered out
*/
SELECT
    u.user_id,
    u.join_date,
    COUNT(o.order_id) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
    ON u.user_id = o.buyer_id
    AND o.order_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY
    u.user_id,
    u.join_date;
