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

-- Ver el esquema de la tabla servicios
DESCRIBE servicios;


-- Mostrar todos los registros en la tabla servicios
SELECT * FROM servicios;

-- Crear datos
INSERT INTO servicios(nombre, precio)
VALUES 
("Corte de cabello masculino", 500.000),
("Corte de cabello femenino", 600.000),
("Coloración de cabello", 800.000),
("Lavado y peinado", 350.000),
("Tratamiento de keratina", 1200.000),
("Depilación facial", 300.000),
("Manicure y Pedicure", 700.000);

-- Mostrar todos los registros en la tabla servicios
SELECT * FROM servicios;

-- Eliminar el servicio "Manicure y Pedicure" con ID 7
DELETE FROM servicios WHERE id = 7;

-- Mostrar todos los registros en la tabla servicios
SELECT * FROM servicios;

-- Actualizar el "precio" de "Corte de cabello masculino" (con id 1)
UPDATE servicios
SET precio = 1500.5
WHERE id = 1;

-- Mostrar todos los registros en la tabla servicios
SELECT * FROM servicios;

-- Alteramos/modificamos la estructura de la tabla, agregando una seccion nueva (campo)
ALTER TABLE servicios
ADD 
descripcion VARCHAR(255) DEFAULT "";

-- Mostrar como queda la estructura con el campo nuevo
DESCRIBE servicios;

-- Modificamos el nombre del campo recien creado
ALTER TABLE servicios
CHANGE 
descripcion observaciones VARCHAR(255) DEFAULT "No hay observaciones.";

-- Mostrar como quedo la tabla tras la modificacion del campo "descripcion"
DESCRIBE servicios;

-- Mostrar todos los registros y campos
SELECT * FROM servicios;

-- Probar creando un nuevo "servicio" y utilizar el nuevo campo
INSERT INTO servicios(nombre, precio, observaciones)
VALUES 
("Manicure y Pedicure", 700.000, "Esta es una observacion apropiada para este servicio!");