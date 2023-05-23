-- Gabriel Sanchez Olveira 
CREATE TABLE Categoria (
  id_categoria int PRIMARY KEY identity not null,
  nombre_categoria varchar(40) not null
);

CREATE TABLE Producto (
  id_producto int PRIMARY KEY identity not null,
  precio int not null,
  cant_prod int not null,
  descripcion varchar(100) not null
  id_categoria int not null,
  FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Cliente (
  id_cliente int PRIMARY KEY identity not null,
  nom_cliente varchar(20) not null,
  telef_cliente varchar(20) not null,
  id_direccion int not null,
  FOREIGN KEY(id_direccion) REFERENCES Direccion(id_direccion)
);

CREATE TABLE Direccion (
  id_direccion int PRIMARY KEY identity not null,
  ruc_cliente varchar(30) not null,
  dir_cliente varchar(200) not null,
  ciudad_cliente varchar(30) not null
);

CREATE TABLE Encargado (
  id_encargado int PRIMARY KEY identity not null,
  nombre varchar(20) not null,
  primer_apellido varchar(20) not null,
  segundo_apellido varchar(20) not null
);

CREATE TABLE Factura (
  id_factura int PRIMARY KEY identity not null,
  importe int not null, 
  total int not null,
  id_cliente int not null,
  id_encargado int not null,
  id_producto int not null,
  FOREIGN KEY(id_producto) REFERENCES Producto(id_producto),
  FOREIGN KEY(id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY(id_encargado) REFERENCES Encargado(id_encargado)
);














