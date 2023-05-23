-- Tabla sin normalizar
CREATE DATABASE practica_4;
USE practica_4;
CREATE TABLE Factura (
  numFactura int PRIMARY KEY identity not null,
  fecha date not null,
  idCliente varchar(4) not null,
  nombre varchar(20) not null,
  descripcion varchar(100) not null,
  cantComprada int not null,
  precio float not null,
  totalLinea float not null
);

-- Normalizacion
DROP TABLE Factura;

CREATE TABLE Producto (
  idProducto int PRIMARY KEY identity not null,
  descripcion varchar(100) not null,
  precio float not null
);

CREATE TABLE Cliente (
  idCliente varchar(4) PRIMARY KEY  not null, 
  nombre varchar(10) not null,
  primApellido varchar(10) not null
);

CREATE TABLE Factura (
  numFactura int PRIMARY KEY identity not null,
  fecha date not null,
  idCliente varchar(4) not null,
  FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
);

CREATE TABLE DetalleFactura (
  idDetalle int PRIMARY KEY identity not null,
  cantComprada int not null,
  totalLinea float not null,
  idProducto int not null,
  numFactura int not null,
  FOREIGN KEY(idProducto) REFERENCES Producto(idProducto),
  FOREIGN KEY(numFactura) REFERENCES Factura(numFactura)
);

-- Inserciones
INSERT INTO Cliente (
  idCliente, nombre, primApellido 
) VALUES ('C001', 'Clark', 'Kent' ), ('C002', 'Lisa', 'Lane'), ('C003', 'Bruno', 'Diaz'), ('C004', 'Jason', 'Todd'), ('C005','Robert', 'Banner'), ('C006', 'Peter', 'Parker');

INSERT INTO Producto (
  descripcion, precio
) VALUES ( 'Moto G Plus', 800.00), ('iPhone XR', 800.00), ('Samsung Galaxy J7', 700.00), ('Huaweii P9', 850.00), ('iPhone XS', 583.33), ('LG Nexus 5x', 280.00), ('iPhone 11', 1450.00), ('iPhone 12', 900.00);

INSERT INTO Factura (
  fecha, idCliente
) VALUES ('2020-11-30', 'C001'),
('2020-12-15', 'C002'),
('2020-12-17', 'C003'),
('2020-12-22', 'C004'),
('2020-12-23', 'C005'),
('2020-12-28', 'C006');

INSERT INTO DetalleFactura (
  cantComprada, totalLinea, idProducto, numFactura
) VALUES ( 1, 800.00, 1, 1 ),
(2, 1600.00, 2, 1),
(2, 1400.00, 3, 2),
(2, 1700.00, 4, 3),
(3, 1750.00, 5, 3),
(4, 1120.00, 6, 4),
(1, 1450.00, 7, 5),
(2, 1800.00, 8, 6);

UPDATE Producto
  SET descripcion = REPLACE(descripcion, 'iPhone', 'Telefono Apple')
  WHERE descripcion LIKE '%iPhone%';

SELECT Cliente.nombre, Producto.descripcion FROM Factura
INNER JOIN DetalleFactura on DetalleFactura.numFactura = Factura.numFactura
INNER JOIN Cliente on Cliente.idCliente = Factura.idCliente
INNER JOIN Producto on DetalleFactura.idProducto = Producto.idProducto
WHERE Producto.descripcion like '%Telefono Apple%';










