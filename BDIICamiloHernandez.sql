--- primer punto: NOTA 1.0
USE master;
CREATE DATABASE PTOVTA
ON PRIMARY
(NAME='PTOVTA', 
FILENAME = 'C:\SQLDATA\City.mdf', -- RGG: EL nombre deL mdf debía ser PTOVTA
SIZE=10000MB,
MAXSIZE=50000, 
FILEGROWTH=10%)

LOG ON
(NAME='PTOVTA_log', 
FILENAME = 'C:\SQLLog\City1_log.ldf', 
SIZE=5000MB,
MAXSIZE=10000MB, 
FILEGROWTH=20%)

ALTER DATABASE PTOVTA  -- RGG: Se pedia crear 3 archivos secundarioa y solo se ve uno
	ADD FILEGROUP PTOVTACiudad1;
ALTER DATABASE PTOVTA
	ADD file
	(
		NAME='PTOVTA',
		FILENAME='C:\SQLDATA\City2.ndf',
		SIZE=5000MB,
		MAXSIZE=10000MB,
		FILEGROWTH=5%
		)
	TO FILEGROUP PTOVTACiudad1;


EXEC sp_detach_db@dbname='PTOVTA';  -- rgg: Esto que es

CREATE DATABASE PTOVTA ON
(FILENAME='C:\SQLDATA\City.mdf'),
(FILENAME='C:\SQLLog\City1_log.ldf'),
(FILENAME='C:\SQLDATA\City2.ndf')
FOR ATACH;
--------- segundo punto: Nota: 0.0

USE PTOVTA;  -- RGG: NO esta el esquema PTOXLY
GO
CREATE SCHEMA Documento;
GO
CREATE SCHEMA Detalle;
GO
CREATE SCHEMA Producto;


USE PTOVTA;  --- RGG: Que es esto 
CREATE TABLE Documento.CODDOC
	(
		
	)
--------- Tercer punto: Nota: 00