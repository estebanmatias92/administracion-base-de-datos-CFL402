-- Mostrar todas la bases de datos (DBs)
SHOW DATABASES;


-- Posicionarme en la DB "escuela"
USE escuela;


-- Mostrar las tablas que contiene
SHOW TABLES;

-- Eliminar tabla si existe
DROP TABLE IF EXISTS alumnos;

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    dni INT NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    telefono BIGINT NOT NULL, 
    email VARCHAR(30) UNIQUE,
    curso VARCHAR(100) NOT NULL
);

-- Ver datos de la tabla recien creada
DESCRIBE alumnos;


-- Crear registros
INSERT INTO alumnos(nombre, dni, direccion, telefono, email, curso) 
VALUES 
("Jose Perez", 12345678, "Magallanes 2300", 2235667788, "jose.perez@gmail.com", "Administracion de Base de Datos"),
("Maria Rodriguez", 23456789, "Belgrano 1400", 2235987451, "maria.rodriguez@gmail.com", "Desarrollo Web Full Stack"),
("Carlos Gomez", 34567890, "Rivadavia 3500", 2235097632, "carlos.gomez@gmail.com", "Desarrollo de Software"),
("Laura Fernandez", 45678901, "San Martin 4500", 2235222158, "laura.fernandez@gmail.com", "Seguridad Informatica"),
("Juan Martinez", 56789012, "Luro 3200", 2235433920, "juan.martinez@gmail.com", "Administracion de Redes"),
("Patricia Sanchez", 67890123, "Av. Colon 500", 2235356950, "patricia.sanchez@gmail.com", "Diseño de Interfaz de Usuario");

-- Mostrar los cambios
SELECT * FROM alumnos;


-- Borrar un registro
DELETE FROM alumnos 
WHERE nombre = "Jose Perez";

-- Mostrar los cambios
SELECT * FROM alumnos;


-- Actualizar un registro
UPDATE alumnos
SET nombre ="Maria Palomino"
WHERE id = 2;

-- Mostrar los cambios
SELECT * FROM alumnos;


-- Eliminar base de datos si existe
DROP DATABASE IF EXISTS appsalon;

-- Crear base de datos si NO existe
CREATE DATABASE IF NOT EXISTS appsalon;

-- Mostrar las DBs de nuevo
SHOW DATABASES;

-- Cambiar de base de datos
USE appsalon;


-- Eliminar tabla si existe
DROP TABLE IF EXISTS servicios;

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS servicios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    precio DECIMAL(7, 3) NOT NULL
);


