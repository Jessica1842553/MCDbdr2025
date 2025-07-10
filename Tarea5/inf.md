# Importar/Exportar

Para extender la base de datos y realizar pruebas adicionales, se generaron datos ficticios utilizando Mockaroo[<sup>[1]</sup>](https://mockaroo.com/), lo cual permitió simular nuevos clientes, productos y pedidos con características similares a los datos reales.  
Se realizaron 'schemas' por separado para cada tabla como se ha manejado en la estructura relacional de los datos: Cliente, Producto, Pedido y Detalle Pedido.

**Dificultades:**
- **_IDs:_** Fue necesario modificar manualmente los registros utilizando el tipo de dato - Custom List, de ahí especificar a detalle los valores, ejemplo: IDs de clientes o productos.
- **_Formato de datos:_** Algunas columnas como fechas o valores decimales, requerían un formato específico para ser aceptadas, ejemplo: convertir fechas al formato YYYY-MM-DD.  
- **_Uso de formulas:_** Utilizar correctamente las operaciones, en casos como la tabla Detalle Pedido (ventas, descuento y ganancias), juntar adecuadamente los IDs, nombre de productos, etc. 

**Recomendaciones:**
- **_Verificar relaciones:_** Asegurar que los campos que son claves foráneas existan previamente en las tablas correspondientes (como clienteID o productoID).
- **_Exportar a CSV:_** Antes de insertar, generar los datos en CSV permite revisar los valores fácilmente y hacer limpieza o ajustes.
- **_Nombre de tablas/schemas:_** Para mayor facilidad al vaciar los datos, utilizar el mismo nombre de las columnas ya realizadas en la base de datos como en Mockaroo.  

#### [<sup>[1]</sup>](https://mockaroo.com/)  «Mockaroo - Random Data Generator».  
---
_Base de datos con los datos ficticios generados en Mockaroo, exportado desde MySQL Workbench: [Tienda en linea - Exportación](TiendaOl_exit.sql)_