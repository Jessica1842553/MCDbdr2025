# Elimina la base de datos clase si existe
DROP DATABASE IF EXISTS clase;
# Crea la base de datos clase
CREATE DATABASE clase;

USE clase;

# Elimina tabla autor si existe
DROP TABLE IF EXISTS autor;
# Creación de tabla autor
CREATE TABLE autor(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	apellido_paterno VARCHAR(50),
	apellido_materno VARCHAR(50),
	fecha_nacimiento DATE,
	hombre BOOL,
	nacionaliad VARCHAR(50)
);

# Elimina tabla lector si existe
DROP TABLE IF EXISTS lector;
# Creación de tabla lector
CREATE TABLE lector (
  id INT PRIMARY KEY AUTO_INCREMENT,
  correo VARCHAR(50) UNIQUE,
  nombre VARCHAR(50) NOT NULL,
  apellido_paterno VARCHAR(50),
  apellido_materno VARCHAR(50),
  calle VARCHAR(50),
  colonia VARCHAR(50)
);

# Elimina tabla libro si existe
DROP TABLE IF EXISTS libro;
# Creación de tabla libro
CREATE TABLE libro (
	id int PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(50) NOT NULL, 
	idioma VARCHAR(50),
	edicion INT,
	editorial VARCHAR(50),
	fecha_publicacion DATE,
	
	autor_id INT,
		FOREIGN KEY(autor_id) # Declaración de llave foránea 
		REFERENCES autor(id) 
		ON DELETE CASCADE # Regla para propagar eliminación
);

# Muestra todas las tablas
SHOW TABLES;

# Muestra las columnas de la tabla libro
DESCRIBE libro;

# Elimina la tabla libro
# DROP TABLE libro;

# Inserta dos autores en la tabla libro
# sólo especificando el nombre
INSERT INTO autor (nombre) VALUES
	('Lewis'),
	('Miguel');

# Muestra * (todas las columnas) de la tabla autor
SELECT * FROM autor;

# Elimina registros de autor
# con id menor a 3
DELETE FROM autor 
	WHERE id < 3;

#DELETE FROM autor
#	WHERE nombre = 'Miguel';

INSERT INTO autor (nombre, apellido_paterno) VALUES
	('Lewis', 'Carroll'),
	('Miguel', 'de Cervantes');

# Insertar libros con llave foránea a la tabla autor
# Recordar que los autores fueron borrados
# así que sus ids empiezan en 3
INSERT INTO libro (titulo, autor_id) VALUES
	('Alicia en el país de las maravillas', 3),
	('El Quijote', 4),
	('Alcia a través del espejo',3);

# Reinicia la tabla
# TRUNCATE TABLE libro;

# Al eliminar un autor, se propaga su eliminación en tablas
# que tengan ON DELETE CASCADE
DELETE FROM autor
	WHERE nombre = 'Miguel';

SELECT * FROM libro;
