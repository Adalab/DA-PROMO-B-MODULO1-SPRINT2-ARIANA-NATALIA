USE northwind;

#1 Extraer en una CTE todos los nombres de las compañias y los id de los clientes.

WITH nombre_company
AS (
	SELECT customer_id, company_name
	FROM customers)
SELECT c.customer_id, c.company_name
FROM customers AS c;

#2 Selecciona solo los de que vengan de "Germany"

WITH nombre_company
AS (
	SELECT customer_id, company_name, country
	FROM customers)
SELECT c.customer_id, c.company_name, c.country
FROM customers AS c
WHERE c.country ="Germany";

#3 Extraed el id de las facturas y su fecha de cada cliente.

WITH facturas_company
AS (
	SELECT customers.company_name, customers.customer_id, orders.order_id, orders.order_date
	FROM customers)
SELECT c.company_name, c.customer_id, o.order_id, o.order_date
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id= o.customer_id;

#4 Contad el número de facturas por cliente

WITH facturas_company
AS (
	SELECT order_details.quantity, customers.company_name
	FROM customers)
SELECT count(order_details.quantity), customers.company_name
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id= order_details.order_id
GROUP BY customers.company_name;

#5 Cuál la cantidad media pedida de todos los productos ProductID

WITH pedidos_company
AS (
	SELECT product_id, SUM(quantity) AS pedidos_company_cantidad
	FROM order_details
    GROUP BY product_id)
SELECT AVG (pedidos_company_cantidad) AS cantidad_media
FROM pedidos_company;