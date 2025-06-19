# 1. Crear la base de datos y usarla
DROP DATABASE IF EXISTS tienda;
# Crea la base de datos tienda
CREATE DATABASE tienda;

USE tienda;

# 2. Crear tabla Cliente
CREATE TABLE Cliente (
    clienteID VARCHAR(20) PRIMARY KEY,
    c_nombre VARCHAR(100),
    segmento VARCHAR(50),
    pais VARCHAR(50),
    ciudad VARCHAR(50),
    estado VARCHAR(50),
    cod_postal VARCHAR(20),
    region VARCHAR(50)
);

# 3. Crear tabla Producto
CREATE TABLE Producto (
    productoID VARCHAR(20) PRIMARY KEY,
    categoria VARCHAR(50),
    subcategoria VARCHAR(50),
    p_nombre VARCHAR(255)
);

# 4. Crear tabla Pedido
CREATE TABLE Pedido (
    pedidoID VARCHAR(20) PRIMARY KEY,
    ped_fecha DATE,
    ped_envio DATE,
    tipo_envio VARCHAR(50),
    
    clienteID VARCHAR(20),
    	FOREIGN KEY (clienteID) 
    	REFERENCES Cliente(clienteID)
    	ON DELETE CASCADE
); 

# 5. Crear tabla DetallePedido (relación entre pedidos y productos)
CREATE TABLE DetallePedido (
    detallepedID INT AUTO_INCREMENT PRIMARY KEY,
    ventas DECIMAL(10,2),
    cantidad INT,
    descuento DECIMAL(4,2),
    ganancia DECIMAL(10,2),
    
    pedidoID VARCHAR(20),
    	FOREIGN KEY (pedidoID) 
    	REFERENCES Pedido(pedidoID)
    	ON DELETE CASCADE
    ,
    
    productoID VARCHAR(20),
    	FOREIGN KEY (productoID) 
    	REFERENCES Producto(productoID)
    	ON DELETE CASCADE
);

SHOW TABLES;

-- Agregando datos de ejemplo 

# Clientes
INSERT INTO Cliente VALUES
('CG-12520', 'Claire Gute', 'Consumer', 'United States', 'Henderson', 'Kentucky', '42420', 'South'),
('DV-13045', 'Darrin Van Huff', 'Corporate', 'United States', 'Fort Lauderdale', 'Florida', '33311', 'South'),
('SO-20335', 'Sean O\'Donnell', 'Home Office', 'United States', 'Westmoreland', 'New Hampshire', '03467', 'East');

SELECT * FROM Cliente;

# Productos
INSERT INTO Producto VALUES
('OFF-PA-100001','Office Supplies','Appliances','Stapler'),
('FUR-CH-100004','Furniture','Chairs','Office Chair'),
('TEC-PH-100024','Technology','Phones','iPhone Case');

SELECT * FROM Producto;

# Pedidos
INSERT INTO Pedido VALUES
('CA-2017-152156','2017-11-08','2017-11-11','Second Class','CG-12520'),
('US-2018-108966','2018-10-11','2018-10-18','Standard Class','DV-13045'),
('US-2019-115812','2019-02-20','2019-02-22','First Class','SO-20335');

SELECT * FROM Pedido;

# Detalles del pedido
INSERT INTO DetallePedido (pedidoID, productoID, ventas, cantidad, descuento, ganancia) VALUES
('CA-2017-152156','OFF-PA-100001',32.38,2,0.0,11.35),
('US-2018-108966','FUR-CH-100004',520.94,3,0.2,42.38),
('US-2019-115812','TEC-PH-100024',10.48,5,0.0,5.26);

SELECT * FROM DetallePedido;
