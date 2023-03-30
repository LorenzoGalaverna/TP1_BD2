-- Active: 1652961517460@@127.0.0.1@3306

DROP DATABASE IF EXISTS FASHIONISTA;
CREATE DATABASE FASHIONISTA;

USE FASHIONISTA;
-- Tabla de Productos
CREATE TABLE Productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    marca VARCHAR(255),
    talla VARCHAR(255),
    color VARCHAR(255),
    precio_compra DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    ubicacion_almacen VARCHAR(255),
    PRIMARY KEY (id)
);



-- Tabla de Tipo de documento
CREATE TABLE Tipo_documento (
    id int not null AUTO_INCREMENT,
    nombre VARCHAR(255),
    PRIMARY KEY (id)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    telefono varchar(255),
    tipo_de_documento_id int not null,
    identificacion VARCHAR(255) not null,
    PRIMARY KEY (id),
    Foreign Key (tipo_de_documento_id) REFERENCES Tipo_documento(id)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    identificacion VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    fecha_inicio_contrato DATE NOT NULL,
    PRIMARY KEY (id)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    fecha DATE,
    PRIMARY KEY (id),
    Foreign Key (cliente_id) REFERENCES Clientes(id),
    Foreign Key (empleado_id) REFERENCES Empleados(id)
);

-- Tabla de Productos vendidos
CREATE TABLE Venta_producto (
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES Ventas(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- INSERTS PRODUCTO

INSERT INTO Productos (nombre, descripcion, marca, talla, color, precio_compra, precio_venta, cantidad, ubicacion_almacen) VALUES ('Pantalones', 'Pantalones de mezclilla', 'Levi Strauss & Co', '32', 'Azul', 50.00, 80.00, 100, 'Almacen 1');
INSERT INTO Productos (nombre, descripcion, marca, talla, color, precio_compra, precio_venta, cantidad, ubicacion_almacen) VALUES ('Playera', 'Playera de algodón', 'Nike', 'M', 'Rojo', 20.00, 35.00, 200, 'Almacen 2');
INSERT INTO Productos (nombre, descripcion, marca, talla, color, precio_compra, precio_venta, cantidad, ubicacion_almacen) VALUES ('Zapatos', 'Zapatos de cuero', 'Clarks', '9', 'Café', 80.00, 120.00, 50, 'Almacen 3');
INSERT INTO Productos (nombre, descripcion, marca, talla, color, precio_compra, precio_venta, cantidad, ubicacion_almacen) VALUES ('Suéter', 'Suéter de lana', 'H&M', 'L', 'Gris', 40.00, 65.00, 75, 'Almacen 4');
INSERT INTO Productos (nombre, descripcion, marca, talla, color, precio_compra, precio_venta, cantidad, ubicacion_almacen) VALUES ('Calcetines', 'Calcetines de algodón', 'Adidas', 'M', 'Blanco', 5.00, 10.00, 500, 'Almacen 5');
-- TIPO DE DOCUMENTO
INSERT INTO Tipo_documento (nombre) VALUES ('Cédula de ciudadanía');

INSERT INTO Tipo_documento (nombre) VALUES ('Tarjeta de identidad');

INSERT INTO Tipo_documento (nombre) VALUES ('Pasaporte');

INSERT INTO Tipo_documento (nombre) VALUES ('Cédula de extranjería');

INSERT INTO Tipo_documento (nombre) VALUES ('Registro Civil');




-- Clientes
INSERT INTO Clientes (nombre, apellido, telefono, tipo_de_documento_id, identificacion) VALUES ('Juan', 'González', '3111111111', 1, '123456789');

INSERT INTO Clientes (nombre, apellido, telefono, tipo_de_documento_id, identificacion) VALUES ('María', 'Rodríguez', '3222222222', 2, '987654321');

INSERT INTO Clientes (nombre, apellido, telefono, tipo_de_documento_id, identificacion) VALUES ('Pedro', 'Ramírez', '3333333333', 3, 'A12345678');

INSERT INTO Clientes (nombre, apellido, telefono, tipo_de_documento_id, identificacion) VALUES ('Ana', 'Martínez', '3344444444', 4, 'B9876543');

INSERT INTO Clientes (nombre, apellido, telefono, tipo_de_documento_id, identificacion) VALUES ('Luis', 'Pérez', '3355555555', 5, 'C123456789');

-- Empleados

INSERT INTO Empleados (nombre, apellido, identificacion, cargo, salario, fecha_inicio_contrato) VALUES ('Ana', 'García', '123456789', 'Gerente de Ventas', 3000.00, '2020-01-01');

INSERT INTO Empleados (nombre, apellido, identificacion, cargo, salario, fecha_inicio_contrato) VALUES ('Carlos', 'López', '987654321', 'Asistente de Ventas', 1500.00, '2020-02-01');

INSERT INTO Empleados (nombre, apellido, identificacion, cargo, salario, fecha_inicio_contrato) VALUES ('María', 'Gómez', 'A12345678', 'Analista de datos', 2500.00, '2020-03-01');

INSERT INTO Empleados (nombre, apellido, identificacion, cargo, salario, fecha_inicio_contrato) VALUES ('Juan', 'Hernández', 'B9876543', 'Asistente administrativo', 1800.00, '2020-04-01');

INSERT INTO Empleados (nombre, apellido, identificacion, cargo, salario, fecha_inicio_contrato) VALUES ('Pedro', 'Fernández', 'C123456789', 'Contador', 3500.00, '2020-05-01');

-- Tipo_documento

INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (1, 3, '2023-03-25');
INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (2, 4, '2023-03-24');
INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (3, 1, '2023-03-23');
INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (4, 2, '2023-03-22');
INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (5, 3, '2023-03-21');
INSERT INTO Ventas (cliente_id, empleado_id, fecha) VALUES (5, 3, '2023-02-21');
-- VENTA_PRODUCTO

INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (1, 2, 2, 70.00);
INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (2, 5, 5, 50.00);
INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (3, 3, 1, 120.00);
INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (4, 1, 3, 100.00);
INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (5, 4, 2, 60.00);
INSERT INTO Venta_producto (venta_id, producto_id, cantidad, precio) VALUES (6, 4, 5, 60.00);

--- QUERY
#1
SELECT Productos.nombre, SUM(Venta_producto.cantidad) AS cantidad_vendida, SUM(Venta_producto.precio) AS ingresos_generados
FROM Ventas
INNER JOIN Venta_producto ON Ventas.id = Venta_producto.venta_id
INNER JOIN Productos ON Venta_producto.producto_id = Productos.id
WHERE MONTH(Ventas.fecha) = (MONTH(CURRENT_DATE)) -1
GROUP BY Productos.nombre
ORDER BY cantidad_vendida DESC
LIMIT 10;
#2
SELECT fecha, precio
FROM Ventas v
JOIN Venta_producto vp ON v.id = vp.venta_id
JOIN Productos p ON vp.producto_id = p.id
WHERE p.nombre = 'suéter'
ORDER BY fecha ASC;

#3
SELECT Productos.nombre, Productos.descripcion, Productos.ubicacion_almacen, Productos.cantidad, Venta_producto.precio AS precio_unitario, Ventas.fecha AS fecha_ultima_venta
FROM Productos
LEFT JOIN Venta_producto ON Productos.id = Venta_producto.producto_id
LEFT JOIN Ventas ON Venta_producto.venta_id = Ventas.id
WHERE Productos.nombre = 'suéter'
ORDER BY fecha_ultima_venta DESC
LIMIT 1;
#4
SELECT COUNT(DISTINCT Ventas.id) AS cantidad_Ventas, 
        SUM(Venta_producto.cantidad * Venta_producto.precio) AS monto_recaudado,
        SUM(Venta_producto.cantidad) AS cantidad_producto_mas_vendido
        FROM Ventas
        INNER JOIN Venta_producto ON Ventas.id = Venta_producto.venta_id
        INNER JOIN Productos ON Venta_producto.producto_id = Productos.id
        ;

#5
SELECT Empleados.nombre AS vendedor,
       COUNT(DISTINCT Ventas.id) AS cantidad_Ventas,
       SUM(Venta_producto.cantidad * Venta_producto.precio) AS monto_recaudado,
       SUM(Venta_producto.cantidad * Venta_producto.precio * 0.07) AS comisiones
FROM Empleados
JOIN Ventas ON Empleados.id = Ventas.empleado_id
JOIN Venta_producto ON Ventas.id = Venta_producto.venta_id
WHERE Ventas.fecha >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY Empleados.nombre
ORDER BY cantidad_Ventas DESC;
#6
SELECT Clientes.nombre, SUM(Venta_producto.cantidad * Venta_producto.precio) AS monto_compra,
    CASE 
        WHEN SUM(Venta_producto.cantidad) > 5 THEN SUM(Venta_producto.cantidad * Venta_producto.precio) * 0.2
        WHEN SUM(Venta_producto.cantidad) > 3 THEN SUM(Venta_producto.cantidad * Venta_producto.precio) * 0.1
        ELSE 0
    END AS descuento,
    SUM(Venta_producto.cantidad * Venta_producto.precio) -
    CASE 
        WHEN SUM(Venta_producto.cantidad) > 5 THEN SUM(Venta_producto.cantidad * Venta_producto.precio) * 0.2
        WHEN SUM(Venta_producto.cantidad) > 3 THEN SUM(Venta_producto.cantidad * Venta_producto.precio) * 0.1
        ELSE 0
    END AS monto_total_a_pagar
FROM Venta_producto
JOIN Ventas ON Venta_producto.venta_id = Ventas.id
JOIN Clientes ON Ventas.cliente_id = Clientes.id
GROUP BY Clientes.id;
#4
SELECT COUNT(DISTINCT Ventas.id) AS cantidad_Ventas, 
        SUM(Venta_producto.cantidad * Venta_producto.precio) AS monto_recaudado
        FROM Ventas
        INNER JOIN Venta_producto ON Ventas.id = Venta_producto.venta_id
        WHERE Ventas.fecha >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
        ;

        SELECT SUM(Venta_producto.cantidad) as maximo, 
        Productos.nombre
        from Productos
        JOIN Venta_producto on Productos.id = Venta_producto.producto_id
        JOIN Ventas on Venta_producto.venta_id = Ventas.id
        WHERE Ventas.fecha >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
        GROUP BY Productos.nombre
        ORDER BY maximo desc
        limit 1;

        SELECT SUM(Venta_producto.cantidad) as maximo, 
        Productos.nombre
        from Productos
        JOIN Venta_producto on Productos.id = Venta_producto.producto_id
        JOIN Ventas on Venta_producto.venta_id = Ventas.id
        WHERE Ventas.fecha >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
        GROUP BY Productos.nombre
        ORDER BY maximo asc
        
        limit 1;

SELECT Empleados.nombre AS vendedor,
       SUM(Venta_producto.cantidad * Venta_producto.precio) AS monto_recaudado
FROM Empleados
JOIN Ventas ON Empleados.id = Ventas.empleado_id
JOIN Venta_producto ON Ventas.id = Venta_producto.venta_id
WHERE Ventas.fecha >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY Empleados.nombre
ORDER BY monto_recaudado DESC
limit 1;
