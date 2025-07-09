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
('SO-20335', 'Sean ODonnell', 'Home Office', 'United States', 'Westmoreland', 'New Hampshire', '03467', 'East'),
('AA-10480', 'Andrew Allen', 'Consumer', 'United States', 'Concord', 'North Carolina', '28027', 'South'),
('IM-15070', 'Irene Maddox', 'Consumer', 'United States', 'Seattle', 'Washington', '98103', 'West'),
('HP-14815', 'Harold Pawlan', 'Home Office', 'United States', 'Fort Worth', 'Texas', '76106', 'Central'),
('RA-19885', 'Ruben Ausman', 'Corporate', 'United States', 'Los Angeles', 'California', '90049', 'West'),
('ES-14080', 'Erin Smith', 'Corporate', 'United States', 'Melbourne', 'Florida', '32935', 'South'),
('ON-18715', 'Odella Nelson', 'Corporate', 'United States', 'Eagan', 'Minnesota', '55122', 'Central'),
('LH-16900', 'Lena Hernandez', 'Consumer', 'United States', 'Dover', 'Delaware', '19901', 'East');

SELECT * FROM Cliente;

# Productos
INSERT INTO Producto VALUES
('OFF-PA-100001','Office Supplies','Appliances','Stapler'),
('FUR-CH-100004','Furniture','Chairs','Office Chair'),
('TEC-PH-100024','Technology','Phones','iPhone Case'),
('OFF-PA-10002365', 'Office Supplies', 'Paper', 'Xerox 1967'),
('OFF-BI-10003656', 'Office Supplies', 'Binders', 'Fellowes PB200 Plastic Comb Binding Machine'),
('OFF-AP-10002311', 'Office Supplies', 'Appliances', 'Holmes Replacement Filter for HEPA Air Cleaner, Very Large Room, HEPA Filter'),
('OFF-ST-10003479', 'Office Supplies', 'Storage', 'Eldon Base for stackable storage shelf, platinum'),
('OFF-ST-10003282', 'Office Supplies', 'Storage', 'Advantus 10-Drawer Portable Organizer, Chrome Metal Frame, Smoke Drawers'),
('TEC-AC-10000171', 'Technology', 'Accessories', 'Verbatim 25 GB 6x Blu-ray Single Layer Recordable Disc, 25/Pack'),
('TEC-PH-10003988', 'Technology', 'Phones', 'LF Elite 3D Dazzle Designer Hard Case Cover, Lf Stylus Pen and Wiper For Apple Iphone 5c Mini Lite');

SELECT * FROM Producto;

# Pedidos
INSERT INTO Pedido VALUES
('CA-2017-152156','2017-11-08','2017-11-11','Second Class','CG-12520'),
('US-2018-108966','2018-10-11','2018-10-18','Standard Class','DV-13045'),
('US-2019-115812','2019-02-20','2019-02-22','First Class','SO-20335'),
('CA-2017-114412', '2017-04-15', '2017-04-20', 'Standard Class', 'AA-10480'),
('CA-2016-161389', '2016-12-05', '2016-12-10', 'Standard Class', 'IM-15070'),
('US-2015-118983', '2015-11-22', '2015-11-26', 'Standard Class', 'HP-14815'),
('CA-2016-101343', '2016-07-17', '2016-07-22', 'Standard Class', 'RA-19885'),
('CA-2017-139619', '2017-09-19', '2017-09-23', 'Standard Class', 'ES-14080'),
('CA-2016-118255', '2016-03-11', '2016-03-13', 'First Class', 'ON-18715'),
('CA-2016-169194', '2016-06-20', '2016-06-25', 'Standard Class', 'LH-16900');

SELECT * FROM Pedido;

# Detalles del pedido
INSERT INTO DetallePedido (pedidoID, productoID, ventas, cantidad, descuento, ganancia) VALUES
('CA-2017-152156','OFF-PA-100001',32.38,2,0.0,11.35),
('US-2018-108966','FUR-CH-100004',520.94,3,0.2,42.38),
('US-2019-115812','TEC-PH-100024',10.48,5,0.0,5.26),
('CA-2017-114412', 'OFF-PA-10002365', 15.552, 3, 0.2, 5.4432),
('CA-2016-161389', 'OFF-BI-10003656', 407.976, 3, 0.2, 132.5922),
('US-2015-118983', 'OFF-AP-10002311', 68.81, 5, 0.8, -123.858),
('CA-2016-101343', 'OFF-ST-10003479', 77.88, 2, 0, 3.894),
('CA-2017-139619', 'OFF-ST-10003282', 95.616, 2, 0.2, 9.5616),
('CA-2016-118255', 'TEC-AC-10000171', 45.98, 2, 0, 19.7714),
('CA-2016-169194', 'TEC-PH-10003988', 21.8, 2, 0, 6.104);

SELECT * FROM DetallePedido;
