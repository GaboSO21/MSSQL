-- Normalizacion - Tabla NO NORMALIZADA
CREATE DATABASE Almacen;
CREATE TABLE Producto (
  codProducto int,
  descripcion varchar(30),
  fabricante varchar(30),
  fechaFabricacion date,
  vendedor varchar(40)
);

INSERT INTO Producto (
  codProducto, descripcion, fabricante, fechaFabricacion, vendedor
) VALUES ( 100, 'Martillo' , 'Stanley', '20200318' , 'EMC Costa Rica'),
 ( 200, 'Sierra Circular' , 'Truper', '20211214' , 'FBC Panama'),
 ( 300, 'Pieza Mecanica' , 'Vicegrip', '20181113' , 'DTC Panama'),
 ( 400, 'Torno Electronico' , 'Heller', '20130801' , 'EPA Costa Rica'),
 ( 500, 'Lijadora' , 'Stanley', '20220521' , 'El Mar Costa Rica'),
 ( 600, 'Serrucho' , 'Kley', '20141101' , 'FHC Honduras');

-- Tablas Normalizadas
DROP TABLE Producto;

CREATE TABLE Fabricante (
  codFabricacion int PRIMARY KEY identity not null,
  nombre varchar(30) not null
);

CREATE TABLE Pais (
  idPais int PRIMARY KEY identity not null,
  nombre varchar(45) not null
);

CREATE TABLE Vendedor(
  codVendedor int PRIMARY KEY identity not null,
  nombre varchar(40) not null,
  idPais int not null,
  FOREIGN KEY(idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Producto (
  codProducto int PRIMARY KEY identity not null,
  descripcion varchar(30) not null,
  fechaFabricacion date not null,
  codFabricacion int not null,
  codVendedor int not null,
  FOREIGN KEY(codFabricacion) REFERENCES Fabricante(codFabricacion),
  FOREIGN KEY(codVendedor) REFERENCES Vendedor(codVendedor)
);

INSERT INTO Fabricante (
  nombre
) VALUES ( 'Stanley' ),
('Truper'), ('Vicegrip'), ('Heller'), ('Kley');

INSERT INTO Pais (
  nombre
) VALUES ( 'Costa Rica' ),
('Panama'), ('Honduras');

INSERT INTO Vendedor (
  nombre, idPais
) VALUES ( 'EMC' , 1 ),
('FCB', 2), 
('DTC', 2),
('EPA', 1),
('El Mar', 1),
('FHC', 3);

INSERT INTO Producto (
  descripcion, fechaFabricacion, codFabricacion, codVendedor
) VALUES ( 'Martillo' , '20200318', 1 , 1 ),
('Sierra circular', '20211214', 2, 2),
('Pinza Mecanica', '20181113', 3, 3),
('Torno Electronico', '20130801', 4, 4),
('Lijadora', '20220521', 2, 1);

CREATE view consultaProducto as 
SELECT Producto.descripcion, Producto.fechaFabricacion, Fabricante.nombre, Vendedor.nombre
  FROM Producto, Fabricante, Vendedor
  WHERE Producto.codFabricacion = Fabricante.codFabricacion 
  and Producto.codVendedor = Vendedor.codVendedor;

SELECT * FROM consultaProducto;

SELECT count(codProducto) as "Total de Productos" FROM Producto;
