USE northwind;

SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
GROUP BY employee_id;

SELECT COUNT(order_id), MAX(freight), employee_id, order_id, shipped_date
FROM orders
WHERE shipped_date != 0000-00-00
GROUP BY employee_id
ORDER BY employee_id DESC;



