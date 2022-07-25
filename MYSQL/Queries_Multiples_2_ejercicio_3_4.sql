#Ejercicio3

-- Empresas de UK y sus pedidos:
-- También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino
-- Unido (tengan pedidos o no) junto con los ID de todos los pedidos que han realizado, el
-- nombre de contacto de cada empresa y la fecha del pedido

SELECT customers.company_name, customers.contact_name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id= orders.customer_id
WHERE country= "UK";

#Ejercicio4
/*Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que
muestre por pantalla los datos de todas las empleadas y sus supervisoras. Concretamente nos
piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el 
resultado, ¿sabes decir quién es el director?*/


SELECT A.first_name AS nombre_empleadas,
	   A.last_name AS apellido_empleadas,
       A.city AS ciudad_empleadas,
       B.first_name AS nombre_supervisoras,
	   B.last_name AS apellido_supervisoras,
       B.city AS ciudad_supervisoras    
FROM employees AS A, employees AS B
WHERE A.reports_to = B.employee_id
ORDER BY ciudad_empleadas;

-- Andrew es el director (Vice President, Sales)