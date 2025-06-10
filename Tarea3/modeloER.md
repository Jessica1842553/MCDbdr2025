## Esquema Relacional - Tienda en línea

**Cliente** (<u>ClienteID (PK)</u>, NombreCliente, Segmento, País, Estado, Ciudad).  
**Producto** (<u>ProductoID (PK)</U>, NombreProducto, Categoría, Subcategoría).  
**Pedido** (<u>PedidoID (PK)</u>, FechaPedido, FechaEnvio, TipoEnvio, ClienteID (FK)).  
**Detalle Pedido** (<u>DetalleID (PK)</u>, PedidoID (FK), ProductoID (FK), Ventas, Cantidad, Descuento, Ganancia).  

**Cliente_Pedido** (<u>Cliente ID</u>, Segmento, País, Ciudad, Estado, Región).  
**Pedido_Detalle Pedido** (<u>PedidoID</u>, <u>ProductoID</u>).


### _Relaciones clave:_

 - **Uno a muchos:** Cliente - Pedido, Pedido - Detelle Pedido, Producto - Detalle Pedido.
 - **Muchos a muchos:** Pedido - Producto. 

 ## Diagrama Relacional
 