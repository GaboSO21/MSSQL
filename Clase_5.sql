create database Escuela2023;
use Escuela2023;
create table Alumno(
  codAlumno varchar(12) primary key not null,
  primApellido varchar(30) not null,
  segApellido varchar(30) not null,
  nombre varchar(30) not null);
  
 create table Especialidad(
   codEspecialidad int primary key not null,
   especialidad varchar(30));
create table Curso(
  codCurso varchar(12) primary key not null,
  nomCurso varchar(30) not null,
  codEspecialidad int not null,
  foreign key(codEspecialidad) references Especialidad(codEspecialidad));
create table Oficina(
   idOficina int primary key not null,
   oficina varchar(6) not null);
create table Docente(
  codDocente int primary key not null,
  nomDocente varchar(30) not null,
  apeDocente varchar(30) not null,
  idOficina int not null,
  foreign key(idOficina) references Oficina(idOficina));
create table Matricula(
  numMatricula int IDENTITY(1,1) primary key not null,
  fecha date not null,
  codAlumno varchar(12) not null,
  codCurso varchar(12) not null,
  codDocente int not null,
  foreign key(codAlumno) references Alumno(codAlumno),
  foreign key(codCurso) references Curso(codCurso),
  foreign key(codDocente) references Docente(codDocente));

-- Script profesor

USE Escuela2023;
INSERT INTO Alumno(codAlumno, nombre, primApellido, segApellido) VALUES 
(200 , 'Juan' , 'Torres' , 'Gomez'),
(300, 'Felicia' , 'Lagos' , 'Rojas'),
(400 , 'Jorge' , 'Solano' , 'Mora');

INSERT INTO Especialidad (codEspecialidad, especialidad) VALUES (1 , 'Ingeneria en Sistemas') , (2 , 'Ingeneria Industrial') , (3, 'Ingeneria Electrica'),
(4, 'Ingeneria Civil');

INSERT INTO Curso (codCurso,nomCurso,codEspecialidad) 
VALUES  (101 , 'Programacion Basica' , 1),  
        (202 , 'Int. Programacion' , 1),
        (102 , 'Ingenieria de Procesos', 2),
        (103 , 'Quimica', 2),
        (104 , 'Solidos', 3),
        (105, 'Disenno de cimentaciones',3);

INSERT INTO Oficina(idOficina,oficina) 
VALUES (1, 'LAB101'),(2,'LAB102'),(3,'LAB103');

INSERT INTO Docente(codDocente,nomDocente,apeDocente,idOficina) 
VALUES(1,'Juan' , 'Perez' , 1), (2, 'Valentina' , 'Laverde' , 1),
      (3, 'Julieta' , 'Ponce' , 2),(4, 'Martin' , 'de los Rios' , 2),
      (5, 'Andres' , 'del Pino' , 3),(6,'Maria','de la Renta',3);

INSERT INTO Matricula(fecha,codDocente,codAlumno,codCurso)
VALUES('20230201' , 1, 100, 202), ('20230202' , 2, 200 ,102),
(GETDATE(),3,300,103);

-- Altera tabla Alumno para agregarle atributo de edad
ALTER TABLE Alumno
ADD edad int;

-- Setea tabla de Alumno para agregarle edad a varios registros
UPDATE Alumno
  SET edad = 15 WHERE nombre = 'Juan';
UPDATE Alumno
  SET edad = 21
  WHERE nombre = 'Felicia';
UPDATE Alumno
  SET edad = 20
  WHERE nombre = 'Jorge';

-- Select de Alumno y se sacan diferentes datos de la edad de las personas en la tabla
SELECT avg(edad) as 'Promedio edades' FROM Alumno;
SELECT sum(edad) as 'Total de Edades' FROM Alumno;
SELECT min(edad) as 'Edad persona menor' FROM Alumno;
SELECT max(edad) as 'Edad de la persona mayor' FROM Alumno;
SELECT count(edad) as 'Total de personas' FROM Alumno;

-- Select que ordena por atributo, ascendente y descendentemente
SELECT * FROM Alumno order by edad;
SELECT * FROM Alumno order by edad desc;
SELECT * FROM Alumno where edad between 18 and 21;

-- Select donde regresa especialidad y nombre de curso donde el codigo de especialidad sea el mismo
SELECT Especialidad.especialidad , Curso.nomCurso 
FROM Especialidad,Curso
WHERE Especialidad.codEspecialidad = Curso.codEspecialidad

-- Igual que select anterior, solo que por medio de un join 
SELECT Especialidad , Curso.nomCurso
FROM Especialidad 
join Curso on 
Curso.codEspecialidad = Especialidad.codEspecialidad;

-- ??? 
SELECT Curso.codEspecialidad 
  FROM Curso 
  GROUP BY Curso.codEspecialidad;

-- Crear una vista, funciona como un alias para una consulta
create view ConsultaEspecialidadCurso as 
SELECT Especialidad.especialidad , Curso.nomCurso
FROM Especialidad , Curso
WHERE Especialidad.codEspecialidad = Curso.codEspecialidad;
-- Asi se usa la vista o el alias creado anteriormente 
SELECT * FROM ConsultaEspecialidadCurso WHERE especialidad = 'Ingeneria en Sistemas';

-- Devuelve alumnos con edades mayor al promedio de la tabla
SELECT * FROM Alumno 
WHERE edad > (SELECT avg(edad) FROM Alumno);

-- Este constraint sirve para que el id solo sea de 1 a 7 y no permita otros
-- Util para tablas que requieran personas con mayoria de edad por ejemplo
CREATE TABLE Provincia (
  idProvincia int PRIMARY KEY not null,
  nombreProv varchar(20) not null,
  constraint idProv CHECK ( idProvincia between 1 and 7 )
);

INSERT INTO Provincia (
  idProvincia , nombreProv
) VALUES ( 1,'Cartago' ) , (2, 'San Jose') , (3, 'Alajuela') , (4, 'Heredia'), (5 , 'Puntarenas') , (6 , 'Limon') , (7 , "Guanacaste");


