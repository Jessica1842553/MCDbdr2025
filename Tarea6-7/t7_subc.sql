-- TAREA 7. Ajustes en base de datos tienda en linea

-- 1. Campo año_pedido o mes_pedido para facilitar reportes por tiempo:

ALTER TABLE Pedido
  ADD COLUMN año_pedido INT GENERATED ALWAYS AS (YEAR(ped_fecha)) STORED,
  ADD COLUMN mes_pedido INT GENERATED ALWAYS AS (MONTH(ped_fecha)) STORED;

SELECT * FROM Pedido;

-- De esta manera se puede checar: 

-- Ventas por año
SELECT año_pedido, COUNT(*) AS total_pedidos
FROM Pedido
GROUP BY año_pedido
ORDER BY año_pedido;

-- Mejores productos por mes y año
SELECT 
  p.año_pedido,
  p.mes_pedido,
  pr.p_nombre,
  SUM(dp.ventas) AS total_ventas
FROM Pedido p
JOIN DetallePedido dp ON p.pedidoID = dp.pedidoID
JOIN Producto pr ON dp.productoID = pr.productoID
GROUP BY p.año_pedido, p.mes_pedido, pr.p_nombre
ORDER BY p.año_pedido, p.mes_pedido, total_ventas DESC;

-- 2. Productos con mayores ganancias al promedio general
SELECT productoID, p_nombre, total_utilidad
FROM (
  SELECT pr.productoID, pr.p_nombre, SUM(dp.ganancia) AS total_utilidad
  FROM Producto pr
  JOIN DetallePedido dp ON pr.productoID = dp.productoID
  GROUP BY pr.productoID, pr.p_nombre
) AS utilidad_producto
WHERE total_utilidad > (
  SELECT AVG(ganancia) FROM DetallePedido
)
ORDER BY total_utilidad DESC;

-- 3. Categoria con mas ingresos totales
SELECT categoria, total_ventas
FROM (
  SELECT pr.categoria, SUM(dp.ventas) AS total_ventas
  FROM Producto pr
  JOIN DetallePedido dp ON pr.productoID = dp.productoID
  GROUP BY pr.categoria
) AS ventas_categoria
ORDER BY total_ventas DESC
LIMIT 1;