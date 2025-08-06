

-- Question 7: Who are the 20 customers who buy the most in terms of revenue?
SELECT id_cliente, SUM(precio_total) AS ingreso_cliente
FROM tickets
GROUP BY id_cliente
ORDER BY ingreso_cliente DESC
LIMIT 20;

-- Question 8: What is the average purchase per customer?
SELECT AVG(compra_total_cliente) AS compra_media_por_cliente 
FROM ( 
SELECT id_cliente, SUM(precio_total) AS compra_total_cliente 
FROM tickets 
GROUP BY id_cliente ) subconsulta;


-- Question 9: How many total orders have been placed?
SELECT COUNT(DISTINCT id_pedido) AS total_pedidos
FROM tickets;

-- Question 10: What is the average value per order?
SELECT AVG(total_pedido) AS valor_promedio_pedido
FROM (
SELECT id_pedido, SUM(precio_total) AS total_pedido
FROM tickets
GROUP BY id_pedido
) subconsulta;
