# Consultas - Tienda en línea _(Tarea 6)_

### Funciones de agregación realizadas en la base de datos con resultados: 

- **(a) _Media:_** Promedio de días entre pedido y envío.  
SELECT AVG(DATEDIFF(ped_envio, ped_fecha)) AS PromedioDiasEnvio
FROM Pedido;

    - **Resultado:** 33.9429

- **(b)**  
    - **_Mínimo:_** Producto con la menor venta en DetallePedido.  
SELECT pr.p_nombre, dp.ventas  
FROM Producto pr  
JOIN DetallePedido dp ON pr.productoID = dp.productoID  
WHERE dp.ventas = (  
    SELECT MIN(ventas) FROM DetallePedido  
);

        - **Resultado (Producto, Venta):** iPhone Case, 10.48

    - **_Máximo:_** Ciudad con la mayor ganancia máxima.  
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

        - **Resultado (Ciudad, Ganancia Máxima):** Erie, 5482.24

- **(c) _Q1:_** Calcular el primer cuartil de la columna ganancia en DetallePedido.  
SET @row := -1;  
SELECT ganancia  
FROM (  
  SELECT ganancia, @row := @row + 1 AS fila  
  FROM DetallePedido  
  ORDER BY ganancia  
) AS ordenadas  
WHERE fila = FLOOR((SELECT COUNT(*) FROM DetallePedido) * 0.25);

    - **Resultado:** 9.56

- **(d) _Moda:_** Tipo de envío mas usado.  
SELECT tipo_envio, COUNT(*) AS frecuencia  
FROM Pedido  
GROUP BY tipo_envio  
ORDER BY frecuencia DESC  
LIMIT 1;

    - **Resultado (Tipo de envío, Frecuencia):** Standard Class, 15.

- **(e) _Informe_**  
    - **Detalles:**  
    Durante el análisis de la base de datos, se obtuvieron resultados interesantes que permiten entender mejor el comportamiento de ventas y pedidos:  
        - Promedio de días entre pedido y envío:
        Se calculó la media del tiempo que transcurre desde la fecha del pedido hasta la fecha de envío, proporcionando un indicador de logística.

        - Producto con la menor venta:
        Se identificó cuál es el producto que ha generado la venta más baja registrada, lo cual puede señalar productos de baja demanda.
        - Ciudad con la mayor ganancia máxima:
        Se determinó cuál ciudad ha generado la mayor ganancia máxima en un pedido, información para estrategias comerciales.
        - Primer cuartil de la ganancia:
        Se calculó el primer cuartil de la ganancia en los detalles de pedido, conocer la distribución y variabilidad de las ganancias.
        - Tipo de envío más usado:
        La moda del tipo de envío revela la preferencia predominante de envío en los pedidos.  

    - **Recomendaciones:**
        - División de consultas:
        Una estrategia fue descomponer los problemas en partes simples y legibles, probando resultados parciales antes de construir la consulta completa. 

        - Estructura relacional de los datos:
        Al trabajar con varias tablas relacionadas (clientes, pedidos, productos, etc.), fue necesario aplicar con atencion los JOIN para evitar datos incorrectos.
        - Consultas SQL:
        Investigar el manejo de subconsultas, variables de usuario y agrupamientos complejos para encontrar soluciones factibles.

---
# Subconsultas - Tienda en línea _(Tarea 7)_

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
#### Estadísticos - Script exportado: [Tarea 6~Est](t6_fagreg.sql) || Subconsultas - Script exportado: [Tarea 7~Subc](t7_subc.sql)