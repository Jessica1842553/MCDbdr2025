-- MEDIA: Promedio de días entre pedido y envío
SELECT AVG(DATEDIFF(ped_envio, ped_fecha)) AS PromedioDiasEnvio
FROM Pedido;

-- MINIMO: Producto con la menor venta en DetallePedido
SELECT pr.p_nombre, dp.ventas
FROM Producto pr
JOIN DetallePedido dp ON pr.productoID = dp.productoID
WHERE dp.ventas = (
    SELECT MIN(ventas) FROM DetallePedido
);

-- MAXIMO: Ciudad con la mayor ganancia maxima.
SELECT ciudad, MaxGanancia
FROM (
    SELECT 
        c.ciudad,
        MAX(dp.ganancia) AS MaxGanancia
    FROM Cliente c
    JOIN Pedido p ON c.clienteID = p.clienteID
    JOIN DetallePedido dp ON p.pedidoID = dp.pedidoID
    GROUP BY c.ciudad
) AS ganancias_por_ciudad
ORDER BY MaxGanancia DESC
LIMIT 1;

-- Q1: Calcular el primer cuartil (Q1) de la columna ganancia en DetallePedido
SET @row := -1;
SELECT ganancia
FROM (
  SELECT ganancia, @row := @row + 1 AS fila
  FROM DetallePedido
  ORDER BY ganancia
) AS ordenadas
WHERE fila = FLOOR((SELECT COUNT(*) FROM DetallePedido) * 0.25);

-- MODA: Tipo de envio mas usado.
SELECT tipo_envio, COUNT(*) AS frecuencia
FROM Pedido
GROUP BY tipo_envio
ORDER BY frecuencia DESC
LIMIT 1;

  



