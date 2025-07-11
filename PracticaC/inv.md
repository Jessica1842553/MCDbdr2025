# Titulo 1
## Titulo 2

- uno
- dos
- tres

1. si
3. no

_cursiva_, **negrita**, <u>hola</u>.

Agregar link [google](https://google.com)

- Elemento 1  
    - Sub-elemento 1.1  
        - Sub-sub-elemento 1.1.1

Relaciones principales entre las entidades

Clientes ↔ Pedidos: Un cliente puede realizar múltiples pedidos.

Pedidos ↔ Productos: Cada pedido puede contener varios productos.

Productos ↔ Categorías: Cada producto pertenece a una categoría específica.

Pedidos ↔ Ubicación: Cada pedido tiene una ubicación asociada.

- Agregar campos derivados útiles
Por ejemplo, un campo año_pedido o mes_pedido para facilitar reportes por tiempo:

ALTER TABLE Pedido
  ADD COLUMN año_pedido INT GENERATED ALWAYS AS (YEAR(fecha_pedido)) STORED,
  ADD COLUMN mes_pedido INT GENERATED ALWAYS AS (MONTH(fecha_pedido)) STORED;

- Ventas por cliente
CREATE VIEW resumen_ventas_cliente AS
SELECT 
  c.clienteID,
  c.c_nombre,
  SUM(d.monto_venta) AS total_ventas,
  SUM(d.utilidad) AS total_utilidad
FROM Cliente c
JOIN Pedido p ON c.clienteID = p.clienteID
JOIN DetallePedido d ON p.pedidoID = d.pedidoID
GROUP BY c.clienteID, c.c_nombre;

 - Ventas por producto
 CREATE VIEW resumen_ventas_producto AS
SELECT 
  pr.productoID,
  pr.nombre_producto,
  SUM(d.monto_venta) AS total_ventas,
  SUM(d.utilidad) AS total_utilidad,
  SUM(d.cantidad) AS total_unidades
FROM Producto pr
JOIN DetallePedido d ON pr.productoID = d.productoID
GROUP BY pr.productoID, pr.nombre_producto;

- ¿Cuáles son los productos que generaron ganancias mayores al promedio general?
SELECT productoID, nombre_producto, total_utilidad
FROM (
  SELECT pr.productoID, pr.nombre_producto, SUM(dp.utilidad) AS total_utilidad
  FROM Producto pr
  JOIN DetallePedido dp ON pr.productoID = dp.productoID
  GROUP BY pr.productoID, pr.nombre_producto
) AS utilidad_producto
WHERE total_utilidad > (
  SELECT AVG(utilidad) FROM DetallePedido
)
ORDER BY total_utilidad DESC;

- ¿Qué categoría generó más ingresos totales?
SELECT categoria, total_ventas
FROM (
  SELECT pr.categoria, SUM(dp.monto_venta) AS total_ventas
  FROM Producto pr
  JOIN DetallePedido dp ON pr.productoID = dp.productoID
  GROUP BY pr.categoria
) AS ventas_categoria
ORDER BY total_ventas DESC
LIMIT 1;

