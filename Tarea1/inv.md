# BD no estructurada - Tienda en línea: 

**Base de datos para una tienda en línea.**  
La base/conjunto de datos a utilizar contiene transacciones ocurridas entre 2009-2011 para una tienda en línea en Reino Unido. Incluye información detallada sobre los productos vendidos, cantidades, precios, fechas y códigos de cliente.

**_- Características clave:_**  
- <u>Factura</u>: Número de factura de venta. (Texto alfanúmerico)
- <u>Código de producto</u>: Identificador único del producto. (Texto alfanúmerico)
- <u>Descripción</u>: Descripción del producto. (Texto)
- <u>Cantidad</u>: Número de unidades vendidas. (Entero)
- <u>Precio unitario</u>: Precio por unidad en libras esterlinas. (Número decimal)
- <u>Fecha</u>: Fecha de la transacción. (Fecha y hora)
- <u>Código de cliente</u>: Identificador del cliente. (Entero)
- <u>País</u>: País del cliente. (Texto alfanúmerico)

# Sistema de Gestión de Bases de Datos (SGBD) 

**_Software que permite administrar una base de datos._**

Proporciona el método de organización necesario para el almacenamiento y recuperación flexible de grandes cantidades de datos.  Esto significa que mediante este programa se puede utilizar, configurar y extraer información almacenada. [<sup>[1]</sup>](https://es.wikipedia.org/wiki/Sistema_de_gesti%C3%B3n_de_bases_de_datos)

**_- Componentes de un SGBD:_**

Los elementos básicos que lo conforman son tres: el diccionario de datos, el lenguaje de definición de datos y el lenguaje de manipulación de datos. [<sup>[2]</sup>](https://www.ionos.mx/digitalguide/hosting/cuestiones-tecnicas/sistema-gestor-de-base-de-datos-sgbd/#c221916)

- _Diccionario de datos:_ Consiste en una lista de metadatos que reflejan las características de los diversos tipos de datos incluidos en la base de datos. Además, estos metadatos informan sobre los permisos de uso de cada registro y su representación física. 
- _Lenguaje de definición de datos:_ El lenguaje de definición de datos, también llamado lenguaje de base de datos o DDL (data definition language), sirve para estructurar el contenido de la base de datos. Gracias a este lenguaje, es posible crear, modificar y eliminar objetos individuales, como referencias, relaciones o derechos de usuario.
- _Lenguaje de manipulación de datos:_ Mediante el lenguaje de manipulación de datos o DML (data manipulation language), se pueden introducir nuevos registros en la base de datos, así como eliminar, modificar y consultar los que ya contiene. Este lenguaje también permite comprimir y extraer los datos.

## DuckDB
Es un Sistema de Gestión de Bases de Datos Relacionales (SGBDR) de código abierto y orientado a columnas.  
Esto significa que es un sistema para gestionar datos almacenados en relaciones. Una relación es esencialmente un término matemático para una tabla.

Cada tabla es una colección de filas con nombre. Cada fila de una tabla dada tiene el mismo conjunto de columnas con nombre, y cada columna pertenece a un tipo de dato específico. Las tablas se almacenan dentro de esquemas, y una colección de esquemas constituye la base de datos completa a la que se puede acceder. [<sup>[3]</sup>](https://duckdb.org/docs/stable/sql/introduction.html)

**_Características:_**

- Utiliza un motor de procesamiento de consultas vectorizado. 
- Es especial entre los sistemas de gestión de bases de datos porque no tiene ninguna dependencia externa y puede compilarse solo con un compilador de C++11.
- DuckDB utiliza un formato de almacenamiento de archivo único para almacenar datos en disco, diseñado para soportar escaneos eficientes y actualizaciones masivas, anexiones y eliminaciones.

**_Observaciones:_**

DuckDB, no compite con los sistemas de gestión de bases de datos tradicionales como MSSQL, PostgreSQL y Oracle Database. Si bien utiliza SQL para consultas, DuckDB se dirige a aplicaciones sin servidor y proporciona respuestas extremadamente rápidas utilizando archivos Apache Parquet o su propio formato de almacenamiento. Estas características lo convierten en una opción popular para el análisis interactivo de grandes conjuntos de datos. [<sup>[4]</sup>](https://en.wikipedia.org/wiki/DuckDB)


##
### **Referencias**
[<sup>[1]</sup>](https://es.wikipedia.org/wiki/Sistema_de_gesti%C3%B3n_de_bases_de_datos)  «Sistema de gestion de base de datos». Wikipedia, The Free Encyclopedia.   
[<sup>[2]</sup>](https://www.ionos.mx/digitalguide/hosting/cuestiones-tecnicas/sistema-gestor-de-base-de-datos-sgbd/#c221916) «Introducción al sistema gestor de base de datos (SGBD)». IONOS Digitalguide.  
[<sup>[3]</sup>](https://en.wikipedia.org/wiki/DuckDB) «DuckDB». Wikipedia, The Free Encyclopedia.  
[<sup>[4]</sup>](https://duckdb.org/docs/stable/sql/introduction.html) "Documentación de DuckDB: Introducción a SQL" . / «SQL introduction». DuckDB.