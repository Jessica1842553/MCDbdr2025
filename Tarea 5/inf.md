# Importar/Exportar

Para extender la base de datos y realizar pruebas adicionales, se generaron datos ficticios utilizando Mockaroo, lo cual permitió simular nuevos clientes, productos y pedidos con características similares a los datos reales.  
Se realizaron 'schemas' por separado para cada tabla como se ha manejado en la estructura relacional de los datos: Cliente, Producto, Pedido y Detalle Pedido.

**Dificultades:**
- IDs: Fue necesario modificar manualmente los registros utilizando el tipo de dato - Custom List, de ahí especificar a detalle los valores, ejemplo: IDs de clientes o productos.
- Formato de datos: Algunas columnas como fechas o valores decimales, requerían un formato específico para ser aceptadas, ejemplo: convertir fechas al formato YYYY-MM-DD.  
- Uso de formulas: Utilizar correctamente las operaciones, en casos como la tabla Detalle Pedido (ventas, descuento y ganancias), juntar adecuadamente los IDs, nombre de productos, etc. 

**Recomendaciones:**
- Verificar relaciones: Asegurar que los campos que son claves foráneas existan previamente en las tablas correspondientes (como clienteID o productoID).
- Exportar a CSV: Antes de insertar, generar los datos en CSV permite revisar los valores fácilmente y hacer limpieza o ajustes.
- Nombre de tablas/schemas: Para mayor facilidad al vaciar los datos, utilizar el mismo nombre de las columnas ya realizadas en la base de datos como en Mockaroo.

---
Base de datos con los datos ficticios generados en Mockaroo, exportado desde MySQL Workbench:  
[Tienda en linea - Exportación](TiendaOl_exit.sql)