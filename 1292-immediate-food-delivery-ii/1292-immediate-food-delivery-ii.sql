SELECT ROUND(AVG(CASE 
                    WHEN FirstOrders.first_order_date = d.customer_pref_delivery_date THEN 1
                    ELSE 0
                 END) * 100, 2) AS immediate_percentage
FROM 
    (SELECT customer_id, 
            MIN(order_date) AS first_order_date
     FROM Delivery
     GROUP BY customer_id) AS FirstOrders
JOIN Delivery AS d
ON FirstOrders.customer_id = d.customer_id AND FirstOrders.first_order_date = d.order_date;