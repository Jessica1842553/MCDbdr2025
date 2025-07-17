# Tarea 8 - Vistas y Disparadores

### Vistas realizadas en la base de datos - Tienda en línea

- **(a) _JOIN:_**
    - Nombre: vista_mp_mya
    - Descripción: Muestra los productos con mayores ventas, agrupados por mes y año.
    - Tablas: Pedido, DetallePedido, Producto.
    - Es útil para analizar ventas por producto a lo largo del tiempo.  
        1. Agrupa por año y mes del pedido (año_pedido, mes_pedido) 
        2. Suma las ventas totales por cada producto (p_nombre).

- **(b) _LEFT JOIN:_**
    - Nombre: vista_pr_ventas
    - Descripción: Lista todos los productos y sus ventas.
    - Tablas: Producto, DetallePedido.
    - Detectar productos que nunca se han vendido, incluye _LEFT JOIN_ para que todos los productos aparezcan, aunque no tengan detalles de pedido.
        1. Muestra todos los productos existentes.
        2. Si el producto fue vendido al menos una vez, muestra:  
        Cuánto se vendió (ventas), cuántas unidades (cantidad) y cuánto se ganó (ganancia).
        3. Si el producto nunca fue vendido, los campos ventas, cantidad, y ganancia serán NULL.

- **(c) _RIGHT JOIN:_**
    - Nombre: vista_ped_dc
    - Descripción: Muestra todos los detalles de cada pedido, uniendo informacion del cliente.
    - Tablas: DetallePedido, Producto, Pedido, Cliente.
    - Generar reportes completos de ventas y analizar comportamiento de clientes, incluye _RIGHT JOIN_ para pedidos cuyos productos ya no están registrados en la tabla Producto.
        1. Reúne todos los detalles de venta (DetallePedido).
        2. Agrega la información del producto vendido (Producto) — incluso si el producto ya no existe.
        3. Incluye información del pedido principal (Pedido): fecha y tipo de envío.
        4. También incluye datos del cliente que hizo la compra (Cliente).

- **(d) _Subconsulta:_**
    - Nombre: vista_pr_ganancia
    - Descripción: Muestra productos cuya ganancia total es superior al promedio general.
    -  Tablas: Producto, DetallePedido.
    - Identificar productos rentables.
        1. Une la tabla Producto con DetallePedido (relacionando productos con sus ventas).
        2. Agrupa los resultados por producto (productoID, p_nombre).
        3. Calcula la ganancia total de cada producto (suma de todas sus ventas).
        4. Calcula el promedio general de ganancia por línea de pedido.
        5. Filtra los productos: muestra aquellos cuya suma de ganancias es mayor a ese promedio y ordena los productos de manera descendente.


## Disparador (TRIGGER)

Un disparador es un bloque de código SQL que se ejecuta automáticamente cuando ocurre un evento en una tabla, como:
- **_Insert:_** Cuando se inserta un nuevo registro.
- **_Update:_** Cuando se actualiza un valor.
- **_Delete:_** Cuando se elimina un registro.

La utilidad principal de un trigger es mejorar la gestión de la base de datos, ya que no requieren que un usuario los ejecute. Además, pueden prevenir errores en los datos, modificar valores de una vista, sincronizar tablas, entre otros. [1](https://es.wikipedia.org/wiki/Trigger_(base_de_datos)#:~:text=Un%20trigger%20o%20disparador%20es,las%20que%20se%20encuentra%20asociado.)

### TRIGGER realizados en la base de datos - Tienda en línea

1. **_UPDATE:_** Registra cambios en el tipo de envío o fecha de envío en la tabla Pedido.

    - Se activa después de una actualización en la tabla Pedido.
    - Compara el valor antiguo y nuevo de los campos tipo_envio y ped_envio.  
    Si alguno cambió, inserta un registro en la tabla BitUpdPed con:
        - pedidoID.
        - Fecha y hora de la actualización.
        - Valor anterior y Valor nuevo.

2. **_DELETE:_** Registrar al eliminar un pedido.

    - Se ejecuta después de eliminar un pedido en la tabla Pedido.  
        Guarda:
        1. El pedidoID eliminado.
        2. La fecha y hora exacta.
        3. El clienteID relacionado.
        4. Un mensaje del proceso.

---
#### Vistas y Disparadores - Script: [Tarea 8](View_Trg.sql)
---
### **Referencias**
[<sup>[1]</sup>](https://es.wikipedia.org/wiki/Trigger_(base_de_datos)#:~:text=Un%20trigger%20o%20disparador%20es,las%20que%20se%20encuentra%20asociado.)  «Trigger (base de datos)». Wikipedia, The Free Encyclopedia.