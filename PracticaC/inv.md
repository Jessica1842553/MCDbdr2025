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

2. delete
DELETE FROM Pedido WHERE pedidoID = 'CA-2017-152156';
SELECT * FROM BitDelPedido;

1. update
UPDATE Pedido
SET tipo_envio = 'First Class', ped_envio = '2017-11-12'
WHERE pedidoID = 'CA-2017-152156';
SELECT * FROM BitUpdPed;

