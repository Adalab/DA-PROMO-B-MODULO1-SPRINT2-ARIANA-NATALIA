USE northwind;

#Ejercicio1
#Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT city, company_name, contact_name, "suppliers" AS relationship
FROM suppliers
UNION
SELECT city, company_name, contact_name, "customers" AS relationship
FROM customers;


#Ejercicio2
#Extraer todos los pedidos gestinados por "Nancy Davolio"

SELECT order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country
FROM orders
WHERE employee_id IN (
	SELECT employee_id 
    FROM employees
	WHERE first_name= "Nancy");

#Ejercicio3
-- Extraed todas las empresas que no han comprado en el año 1997
SELECT company_name, country
FROM customers
WHERE customer_id IN (
    SELECT customer_id
	FROM orders
    WHERE YEAR(order_date)="1997");

#Ejercicio4
-- Extraed toda la información de los pedidos donde tengamos "Konbu"
SELECT *
FROM orders
INNER JOIN order_details
ON orders.order_id=order_details.order_id
WHERE order_details.product_id IN (
	SELECT product_id
    FROM products
	WHERE products.product_name="Konbu");