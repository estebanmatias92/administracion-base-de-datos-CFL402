
SHOW DATABASES;

CREATE DATABASE TOMAS;

USE tomas;

SHOW TABLES;

CREATE TABLE items (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    ataque INT NOT NULL,
    defensa INT NOT NULL
);

SHOW TABLES;

SELECT * FROM items;

INSERT INTO items(nombre, valor, ataque, defensa) 
VALUES 
("Espada Dragon", 2500, 10000, 0),
("Escudo Diamante", 9000,0, 4000);