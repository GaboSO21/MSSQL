CREATE DATABASE Escuela2022;
use Escuela2022;

CREATE TABLE Alumno (
  codAlumno int primary key identity not null,
  primApellido varchar(30) not null,
  segApellido varchar(30) not null,
  nombre varchar(30) not null
);

INSERT INTO Alumno (
  primApellido, segApellido, nombre
) VALUES ( 'Rojas', 'Fuentes', 'Angel' ),
('Diaz', 'Fonseca', 'Luis'),
('Gonzalez', 'Herrera', 'Rafael');

CREATE TABLE Especialidad (
  codEspecialidad int primary key identity not null,
  descripcion varchar(30) 
);

-- Agregar columna y llave foranea a Alumno
ALTER TABLE Alumno
   ADD codEspecialidad int;

ALTER TABLE Alumno
   ADD FOREIGN KEY(codEspecialidad) REFERENCES Especialidad(codEspecialidad);

INSERT INTO Especialidad (
  descripcion
) VALUES ( 'Ingenieria Industrial' ),
('Ingenieriea en Sistemas'),
('Ingenieriea Civil');

CREATE PROCEDURE INSERCIONES AS 
INSERT INTO Especialidad (
  descripcion
) VALUES ( 'Ingenieria Industrial' ),
('Ingenieriea en Sistemas'),
('Ingenieriea Civil');

EXEC INSERCIONES;

ALTER PROCEDURE INSERCIONES AS 
BEGIN 
INSERT INTO Especialidad (
  descripcion
) VALUES ( 'Ingenieria Industrial' ),
('Ingenieriea en Sistemas'),
('Ingenieriea Civil');
SELECT * FROM Producto;  
END;

EXEC INSERCIONES;











