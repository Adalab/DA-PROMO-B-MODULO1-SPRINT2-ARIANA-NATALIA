-- EJERCICIO 1: 
-- Pedidos por empresa en UK:
 
SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(orders.order_id) AS NúmeroPedidos 
FROM orders
INNER JOIN customers    
ON orders.customer_id = customers.customer_id
WHERE customers.country = "UK"
GROUP BY customers.company_name, customers.customer_id;

-- EJERCICIO 2: 
-- Productos pedidos por empresa en UK por año:

SELECT company_name AS NombreEmpresa, YEAR(order_date) AS Año, SUM(order_details.quantity) AS NúmeroObjetos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE country = "UK"
GROUP BY customers.company_name, YEAR (orders.order_date);

-- EJERCICIO 3: 
-- Mejorad la query anterior: Adición de la cantidad de dinero que han pedido por esa cantidad de objetos,

SELECT company_name AS NombreEmpresa, YEAR(order_date) AS Año, SUM(order_details.quantity) AS NúmeroObjetos, SUM(unit_price*quantity)-discount AS DineroTotal
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE country = "UK"
GROUP BY customers.company_name, YEAR (orders.order_date);

-- BONUS EJERCICIO 4: 
-- Pedidos que han realizado cada compañía y su fecha:

SELECT orders.order_id, customers.company_name, orders.order_date
FROM orders
CROSS JOIN customers   
WHERE orders.customer_id = customers.customer_id; 

-- BONUS EJERCICIO 5: 
-- Tipos de producto vendidos:

SELECT  categories.category_id, categories.category_name, products.product_name, SUM(order_details.unit_price * order_details.quantity)-order_details.discount AS ProductSales
FROM products
INNER JOIN categories
ON categories.category_id = products.category_id
INNER JOIN order_details
ON products.product_id = order_details.product_id
GROUP BY category_id, products.product_name;


