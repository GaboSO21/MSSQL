-- SQL Server Notes

CREATE DATABASE Matricula; -- Crear BD
use Matricula; -- Usar BD especificada 

-- Crear tabla con primary key y diferentes atributos
CREATE TABLE Estudiante (
	idEstudiante varchar(9) primary key not null,
	nombre varchar(20) not null, 
	primerApellido varchar(20) not null,
	segundoApellido varchar(20) not null,
	idAsegurado varchar(20) not null unique -- Unique para no repetir
);

-- Insertar en una tabla, se pueden varios a la vez
INSERT INTO ESTUDIANTE(idEStudiante, nombre, primerApellido, segundoApellido, idAsegurado) 
VALUES ('305430692' , 'Gabriel' , 'Sanchez' , 'Olveira' , 'ASEGURADO-001') , 
	   ('123123123' , 'Andres' , 'Ospina' , 'Peringa' , 'ASEGURADO-002');

DROP TABLE Estudiante; -- Borrar la tabla

SELECT * FROM Estudiante; -- Regresa todos los datos de la tabla

SELECT * FROM Estudiante WHERE nombre = 'Gabriel'; -- Retorna solo fila que contenga de nombre "Gabriel"  

SELECT * FROM Estudiante WHERE nombre LIKE 'A%' or nombre like 'a'; -- Retorna filas donde nombre comience con "A" o "a"

SELECT * FROM Estudiante WHERE nombre LIKE '%a'; -- Retorna filas donde nombre termine con 'a'

SELECT * FROM Estudiante WHERE nombre LIKE '%a%'; -- Retorna filas donde nombre contenga una 'a'

SELECT * FROM Estudiante WHERE substring(nombre, 3, 1)='s'; -- Retorna filas donde apartir del caracter 3 de la columna nombre sea una 's' 
															-- substring( 'columna' , 'posicionPrimLetra' , 'cantLetras') 

ALTER TABLE Estudiante ADD edad int; -- Agregar una columna a la tabla 

UPDATE Estudiante SET edad = 20 WHERE nombre = 'Gabriel'; -- Actualizar columna de una fila 

SELECT * FROM Estudiante WHERE edad>=20 AND edad<=23; -- Retorna filas donde se cumlpa la condicion establecida
SELECT * FROM Estudiante WHERE edad BETWEEN 20 AND 23; -- Lo mismo

SELECT * FROM Estudiante WHERE nombre not like '%e'; -- Retorna filas donde la columna de nombre no terminen en 'e'

DELETE FROM Estudiante WHERE nombre = 'Gabriel'; -- Borra fila que contenga fila nombre con valor Gabriel

