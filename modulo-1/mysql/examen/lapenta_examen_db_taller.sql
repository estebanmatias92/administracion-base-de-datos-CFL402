-- 1)
-- Eliminar database si existe
DROP DATABASE IF EXISTS taller;
-- Crear database si NO existe
CREATE DATABASE IF NOT EXISTS taller;
-- Usar la database si NO existe
USE taller;


-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS marcas(
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(66) NOT NULL UNIQUE
);

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS tipos(
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(60) NOT NULL UNIQUE
);

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS automotores(
    id_automotor INT PRIMARY KEY AUTO_INCREMENT,
    patente VARCHAR(60) NOT NULL UNIQUE,
    id_marca INT NOT NULL,
    id_tipo INT NOT NULL,
    CONSTRAINT fk_automotores_marcas FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    CONSTRAINT fk_automotores_tipos FOREIGN KEY (id_tipo) REFERENCES tipos(id_tipo)
);

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS mecanicos(
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    dni INT NOT NULL,
    CONSTRAINT UQ_mecanicos UNIQUE (apellido, dni)
);

-- Crear tabla si NO existe
CREATE TABLE IF NOT EXISTS reparaciones(
    id_reparacion INT PRIMARY KEY AUTO_INCREMENT,
    id_automotor INT NOT NULL,
    id_mecanico INT NOT NULL,
    fecha_entrada DATE NOT NULL DEFAULT "1997-08-29",
    fecha_salida DATE NOT NULL DEFAULT "1999-08-29",
    descripcion VARCHAR(255) NOT NULL,
    importe DECIMAL(10,2) NOT NULL DEFAULT 0.00
);


-- 2)
-- Insertar registros en tabla
INSERT INTO marcas(marca) 
VALUES
("Renault"),
("Peugeot"),
("Ford"),
("Chevrolet"),
("Toyota"),
("Nissan");

-- Insertar registros en tabla
INSERT INTO tipos(tipo) 
VALUES
("Camion"),
("Utilitario"),
("Pick Up"),
("Van"),
("Suv"),
("Sedan"),
("Coupe");

-- Insertar registros en tabla
INSERT INTO automotores(patente, id_marca, id_tipo) 
VALUES
("ARG189", 3, 2),
("CHI064", 5, 3),
("ITL256", 5, 3),
("BOL128", 1, 2),
("CHL512", 6, 5),
("AUS812", 2, 5),
("ECU876", 1, 2),
("COL987", 5, 3),
("URU542", 2, 2),
("BRA387", 1, 4);

-- Insertar registros en tabla
INSERT INTO mecanicos(nombre, apellido, dni) 
VALUES
("Hernan", "Gonzales", 30150256),
("Gustavo", "Ramirez", 27512001),
("Carla", "Santaolalla", 35111687),
("Lujan", "Barbas", 42543846),
("Carlos", "Esteban", 17954612);

-- Insertar registros en tabla
INSERT INTO reparaciones(id_automotor, id_mecanico, fecha_entrada, fecha_salida, descripcion, importe) 
VALUES
(7, 3, "2023-09-10", "2023-09-20", "Prueba de compresion y cambio de aros de pistones", 65400.0),
(3, 5, "2023-09-11", "2023-09-15", "Cambio de correa de alternador", 90.7),
(1, 2, "2023-09-11", "2023-09-30", "Rectificacion tapa de cilindros y block", 120500.5),
(9, 3, "2023-09-12", "2023-09-20", "Cambio de refrigerante, aceite y filtros", 11560.0),
(4, 4, "2023-09-12", "2023-09-22", "Cambio de junta de tapa y bujes de cigueñal", 70250.0),
(2, 4, "2023-09-12", "2023-09-19", "Cambio filtro de aceite y recambio de liquido de frenos", 20050.99),
(5, 5, "2023-09-14", "2023-09-26", "Cambio de bujias", 10400.2),
(8, 1, "2023-09-15", "2023-09-21", "Cambio de alternador y correa", 30600.4),
(6, 1, "2023-09-15", "2023-09-18", "Cambio filtro de aceite", 60.2),
(10, 2, "2023-09-16", "2023-09-29", "Cambio regulador de presion de combustible y bomba de combustible", 40500.0);


-- 3)
-- Mostrar datos:
-- Reparaciones mayores a $50000
SELECT automotores.patente, reparaciones.descripcion, reparaciones.importe 
FROM reparaciones
JOIN automotores USING (id_automotor)
HAVING importe > 50000;

-- 4)
-- Mostrar datos:
-- Listar automotores de forma ascendente (por marca)
SELECT automotores.patente, marcas.marca, tipos.tipo
FROM automotores
JOIN marcas USING (id_marca)
JOIN tipos USING (id_tipo)
ORDER BY marcas.marca;

-- 5)
-- Borrar Datos:
-- Borrar reparaciones menores a $100
DELETE FROM reparaciones WHERE importe < 100;

-- 6)
-- Mostar Datos:
-- De cada mecanico, mostrar apellido, nombre, cantidad de reparaciones e importe total de reparaciones
SELECT mecanicos.apellido AS "Apellido (mecanico)", mecanicos.nombre AS "Nombre (mecanico)", COUNT(reparaciones.id_reparacion) AS "Cantidad Reparaciones", SUM(reparaciones.importe) AS "Importe Total"
FROM mecanicos
JOIN reparaciones USING(id_mecanico)
GROUP BY mecanicos.id_mecanico;