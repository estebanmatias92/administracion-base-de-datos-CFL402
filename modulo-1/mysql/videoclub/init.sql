-- Mostrar todos los schemas/databases
SHOW DATABASES;
-- Eliminar database si existe
DROP DATABASE IF EXISTS videoclub;
-- Crear database si NO existe
CREATE DATABASE IF NOT EXISTS videoclub;
-- Usar la database si NO existe
USE videoclub;


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    dni INT NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    telefono BIGINT NOT NULL,
    email VARCHAR(30) UNIQUE
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS generos(
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);


-- Crear tabla si NO existe (tabla asociativa)
CREATE TABLE IF NOT EXISTS clientes_generos(
    id_cliente INT NOT NULL,
    id_genero INT NOT NULL,
    CONSTRAINT PK_clientes_generos PRIMARY KEY (id_cliente, id_genero),
    CONSTRAINT FK_clientes_generos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_clientes_generos_generos FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS clasificaciones(
    id_clasificacion INT PRIMARY KEY AUTO_INCREMENT,
    estreno BOOLEAN NOT NULL DEFAULT FALSE
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS peliculas(
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    empresa VARCHAR(50) NOT NULL,
    fecha_estreno DATE NOT NULL DEFAULT "1997-08-29",
    duracion TIME NOT NULL DEFAULT "00:00:00",
    id_clasificacion INT NOT NULL,
    CONSTRAINT FK_peliculas_clasificaciones FOREIGN KEY (id_clasificacion) REFERENCES clasificaciones(id_clasificacion)
);


-- Crear tabla si NO existe (tabla asociativa)
CREATE TABLE IF NOT EXISTS peliculas_generos(
    id_pelicula INT NOT NULL,
    id_genero INT NOT NULL,
    CONSTRAINT PK_peliculas_generos PRIMARY KEY (id_pelicula, id_genero),
    CONSTRAINT FK_peliculas_generos_peliculas FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    CONSTRAINT FK_peliculas_generos_generos FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS videos(
    id_video INT PRIMARY KEY AUTO_INCREMENT,
    id_pelicula INT NOT NULL,
    secuencia VARCHAR(100),
    CONSTRAINT FK_videos_peliculas FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula)
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS precios(
    id_precio INT PRIMARY KEY AUTO_INCREMENT,
    id_clasificacion INT NOT NULL,
    precio DECIMAL(7,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT FK_precios_clasificaciones FOREIGN KEY (id_clasificacion) REFERENCES clasificaciones(id_clasificacion)
);


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS alquileres(
    id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha DATE NOT NULL DEFAULT "1997-08-29",
    CONSTRAINT FK_alquileres_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


-- Crear tabla si NO existe (tabla asociativa)
CREATE TABLE IF NOT EXISTS alquileres_videos(
    id_alquiler INT NOT NULL,
    id_video INT NOT NULL,
    id_precio INT NOT NULL,
    CONSTRAINT PK_alquileres_videos PRIMARY KEY (id_alquiler, id_video),
    CONSTRAINT FK_alquileres_videos_alquileres FOREIGN KEY (id_alquiler) REFERENCES alquileres(id_alquiler),
    CONSTRAINT FK_alquileres_videos_videos FOREIGN KEY (id_video) REFERENCES videos(id_video),
    CONSTRAINT FK_alquileres_videos_precios FOREIGN KEY (id_precio) REFERENCES precios(id_precio)
);



INSERT INTO clientes(nombre, dni, direccion, telefono, email)
VALUES 
("Carlos", 20300400, "Independencia 3000", 2235112233, "carlos_92@gmail.com"),
("Cristian", 30400500, "San Martin 2200", 2335001122, "cristian_93@gmail.com"),
("Hernan", 40500600, "Genova 5000", 2335607080, "hernan_93@gmail.com"),
("Matias", 15150240, "Rawson 2500", 2235445566, "matias_92@gmail.com");


INSERT INTO generos(nombre)
VALUES 
("Animacion"),
("Ciencia Ficcion"),
("Terror"),
("Drama"),
("Suspenso"),
("Romance"),
("Cyberpunk"),
("Accion");


INSERT INTO clientes_generos(id_cliente, id_genero) 
VALUES 
(2, 1),
(4, 7),
(4, 2),
(1, 5),
(3, 5),
(1, 1),
(3, 7),
(2, 8);


INSERT INTO clasificaciones(estreno)
VALUES
(TRUE),
(FALSE);


INSERT INTO peliculas(nombre, empresa, fecha_estreno, duracion, id_clasificacion)
VALUES
("The Lord of the Rings 2", "Universal", "2001-01-01", "03:00:00", 2),
("Spider-Man: Miles Morales", "Marvel", "2023-08-10", "01:30:15", 1),
("Terminator", "Universal", "1995-03-15", "01:40:00", 2),
("Jujutsu Kaisen 0", "Tensei", "2022-10-20", "02:01:00", 2),
("Dune 2", "WB", "2024-01-01", "03:00:00", 1);


INSERT INTO peliculas_generos(id_pelicula, id_genero)
VALUES
(2, 5),
(1, 2),
(3, 8),
(2, 8),
(2, 1),
(3, 7),
(4, 8),
(5, 8),
(5, 2),
(2, 7),
(1, 8);


INSERT INTO videos(id_pelicula, secuencia)
VALUES
(3, 1),
(2, 2),
(4, 1),
(5, 2),
(1, 1),
(5, 2),
(5, 2),
(2, 2);


INSERT INTO precios(id_clasificacion, precio)
VALUES
(1, 9999.99),
(2, 4999.99);


INSERT INTO alquileres(id_cliente, fecha)
VALUES
(2, "2023-08-27"),
(4, "2023-09-01"),
(1, "2023-09-01"),
(4, "2023-09-10"),
(3, "2023-09-11"),
(1, "2023-09-11");

INSERT INTO alquileres_videos(id_alquiler, id_video, id_precio)
VALUES 
(1, 2, 1),
(2, 3, 2),
(3, 5, 2),
(4, 1, 2),
(5, 7, 1),
(6, 4, 1);


-- Probando traer varias tablas (las peliculas y sus generos)
SELECT peliculas.nombre, generos.nombre 
FROM peliculas 
INNER JOIN peliculas_generos ON peliculas.id_pelicula = peliculas_generos.id_pelicula 
INNER JOIN generos ON peliculas_generos.id_genero = generos.id_genero 
ORDER BY generos.nombre;

-- Conocer que estrenos fueron alquilados y que clientes los alquilaron
SELECT peliculas.nombre, clasificaciones.estreno, clientes.nombre, alquileres.fecha
FROM peliculas
INNER JOIN clasificaciones ON peliculas.id_clasificacion = clasificaciones.id_clasificacion
INNER JOIN videos ON peliculas.id_pelicula = videos.id_pelicula
INNER JOIN alquileres_videos ON videos.id_video = alquileres_videos.id_video
INNER JOIN alquileres ON alquileres_videos.id_alquiler = alquileres.id_alquiler
INNER JOIN clientes ON alquileres.id_cliente = clientes.id_cliente
HAVING clasificaciones.estreno = TRUE
ORDER BY alquileres.fecha;


-- Cuantos videos de cada pelicula se alquilaron?
SELECT peliculas.nombre, COUNT(alquileres_videos.id_video) AS videos_alquilados
FROM peliculas
INNER JOIN videos USING (id_pelicula)
INNER JOIN alquileres_videos USING (id_video)
INNER JOIN alquileres USING (id_alquiler)
GROUP BY videos.id_pelicula;


-- Usuario que mas peliculas alquilo?
SELECT clientes.nombre, COUNT(alquileres_videos.id_video) AS videos_alquilados
FROM clientes
INNER JOIN alquileres USING (id_cliente)
INNER JOIN alquileres_videos USING (id_alquiler)
INNER JOIN videos USING (id_video)
GROUP BY clientes.id_cliente
ORDER BY videos_alquilados DESC;