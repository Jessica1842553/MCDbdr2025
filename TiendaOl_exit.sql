-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `clienteID` varchar(20) NOT NULL,
  `c_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `segmento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cod_postal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('AA-10480','Andrew Allen','Consumer','United States','Concord','North Carolina','28027','South'),('CG-12520','Claire Gute','Consumer','United States','Henderson','Kentucky','42420','South'),('CP-5108','Court Squeers','Corporate','United States','Kansas City','Missouri','64149','Central'),('DI-5463','Son Bresman','Corporate','United States','Youngstown','Ohio','44511','South'),('DJ-6938','Nelly Pitkaithly','Home Office','United States','Detroit','Michigan','48242','West'),('DK-8644','Haleigh Plail','Consumer','United States','Staten Island','New York','10310','Central'),('DV-13045','Darrin Van Huff','Corporate','United States','Fort Lauderdale','Florida','33311','South'),('ES-14080','Erin Smith','Corporate','United States','Melbourne','Florida','32935','South'),('FA-6511','Maddalena Icke','Corporate','United States','North Port','Florida','34290','West'),('GB-1137','Reider Aldine','Consumer','United States','Albuquerque','New Mexico','87201','South'),('GF-2980','Trevor Loweth','Consumer','United States','Clearwater','Florida','33763','Central'),('GM-6352','Rolland Rigg','Consumer','United States','New Orleans','Louisiana','70129','South'),('GP-8713','Carleton Deport','Consumer','United States','Orlando','Florida','32885','West'),('HJ-9118','Care Stairs','Home Office','United States','Knoxville','Tennessee','37924','Central'),('HP-14815','Harold Pawlan','Home Office','United States','Fort Worth','Texas','76106','Central'),('IM-15070','Irene Maddox','Consumer','United States','Seattle','Washington','98103','West'),('JJ-3659','Ursula Thies','Home Office','United States','Washington','District of Columbia','20508','East'),('JL-5290','Andros Randles','Corporate','United States','Los Angeles','California','90010','South'),('JU-2313','Eldridge Willgrass','Consumer','United States','Orlando','Florida','32854','Central'),('KQ-4236','Bink Maxted','Corporate','United States','Buffalo','New York','14276','East'),('KU-4546','Gwyneth Newburn','Corporate','United States','Omaha','Nebraska','68179','South'),('LH-16900','Lena Hernandez','Consumer','United States','Dover','Delaware','19901','East'),('LY-5468','Issiah Placido','Corporate','United States','Erie','Pennsylvania','16534','South'),('MY-4952','Halette Cristobal','Consumer','United States','Colorado Springs','Colorado','80935','West'),('ON-18715','Odella Nelson','Corporate','United States','Eagan','Minnesota','55122','Central'),('OZ-3445','Desdemona Tapner','Corporate','United States','Green Bay','Wisconsin','54305','West'),('QH-4354','Hillel Huxton','Consumer','United States','Los Angeles','California','90035','Central'),('RA-19885','Ruben Ausman','Corporate','United States','Los Angeles','California','90049','West'),('SO-20335','Sean ODonnell','Home Office','United States','Westmoreland','New Hampshire','03467','East'),('TA-1738','Nani Alekhov','Consumer','United States','Baltimore','Maryland','21229','East'),('TR-4144','Marcile Spindler','Corporate','United States','Paterson','New Jersey','07505','Central'),('UE-7582','Reggy Bruck','Corporate','United States','Billings','Montana','59112','East'),('VR-4151','Lemuel Featherstone','Home Office','United States','Cleveland','Ohio','44111','East'),('XT-2688','Hilary Lynds','Consumer','United States','Cincinnati','Ohio','45243','Central'),('ZQ-6510','Mohammed Bumford','Consumer','United States','Sacramento','California','95852','West');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedido` (
  `detallepedID` int NOT NULL AUTO_INCREMENT,
  `ventas` decimal(10,2) NOT NULL,
  `cantidad` int DEFAULT NULL,
  `descuento` decimal(4,2) DEFAULT NULL,
  `ganancia` decimal(10,2) NOT NULL,
  `pedidoID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productoID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`detallepedID`),
  KEY `pedidoID` (`pedidoID`),
  KEY `productoID` (`productoID`),
  CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`pedidoID`) REFERENCES `pedido` (`pedidoID`) ON DELETE CASCADE,
  CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
INSERT INTO `detallepedido` VALUES (1,32.38,2,0.00,11.35,'CA-2017-152156','OFF-PA-100001'),(2,520.94,3,0.20,42.38,'US-2018-108966','FUR-CH-100004'),(3,10.48,5,0.00,5.26,'US-2019-115812','TEC-PH-100024'),(4,8190.73,5,0.48,2621.03,'US2017-3685','OFF-PA-10009464'),(5,4306.36,8,0.15,3122.11,'US2016-5110','FUR-CP-10009526'),(6,8241.61,1,0.30,-2472.48,'US2015-1182','FUR-CH-10007662'),(7,1798.57,9,0.16,1310.96,'CA2018-4027','OFF-TA-10004585'),(8,1035.91,3,0.21,473.07,'US2016-5274','TEC-BI-10007013'),(9,7816.88,8,0.41,3634.85,'US2018-6223','FUR-PH-10009759'),(10,2287.27,7,0.40,1045.61,'US2016-5064','FUR-PA-10000411'),(11,8133.17,2,0.12,3090.60,'CA2016-4806','FUR-TA-10005269'),(12,7300.36,5,0.17,4599.23,'US2016-3930','FUR-BI-10008283'),(13,8272.68,5,0.37,3557.25,'US2016-1294','FUR-CP-10008412'),(14,2426.19,3,0.50,404.37,'US2017-6230','TEC-PA-10009191'),(15,6317.81,2,0.20,1895.34,'CA2018-2302','OFF-TA-10008480'),(16,3435.58,7,0.29,1948.46,'CA2016-3030','TEC-CH-10008874'),(17,864.41,4,0.13,535.93,'CA2015-5213','FUR-CP-10001343'),(18,2267.69,4,0.39,816.37,'US2015-4436','FUR-AC-10003852'),(19,929.52,10,0.10,743.62,'US2016-8314','TEC-CP-10004131'),(20,285.41,1,0.34,-97.04,'CA2016-4798','TEC-CP-10001331'),(21,7794.66,6,0.13,5482.24,'US2018-2077','TEC-AC-10004209'),(22,8566.64,3,0.36,2627.10,'CA2015-5471','OFF-LA-10005958'),(23,8108.50,3,0.13,4351.56,'US2018-5110','OFF-BI-10004769'),(24,9611.47,1,0.47,-4517.39,'CA2016-3498','FUR-PH-10009321'),(25,1820.25,2,0.37,236.63,'CA2015-1304','TEC-LA-10009123'),(26,3598.22,8,0.33,1961.03,'CA2016-3311','OFF-CP-10001697'),(27,8308.17,3,0.38,2381.68,'CA2018-9341','TEC-AC-10008645'),(28,2865.98,10,0.10,2292.78,'CA2015-8978','TEC-BI-10005826'),(29,15.55,3,0.20,5.44,'CA-2017-114412','OFF-PA-10002365'),(30,407.98,3,0.20,132.59,'CA-2016-161389','OFF-BI-10003656'),(31,68.81,5,0.80,-123.86,'US-2015-118983','OFF-AP-10002311'),(32,77.88,2,0.00,3.89,'CA-2016-101343','OFF-ST-10003479'),(33,95.62,2,0.20,9.56,'CA-2017-139619','OFF-ST-10003282'),(34,45.98,2,0.00,19.77,'CA-2016-118255','TEC-AC-10000171'),(35,21.80,2,0.00,6.10,'CA-2016-169194','TEC-PH-10003988');
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pedidoID` varchar(20) NOT NULL,
  `ped_fecha` date NOT NULL,
  `ped_envio` date DEFAULT NULL,
  `tipo_envio` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `clienteID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`pedidoID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`clienteID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES ('CA-2016-101343','2016-07-17','2016-07-22','Standard Class','RA-19885'),('CA-2016-118255','2016-03-11','2016-03-13','First Class','ON-18715'),('CA-2016-161389','2016-12-05','2016-12-10','Standard Class','IM-15070'),('CA-2016-169194','2016-06-20','2016-06-25','Standard Class','LH-16900'),('CA-2017-114412','2017-04-15','2017-04-20','Standard Class','AA-10480'),('CA-2017-139619','2017-09-19','2017-09-23','Standard Class','ES-14080'),('CA-2017-152156','2017-11-08','2017-11-11','Second Class','CG-12520'),('CA2015-1304','2018-03-29','2018-01-04','Same Day','GP-8713'),('CA2015-5213','2014-02-19','2014-02-25','First Class','KU-4546'),('CA2015-5471','2018-06-04','2018-11-04','Standard Class','JU-2313'),('CA2015-8978','2016-06-01','2016-10-01','Standard Class','DK-8644'),('CA2016-3030','2016-10-27','2016-10-28','Same Day','TR-4144'),('CA2016-3311','2018-06-30','2018-06-07','Second Class','FA-6511'),('CA2016-3498','2014-12-15','2014-12-17','Second Class','GF-2980'),('CA2016-4798','2017-07-01','2017-11-01','Same Day','GM-6352'),('CA2016-4806','2014-12-30','2015-06-01','Standard Class','VR-4151'),('CA2018-2302','2015-03-12','2015-08-12','Second Class','DI-5463'),('CA2018-4027','2015-03-01','2015-08-01','First Class','OZ-3445'),('CA2018-9341','2017-01-21','2017-01-26','Second Class','GB-1137'),('US-2015-118983','2015-11-22','2015-11-26','Standard Class','HP-14815'),('US-2018-108966','2018-10-11','2018-10-18','Standard Class','DV-13045'),('US-2019-115812','2019-02-20','2019-02-22','First Class','SO-20335'),('US2015-1182','2014-08-30','2014-03-09','Standard Class','TA-1738'),('US2015-4436','2015-11-21','2015-11-26','Standard Class','KQ-4236'),('US2016-1294','2015-09-18','2015-09-22','Second Class','HJ-9118'),('US2016-3930','2015-01-23','2015-01-27','Standard Class','CP-5108'),('US2016-5064','2016-05-26','2016-05-28','First Class','ZQ-6510'),('US2016-5110','2016-01-07','2016-06-07','First Class','JJ-3659'),('US2016-5274','2016-10-22','2016-10-28','Standard Class','UE-7582'),('US2016-8314','2015-05-11','2015-11-11','Standard Class','JL-5290'),('US2017-3685','2014-10-24','2014-10-28','First Class','XT-2688'),('US2017-6230','2018-01-21','2018-01-23','Same Day','DJ-6938'),('US2018-2077','2014-11-18','2014-11-24','First Class','LY-5468'),('US2018-5110','2014-04-10','2014-10-10','Second Class','MY-4952'),('US2018-6223','2018-02-27','2018-03-03','Second Class','QH-4354');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `productoID` varchar(20) NOT NULL,
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcategoria` varchar(50) DEFAULT NULL,
  `p_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('FUR-AC-10003852','Furniture','Labels','Enermax Note Cards - Premium'),('FUR-BI-10008283','Technology','Chairs','Canon imageCLASS D1320'),('FUR-CH-100004','Furniture','Chairs','Office Chair'),('FUR-CH-10007662','Technology','Tables','Self-Adhesive Address Labels for Typewriters by Universal'),('FUR-CP-10001343','Technology','Furnishings','Tenex Box - Single Width'),('FUR-CP-10008412','Technology','Furnishings','Fellowes Super Stor/Drawer'),('FUR-CP-10009526','Technology','Chairs','Hon Deluxe Fabric Upholstered Stacking Chairs - Rounded Back'),('FUR-PA-10000411','Furniture','Labels','Hoover Microwave - White'),('FUR-PH-10009321','Office Supplies','Phones','Imation 8GB Mini TravelDrive USB 2.0 Flash Drive'),('FUR-PH-10009759','Office Supplies','Tables','Okidata Inkjet - Wireless'),('FUR-TA-10005269','Office Supplies','Binders','Hewlett Wireless Fax - Laser'),('OFF-AP-10002311','Office Supplies','Appliances','Holmes Replacement Filter for HEPA Air Cleaner, Very Large Room, HEPA Filter'),('OFF-BI-10003656','Office Supplies','Binders','Fellowes PB200 Plastic Comb Binding Machine'),('OFF-BI-10004769','Furniture','Furnishings','Konftel 250 Conference Phone - Charcoal Black'),('OFF-CP-10001697','Furniture','Tables','Logitech Gaming G510s Keyboard'),('OFF-LA-10005958','Technology','Phones','Logitech Wireless Mouse M510'),('OFF-PA-100001','Office Supplies','Appliances','Stapler'),('OFF-PA-10002365','Office Supplies','Paper','Xerox 1967'),('OFF-PA-10009464','Office Supplies','Phones','Bush Somerset Collection Bookcase'),('OFF-ST-10003282','Office Supplies','Storage','Advantus 10-Drawer Portable Organizer, Chrome Metal Frame, Smoke Drawers'),('OFF-ST-10003479','Office Supplies','Storage','Eldon Base for stackable storage shelf, platinum'),('OFF-TA-10004585','Technology','Tables','Eldon Light Bulb - Duo Pack'),('OFF-TA-10008480','Furniture','Paper','Acme Trimmer - High Speed'),('TEC-AC-10000171','Technology','Accessories','Verbatim 25 GB 6x Blu-ray Single Layer Recordable Disc, 25/Pack'),('TEC-AC-10004209','Furniture','Phones','Steelcase Hi-Back Tilter'),('TEC-AC-10008645','Office Supplies','Labels','Plantronics Cordless Phone Headset with In-line Volume M214C'),('TEC-BI-10005826','Office Supplies','Labels','Jabra BIZ 2300 Duo Corded Headset'),('TEC-BI-10007013','Office Supplies','Chairs','Eaton Computer Printout Paper 8.5 x 11'),('TEC-CH-10008874','Furniture','Phones','Tenex Lockers - Blue'),('TEC-CP-10001331','Technology','Phones','Aurora Paper Trimmer'),('TEC-CP-10004131','Technology','Labels','Invicta Office Printer Cart'),('TEC-LA-10009123','Technology','Labels','Logitech LS21 Speaker System - 2.1-CH Wired'),('TEC-PA-10009191','Furniture','Phones','Panasonic KX-TG9471B'),('TEC-PH-100024','Technology','Phones','iPhone Case'),('TEC-PH-10003988','Technology','Phones','LF Elite 3D Dazzle Designer Hard Case Cover, Lf Stylus Pen and Wiper For Apple Iphone 5c Mini Lite');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-08 23:51:33
