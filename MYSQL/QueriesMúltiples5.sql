-- EJERCICIO 1:
-- Extraed los pedidos con el máximo "order_date" para cada empleado.

SELECT t1.order_id, t1.customer_id, t1.employee_id, t1.order_date, t1.required_date
FROM orders AS t1
WHERE order_date = (
	SELECT MAX(order_date)
    FROM orders AS t2  
    WHERE t1.employee_id = t2.employee_id);

-- EJERCICIO 2:
-- Extraed el precio unitario máximo (unit_price) de cada producto vendido.

SELECT t1.product_id, MAX(t1.unit_price) AS MaxSold
FROM order_details AS t1  
WHERE unit_price = (
    SELECT MAX(unit_price) 
    FROM order_details AS t2  
    WHERE t1.product_id = t2.product_id)
GROUP BY product_id;

-- EJERCICIO 3:
-- Ciudades que empiezan con "A" o "B".

SELECT city, company_name, contact_name
FROM customers  
WHERE city LIKE 'A%' OR city LIKE 'B%'; 

-- EJERCICIO 4: 
-- Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT city, company_name, contact_name, COUNT(order_id)
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id 
WHERE city LIKE 'L%'
GROUP BY city, company_name, contact_name
ORDER BY company_name ASC;

-- EJERCICIO 5:
-- Todos los clientes cuyo "contact_title" no incluya "Sales".

SELECT contact_name, contact_title, company_name
FROM customers  
WHERE contact_title NOT LIKE '%Sales%';

-- EJERCICIO 6:
-- Todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT contact_name
FROM customers  
WHERE contact_name NOT LIKE '_A%';


