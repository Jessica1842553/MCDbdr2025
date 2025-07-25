-- TAREA 9. PROCEDIMIENTOS Y FUNCIONES

USE tienda;

-- 1. Procedimiento: seasonal_naive_ventas

DELIMITER $$

DROP PROCEDURE IF EXISTS seasonal_naive_ventas$$

CREATE PROCEDURE seasonal_naive_ventas(IN anio_pred INT, IN mes_pred INT)
BEGIN
    DECLARE total_pred DECIMAL(10,2);

    SELECT SUM(dp.ventas) INTO total_pred
    FROM detallepedido dp
    JOIN pedido p ON dp.pedidoID = p.pedidoID
    WHERE YEAR(p.ped_fecha) = anio_pred - 1
      AND MONTH(p.ped_fecha) = mes_pred;

    IF total_pred IS NULL THEN
        SELECT 'No hay datos del mes anterior para predecir.' AS mensaje;
    ELSE
        SELECT 
            CONCAT('Predicción para ', anio_pred, '-', LPAD(mes_pred,2,'0')) AS periodo,
            total_pred AS prediccion_ventas;
    END IF;
END$$

DELIMITER ;


CALL seasonal_naive_ventas(2019, 2);

-- 2. Función: cant_prodcat

DELIMITER $$

DROP FUNCTION IF EXISTS cant_prodcat $$
CREATE FUNCTION cant_prodcat(cat VARCHAR(50))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM producto
    WHERE categoria = cat;

    RETURN total;
END $$

DELIMITER ;


SELECT cant_prodcat('Furniture') AS total_furniture;

