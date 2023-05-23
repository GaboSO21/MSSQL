-- Tabla sin noramalizar
CREATE DATABASE Biblioteca;
use Biblioteca
CREATE TABLE NoNormalizada (
  codLibro int PRIMARY KEY identity not null,
  titulo varchar(40) not null,
  autor varchar(30) not null,
  editorial varchar(45) not null, 
  nombreLector varchar(100) not null,
  fechaDev date not null
);

-- Normalizacon
CREATE TABLE Autor (
  idAutor int PRIMARY KEY identity not null,
  nombre varchar(45) not null,
  primApellido varchar(45) not null,
  segApellido varchar(45) not null
);

CREATE TABLE Editorial (
  idEditorial int PRIMARY KEY identity not null,
  editorial varchar(45) not null
);

CREATE TABLE Libro (
  codLibro int PRIMARY KEY identity not null,
  titulo varchar(45) not null,
  idEditorial int not null,
  idAutor int not null,
  FOREIGN KEY(idEditorial) REFERENCES Editorial(idEditorial),
  FOREIGN KEY(idAutor) REFERENCES Autor(idAutor)
);

CREATE TABLE Lector (
  cedula varchar(45) PRIMARY KEY not null,
  nombre varchar(45) not null,
  primApellido varchar(45) not null,
  segApellido varchar(45) not null
);

CREATE TABLE Factura(
  idFactura int PRIMARY KEY not null,
  fechaDev date not null,
  codLibro int not null,
  cedulaLector varchar(45) not null,
  FOREIGN KEY(codLibro) REFERENCES Libro(codLibro),
  FOREIGN KEY(cedulaLector) REFERENCES Lector(cedula)
);
