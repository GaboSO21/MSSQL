-- Gabriel Sanchez Olveira
-- TABLAS
CREATE DATABASE estrenos;
use estrenos;

CREATE TABLE Productor (
  idProductor int PRIMARY KEY identity not null,
  nombre varchar(4) not null,
);

CREATE TABLE Categoria (
  idCategoria int PRIMARY KEY identity not null,
  descCategoria varchar(40) not null
);

CREATE TABLE Pais (
  idPais int PRIMARY KEY identity not null,
  nombre varchar(3) not null
);

CREATE TABLE PaisCasaProductor (
  idPaisCasa int PRIMARY KEY identity not null,
  idPais int not null,
  idProductor int not null,
  FOREIGN KEY(idPais) REFERENCES Pais(idPais),
  FOREIGN KEY(idProductor) REFERENCES Productor(idProductor)
);
 
CREATE TABLE Pelicula (
  codPelicula int PRIMARY KEY identity not null,
  tituloPelic varchar(40) not null,
  fecha date not null,
  duracion int not null,
  idCategoria int not null,
  idPaisCasa int not null,
  FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria),
  FOREIGN KEY(idPaisCasa) REFERENCES PaisCasaProductor(idPaisCasa)
);

-- INSERCIONES
INSERT INTO Productor (
  nombre
) VALUES ( 'WB' ), ( 'PX' ), ( 'TCF' ), ( 'AS' ), ( 'FC' );

INSERT INTO Categoria (
  descCategoria
) VALUES ( 'Action' ), ( 'Drama' ), ( 'Superheroes' ), ( 'Animado' );

INSERT INTO Pais (
  nombre
) VALUES ( 'USA' ), ( 'ENG' ), ( 'JPN' );

INSERT INTO PaisCasaProductor (
  idPais, idProductor
) VALUES ( 1, 1 ), ( 1, 3), ( 2, 2 ), ( 2, 3 ), ( 2, 5 ), ( 3, 1 ), ( 3, 4);
 
INSERT INTO Pelicula (
  tituloPelic, fecha, duracion, idCategoria, idPaisCasa 
) VALUES ( 'Superman', '2018-10-8', 188, 1, 1 ),
         ( 'Always Alice', '2015-02-13', 101, 2, 3 ),
         ( 'Shazam', '2013-07-21', 132, 3, 4 ),
         ( 'Mulan', '2002-12-20', 88, 4, 6 ),
         ( 'Black Superman', '2011-03-22', 82, 3, 7 ),
         ( 'Aquaman', '2018-06-15', 142, 3, 5 ),
         ( 'League of Justice', '2017-07-14', 120, 3, 2 ),
         ( 'Lego', '2019-01-20', 160, 4, 1 );

-- MODIFICACION
UPDATE Pelicula
  SET duracion = (duracion + 30)
  WHERE tituloPelic LIKE '%i%';

UPDATE Pelicula
  SET fecha DATEADD(DAY,5,fecha);

-- VARIOS
SELECT Pelicula.tituloPelic, Pais.nombre FROM Pelicula
INNER JOIN PaisCasaProductor on PaisCasaProductor.idPaisCasa = Pelicula.idPaisCasa
INNER JOIN Pais on Pais.idPais = PaisCasaProductor.idPais
WHERE Pais.nombre = 'JPN';

SELECT Pelicula.tituloPelic, Productor.nombre FROM Pelicula
INNER JOIN PaisCasaProductor on PaisCasaProductor.idPaisCasa = Pelicula.idPaisCasa
INNER JOIN Productor on Productor.idProductor = PaisCasaProductor.idProductor
WHERE Productor.nombre = 'WB';

SELECT Pelicula.tituloPelic FROM Pelicula
WHERE Pelicula.tituloPelic LIKE 'L%';

-- CONSULTA
SELECT Pelicula.tituloPelic, Productor.nombre FROM Pelicula
INNER JOIN PaisCasaProductor on PaisCasaProductor.idPaisCasa = Pelicula.idPaisCasa
INNER JOIN Productor on Productor.idProductor = PaisCasaProductor.idProductor;

-- ELIMINACION
UPDATE Categoria
   SET descCategoria = 'ELIMINADA'
   WHERE descCategoria = 'Superheroes';
  
UPDATE Productor
  SET nombre = 'ELIM'
  WHERE nombre = 'TCF';









