-- EJERCICIO 1: 
-- Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT city, company_name, contact_name, 'Customers' AS Relantionship
FROM customers
UNION
SELECT city, company_name, contact_name, 'Suppliers' AS Relantionship
FROM suppliers;

-- EJERCICIO 2:
-- Extraer todos los pedidos gestinados por "Nancy Davolio"

SELECT *
FROM orders
WHERE employee_id IN (
	SELECT employee_id 
    FROM employees
	WHERE first_name= "Nancy" AND last_name = "Davolio");

-- EJERCICIO 3:
-- Extraed todas las empresas que no han comprado en el año 1997

SELECT company_name, country
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
	FROM orders
    WHERE YEAR(order_date) = "1997")

-- EJERCICIO 4:
-- Extraed toda la información de los pedidos donde tengamos "Konbu"

SELECT *
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE order_details.product_id IN (
	SELECT product_id
    FROM products
	WHERE products.product_name = "Konbu");