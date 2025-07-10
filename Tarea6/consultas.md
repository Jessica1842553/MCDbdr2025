# Consultas - Tienda en línea

### Funciones de agregación realizadas en la base de datos con resultados: 

- **(a) _Media:_** Promedio de días entre pedido y envío.  
SELECT AVG(DATEDIFF(ped_envio, ped_fecha)) AS PromedioDiasEnvio
FROM Pedido;

    - **Resultado:** 33.9429

- **(b)**  
    - **_Minimo:_** Producto con la menor venta en DetallePedido  
SELECT pr.p_nombre, dp.ventas  
FROM Producto pr  
JOIN DetallePedido dp ON pr.productoID = dp.productoID  
WHERE dp.ventas = (  
    SELECT MIN(ventas) FROM DetallePedido  
);

        - **Resultado (Producto, Venta):** iPhone Case, 10.48

    - **_Maximo:_** Ciudad con la mayor ganancia maxima.  
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

        - **Resultado (Ciudad, Ganancia Maxima):** Erie, 5482.24

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

- **(d) _MODA:_** Tipo de envio mas usado.  
SELECT tipo_envio, COUNT(*) AS frecuencia  
FROM Pedido  
GROUP BY tipo_envio  
ORDER BY frecuencia DESC  
LIMIT 1;

    - **Resultado (Tipo de envio, Frecuencia):** Standard Class, 15.

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
#### Estadísticos - Script exportado: [Tarea 6~Est](t6_fagreg.sql)