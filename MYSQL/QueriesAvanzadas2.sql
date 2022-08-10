-- EJERCICIO 1:
-- Relación entre número de pedidos y máxima carga:

SELECT COUNT(order_id), MAX(freight), employee_id
FROM orders
GROUP BY employee_id;

-- EJERCICIO 2:
-- Descartar pedidos sin fecha y ordénalos

SELECT COUNT(order_id), MAX(freight), employee_id, order_id, shipped_date
FROM orders
WHERE shipped_date != 0000-00-00
GROUP BY employee_id
ORDER BY employee_id DESC;

-- EJERCICIO 3:
-- Números de pedidos por día: 

SELECT COUNT(order_id), DAY(order_date), MONTH(order_date), YEAR(order_date)
FROM orders
GROUP BY DAY(order_date), MONTH(order_date), YEAR(order_date);

-- EJERCICIO 4:
-- Número de pedidos por mes y año:

SELECT COUNT(order_id), MONTH(order_date), YEAR(order_date)
FROM orders
GROUP BY MONTH(order_date), YEAR(order_date);

-- EJERCICIO 5:
-- Seleccionad las ciudades con 4 o más empleadas:

SELECT COUNT(employee_id), city
FROM employees
GROUP BY city
HAVING COUNT(employee_id) >= 4;

-- EJERCICIO 6:
-- Cread una nueva columna basándonos en la cantidad monetaria:
-- Necesitamos una consulta que clasifique los pedidos en dos categorías ("Alto" y "Bajo") 
-- en función de la cantidad monetaria total que han supuesto: por encima o por debajo de 2000 euros.

SELECT
CASE   
    WHEN unit_price < 2000 THEN "Bajo"   
    ELSE "Alto"   
    END AS Cantidad_Monetaria   
FROM order_details;  



 