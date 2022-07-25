/*USE northwind;*/

-- EJERCICIO1
-- Pedidos por empresa en UK:

/*SELECT count(orders.order_id), customers.company_name, customers.customer_id 
FROM orders
INNER JOIN customers    
ON orders.customer_id= customers.customer_id
WHERE customers.country="UK"
GROUP BY customers.company_name, customers.customer_id;*/

-- #EJERCICIO2
-- Productos pedidos por empresa en UK por año:
-- Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición 
-- anterior y han decidido pedirnos una serie de consultas adicionales. La primera de ellas 
-- consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa 
-- cliente de UK durante cada año.Nos piden concretamente conocer el nombre de la empresa, 
-- el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

/*SELECT count(order_details.quantity), customers.company_name, YEAR (orders.order_date)
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id= order_details.order_id
WHERE country= "UK"
GROUP BY customers.company_name, YEAR (orders.order_date);*/

#EJERCICIO3
-- Mejorad la query anterior:
-- Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la
-- cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los 
-- descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos
-- sale como 0.15


/*SELECT count(order_details.quantity) as CANTIDAD, 
       order_details.unit_price*order_details.quantity*(1-order_details.discount) AS PRECIO_TOTAL,
       customers.company_name AS EMPRESA,
       YEAR (orders.order_date) AS AÑO
FROM order_details
INNER JOIN orders
ON orders.order_id= order_details.order_id
INNER JOIN customers
ON customers.customer_id= orders.customer_id
WHERE country= "UK"
GROUP BY EMPRESA, AÑO;*/

#ERROR:Order_details.unit_price no está siendo compatible con Group By

