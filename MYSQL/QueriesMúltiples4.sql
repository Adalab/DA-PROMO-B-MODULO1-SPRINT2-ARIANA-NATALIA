-- EJERCICIO 1:
-- Extraed información de los productos "Beverages"

SELECT product_id, product_name, category_id
FROM products
WHERE category_id IN( 
	SELECT category_id
	FROM categories
	WHERE category_name = 'Beverages');

-- EJERCICIO 2:
-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país. 

SELECT country
FROM customers
GROUP BY country
HAVING country NOT IN(
	SELECT country
	FROM suppliers);

-- EJERCICIO 3: 
-- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
-- Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

SELECT order_id, customer_id
FROM orders 
WHERE order_id  IN (
	SELECT order_id
	FROM order_details
	WHERE product_id = 6 AND quantity > 20)
ORDER BY customer_id;

-- EJERCICIO 4: 
-- Extraed los 10 productos más caros

SELECT product_name AS ProductosMásCostosos, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;




