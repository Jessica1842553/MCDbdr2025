# Subconsultas - Tienda en línea

Se realizaron ajustes utilizando subconsultas enfocados para facilitar la manipulacion de la base de datos:  

1. Agregando campos: año_pedido y mes_pedido.  
    - Añadir estos campos mejora la eficiencia de las consultas por tiempo.
    - Evita tener que usar YEAR() y MONTH() cada vez que se requiera un reporte.
    - Ejemplo de Ventas por año: permite identificar años con mayor volumen de pedidos.
    - Ejemplo de Mejores productos por mes y año: permite detectar los productos más vendidos por período.

2. Productos con mayores ganancias al promedio general.
    - Encuentra productos destacados en términos de rentabilidad.

3. Categoría con más ingresos totales
    - Identifica la categoría más fuerte en ventas.

4. Códigos postales. 
    - Se modifico los codigos postales de VARCHAR a INT para descartar problemas de datos incoherentes.
---
#### Subconsultas - Script exportado: [Tarea 7~Subc](t7_subc.sql)