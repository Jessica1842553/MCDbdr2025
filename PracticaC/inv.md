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


