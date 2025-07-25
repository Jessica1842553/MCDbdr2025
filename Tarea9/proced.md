# Tarea 9 - Procedimientos y Funciones

### **1. Procedimiento: seasonal_naive_ventas**
Este procedimiento predice las ventas de un mes futuro basándose en las ventas del mismo mes del año anterior (modelo Seasonal Naive clásico).

**_Paso a paso:_** 
1. Se crea el procedimiento llamado seasonal_naive_ventas.  
    Tiene dos parámetros de entrada:  
    - anio_pred (año para el que se quiere hacer la predicción).
    - mes_pred (mes para el que se quiere hacer la predicción).

2. DECLARE total_pred DECIMAL(10,2)  
    - Declara una variable local llamada total_pred que almacenará la suma de ventas.  
    - El tipo es decimal con 10 dígitos en total y 2 decimales.
3. Consulta principal:  
    SELECT SUM(dp.ventas) INTO total_pred  
    FROM detallepedido dp  
    JOIN pedido p ON dp.pedidoID = p.pedidoID  
    WHERE YEAR(p.ped_fecha) = anio_pred - 1  
    AND MONTH(p.ped_fecha) = mes_pred;
    - Suma las ventas (SUM(dp.ventas)) del mes indicado (mes_pred) pero del año anterior (anio_pred - 1).
    - Para esto se une las tablas detallepedido (ventas) con pedido (fecha del pedido).
    - El resultado se guarda en la variable total_pred.
4. Condicional:  
    IF total_pred IS NULL THEN  
    SELECT 'No hay datos del mes anterior para predecir.' AS mensaje;  
    ELSE  
    SELECT  
        CONCAT('Predicción para ', anio_pred, '-', LPAD(mes_pred,2,'0')) AS periodo,  
        total_pred AS prediccion_ventas;  
    END IF;  
    - Si no hay datos (total_pred IS NULL), muestra un mensaje indicando que no hay datos.
    - Si hay datos, muestra dos columnas:
        - Periodo: Texto con el año y mes para la predicción (ej. "Predicción para 2019-02").
        - Prediccion_ventas: Total de ventas del mes correspondiente del año anterior (que sirve como predicción).  

**_Como usarlo:_**  
Para ejecutar el procedimiento y obtener la predicción, se usa la instrucción CALL con dos parámetros: **año y mes**. 
- Ejemplo: CALL seasonal_naive_ventas(2019, 2);
    - **2019** es el año para el se quiere la predicción.
    - **2** es el mes (febrero).
    - Esto hará la predicción para _febrero de 2019_ basándose en las ventas de _febrero de 2018_.

### **2. Función: cantidad_prodcat**
Esta función cuenta cuántos productos únicos se han vendido por categoría.

**_Paso a paso:_** 

1.  Inicio función:  
    CREATE FUNCTION cant_prodcat(cat VARCHAR(50))  
    RETURNS INT  
    DETERMINISTIC  
    READS SQL DATA  
    BEGIN  
    - Se define la función llamada cant_prodcat que recibe un parámetro cat tipo texto (máximo 50 caracteres).
    - La función devuelve un número entero (INT).
    - _DETERMINISTIC_ - Indica que la función siempre devuelve el mismo resultado para el mismo parámetro.
    - _READS SQL DATA_ - Indica que la función solo lee datos de la base, no los modifica.
    - Inicio del bloque BEGIN ... END donde va el código de la función.

2. Cuenta:  
    DECLARE total INT;
    - Se declara una variable interna llamada _total_ de tipo entero para almacenar la cuenta.

3. Consulta:  
    SELECT COUNT(*) INTO total  
    FROM producto  
    WHERE categoria = cat;  
    - Se ejecuta una consulta que cuenta cuántas filas de la tabla producto tienen la categoría igual al parámetro cat.
    - El resultado se guarda en la variable _total_.

4. Final función:  
    RETURN total;  
    END $$  
    - Devolvemos el valor guardado en _total_.
    - Fin de la función.  

**_Como usarlo:_**  
Se puede usar en cualquier consulta SQL para obtener el número de productos en una categoría, es cuestión de sustituir la categoría a analizar.  
- Ejemplo: SELECT cant_prodcat('Furniture') AS total_furniture;
    - Mostrará cuántos productos hay en esta categoría: _Furniture_.  

**_Observación:_**  
Se puede utilizar como:
- _Consulta directa_ - Se puede probar la función directamente con una categoría conocida.  
- _Usarla en una tabla_ - Se puede combinar con otras consultas o expresiones, así como ver varias categorías en una misma consulta.

---
#### Procedimientos y Funciones - Script: [Tarea 9](PrYFun.sql)
