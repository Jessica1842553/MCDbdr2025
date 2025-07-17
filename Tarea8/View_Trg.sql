-- TAREA 8. VISTAS Y DISPARADORES

USE tienda;

-- VISTAS
-- a) JOIN

-- DROP VIEW IF EXISTS vista_mp_mya;
CREATE VIEW vista_mp_mya AS
SELECT 
    p.año_pedido,
    p.mes_pedido,
    pr.p_nombre,
    SUM(dp.ventas) AS total_ventas
FROM Pedido p
JOIN DetallePedido dp ON p.pedidoID = dp.pedidoID
JOIN Producto pr ON dp.productoID = pr.productoID
GROUP BY p.año_pedido, p.mes_pedido, pr.p_nombre
ORDER BY p.año_pedido, p.mes_pedido, total_ventas DESC;

SELECT * FROM vista_mp_mya;

-- b) LEFT JOIN

-- DROP VIEW IF EXISTS vista_pr_ventas;
CREATE VIEW vista_pr_ventas AS
SELECT 
    pr.productoID,
    pr.p_nombre,
    pr.categoria,
    dp.ventas,
    dp.cantidad,
    dp.ganancia
FROM Producto pr
LEFT JOIN DetallePedido dp ON pr.productoID = dp.productoID;

SELECT * FROM vista_pr_ventas;

-- c) RIGHT JOIN

-- DROP VIEW IF EXISTS vista_ped_dc;
CREATE VIEW vista_ped_dc AS
SELECT 
    dp.detallepedID,
    dp.pedidoID,
    p.ped_fecha,
    p.tipo_envio,
    p.clienteID,
    c.c_nombre AS nombre_cliente,
    dp.productoID,
    pr.p_nombre,
    pr.categoria,
    dp.cantidad,
    dp.ventas,
    dp.ganancia
FROM Producto pr
RIGHT JOIN DetallePedido dp ON pr.productoID = dp.productoID
JOIN Pedido p ON dp.pedidoID = p.pedidoID
JOIN Cliente c ON p.clienteID = c.clienteID;

SELECT * FROM vista_ped_dc;

-- d) SUBCONSULTA

-- DROP VIEW IF EXISTS vista_pr_ganancia;
CREATE VIEW vista_pr_ganancia AS
SELECT 
    productoID,
    p_nombre,
    total_utilidad
FROM (
    SELECT 
        pr.productoID,
        pr.p_nombre,
        SUM(dp.ganancia) AS total_utilidad
    FROM Producto pr
    JOIN DetallePedido dp ON pr.productoID = dp.productoID
    GROUP BY pr.productoID, pr.p_nombre
) AS utilidad_producto
WHERE total_utilidad > (
    SELECT AVG(ganancia) FROM DetallePedido
)
ORDER BY total_utilidad DESC;

SELECT * FROM vista_pr_ganancia;

-- DISPARADOR
-- 1. UPDATE: Registra cambios en el tipo de envío o fecha de envío en la tabla Pedido.
-- DROP TABLE IF EXISTS BitUpdPed;
CREATE TABLE BitUpdPed (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedidoID VARCHAR(20),
    fecha_actualizacion DATETIME,
    campo_modificado VARCHAR(50),
    valor_anterior VARCHAR(255),
    valor_nuevo VARCHAR(255)
);

DROP TRIGGER IF EXISTS trg_upd_pedido;

DELIMITER //

CREATE TRIGGER trg_upd_pedido
AFTER UPDATE ON Pedido
FOR EACH ROW
BEGIN
    IF NOT (OLD.tipo_envio <=> NEW.tipo_envio) THEN
        INSERT INTO BitUpdPed(pedidoID, fecha_actualizacion, campo_modificado, valor_anterior, valor_nuevo)
        VALUES (OLD.pedidoID, NOW(), 'tipo_envio', OLD.tipo_envio, NEW.tipo_envio);
    END IF;
    
    IF NOT (OLD.ped_envio <=> NEW.ped_envio) THEN
        INSERT INTO BitUpdPed(pedidoID, fecha_actualizacion, campo_modificado, valor_anterior, valor_nuevo)
        VALUES (OLD.pedidoID, NOW(), 'ped_envio', CAST(OLD.ped_envio AS CHAR), CAST(NEW.ped_envio AS CHAR));
    END IF;
END//

DELIMITER ;


-- 2. DELETE: Registrar cada eliminación de pedido
-- DROP TABLE IF EXISTS BitDelPedido;

CREATE TABLE BitDelPedido (
    pedidoID VARCHAR(20),
    fecha_eliminacion DATETIME,
    clienteID VARCHAR(20),
    motivo VARCHAR(100)
);

-- DROP TRIGGER IF EXISTS trg_del_pedido;

DELIMITER //

CREATE TRIGGER trg_del_pedido
AFTER DELETE ON Pedido
FOR EACH ROW
BEGIN
    INSERT INTO BitDelPedido (pedidoID, fecha_eliminacion, clienteID, motivo)
    VALUES (OLD.pedidoID, NOW(), OLD.clienteID, 'Eliminación de pedido registrado');
END//

DELIMITER ;


