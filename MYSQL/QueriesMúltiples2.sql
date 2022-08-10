-- EJERCICIO 1:
-- Qué empresas tenemos en la BBDD Northwind:
 
SELECT orders.order_id, customers.company_name, orders.order_date
FROM customers 
LEFT JOIN orders  
ON customers.customer_id = orders.customer_id;

-- EJERCICIO 2:
-- Pedidos por cliente de UK:

SELECT customers.company_name, customers.country, COUNT(orders.order_id) AS NúmeroPedidos
FROM customers 
LEFT JOIN orders  
ON customers.customer_id = orders.customer_id
WHERE country = 'UK'
GROUP BY company_name;

-- EJERCICIO 3: 
-- Empresas de UK y sus pedidos:

SELECT orders.order_id, customers.company_name, orders.order_date AS FechaPedido
FROM customers 
LEFT JOIN orders  
ON customers.customer_id = orders.customer_id
WHERE country = 'UK'
GROUP BY company_name, order_id;

-- EJERCICIO 4:
-- Empleadas que sean de la misma ciudad:

SELECT A.city AS CiudadEmpleadas, A.first_name AS NombreEmpleadas, A.last_name AS ApellidoEmpleadas, B.city AS CiudadSupervisoras, B.first_name AS NombreSupervisoras, B.last_name AS ApellidoSupervisoras  
FROM employees AS A, employees AS B
WHERE A.reports_to = B.employee_id
ORDER BY CiudadEmpleadas;
