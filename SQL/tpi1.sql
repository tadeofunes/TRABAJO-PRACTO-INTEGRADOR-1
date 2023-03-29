-- Active: 1671032102166@@127.0.0.1@3306@tpi1
CREATE TABLE ZONA(
    ID INT PRIMARY KEY,
    DESCRIPCION VARCHAR(30), 
    HORARIO INT
);

CREATE TABLE RESTAURANTE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(20),
    ID_ZONA INT,
    CONSTRAINT FOREIGN KEY (ID_ZONA) REFERENCES ZONA(ID)
    );
CREATE TABLE TIPO_DOCUMENTO(
    ID BIGINT PRIMARY KEY NOT NULL,
    DETALLE VARCHAR(30)
);

CREATE TABLE Producto(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    precio VARCHAR(15) NOT NULL,
    descripcion VARCHAR(200) NOT NULL);


CREATE TABLE Usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    ID_TIPO_DOCUMENTO BIGINT,
    CONSTRAINT FOREIGN KEY (ID_TIPO_DOCUMENTO) REFERENCES TIPO_DOCUMENTO(ID),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    contrasena VARCHAR(100) NOT NULL
);

CREATE TABLE ESTADO(
    ID INT PRIMARY KEY,
    DETALLE VARCHAR(30),
    TIEMPO VARCHAR(30)
);
CREATE TABLE VEHICULOS(
    ID INT PRIMARY KEY, 
    NOMBRE VARCHAR(20)
);

CREATE TABLE Repartidores(
    id_repartidor INT PRIMARY KEY AUTO_INCREMENT,
    ID_VEHICULO INT,
    CONSTRAINT FOREIGN KEY (ID_VEHICULO) REFERENCES VEHICULOS(ID),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(30) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion DATE NOT NULL,
    direccion_entrega VARCHAR(100) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    HORA_CREACION TIME,
    id_usuarios INT,
    FOREIGN KEY (id_usuarios) REFERENCES Usuario(id_usuario),
    ID_ESTADO INT,
    ID_PRODUCTOS INT,
    CONSTRAINT FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO (ID),
    CONSTRAINT FOREIGN KEY (ID_PRODUCTOS) REFERENCES Producto(id_producto)
    );


CREATE TABLE DETALLE_PEDIDO(
    ID INT PRIMARY KEY, 
    Precio int ,
    cantidad int,
    ID_PRODUCTO INT,
    ID_PEDIDO INT,
    CONSTRAINT FOREIGN KEY (ID_PRODUCTO) REFERENCES Producto(ID_PRODUCTO),
    CONSTRAINT FOREIGN KEY (ID_PEDIDO) REFERENCES Pedidos(id_pedido)
    
);

INSERT INTO ZONA (ID, DESCRIPCION, HORARIO) VALUES (1, 'Centro', 8);
INSERT INTO ZONA (ID, DESCRIPCION, HORARIO) VALUES (2, 'Norte', 10);
INSERT INTO ZONA (ID, DESCRIPCION, HORARIO) VALUES (3, 'Sur', 9);
INSERT INTO ZONA (ID, DESCRIPCION, HORARIO) VALUES (4, 'Este', 7);
INSERT INTO ZONA (ID, DESCRIPCION, HORARIO) VALUES (5, 'Oeste', 6);

INSERT INTO RESTAURANTE (NOMBRE, ID_ZONA) VALUES ('El Rincon del Sabor', 1);
INSERT INTO RESTAURANTE (NOMBRE, ID_ZONA) VALUES ('La Casona', 2);
INSERT INTO RESTAURANTE (NOMBRE, ID_ZONA) VALUES ('El Fogon', 3);
INSERT INTO RESTAURANTE (NOMBRE, ID_ZONA) VALUES ('Parrilla Argentina', 4);
INSERT INTO RESTAURANTE (NOMBRE, ID_ZONA) VALUES ('El Nuevo Sabor', 5);

INSERT INTO TIPO_DOCUMENTO (ID, DETALLE) VALUES (1, 'Cédula de ciudadanía');
INSERT INTO TIPO_DOCUMENTO (ID, DETALLE) VALUES (2, 'Tarjeta de identidad');
INSERT INTO TIPO_DOCUMENTO (ID, DETALLE) VALUES (3, 'Pasaporte');
INSERT INTO TIPO_DOCUMENTO (ID, DETALLE) VALUES (4, 'Cédula de extranjería');
INSERT INTO TIPO_DOCUMENTO (ID, DETALLE) VALUES (5, 'Registro civil');

INSERT INTO Producto (nombre, precio, descripcion) VALUES ('Pizza', '15.00', 'Pizza con pepperoni, queso y salsa de tomate');
INSERT INTO Producto (nombre, precio, descripcion) VALUES ('Hamburguesa', '10.00', 'Hamburguesa con carne, lechuga, tomate y queso');
INSERT INTO Producto (nombre, precio, descripcion) VALUES ('Ensalada César', '8.00', 'Ensalada de lechuga, pollo, parmesano y aderezo César');
INSERT INTO Producto (nombre, precio, descripcion) VALUES ('Sushi', '20.00', 'Rollos de sushi con salmón, aguacate y pepino');
INSERT INTO Producto (nombre, precio, descripcion) VALUES ('Tacos', '12.00', 'Tacos de carne asada con cilantro y cebolla');

iNSERT INTO Usuario (ID_TIPO_DOCUMENTO, nombre, apellido, direccion, correo_electronico, telefono, contrasena) VALUES (1, 'Juan', 'Perez', 'Calle 123', 'juanperez@gmail.com', '555-1234', 'password123');
INSERT INTO Usuario (ID_TIPO_DOCUMENTO, nombre, apellido, direccion, correo_electronico, telefono, contrasena) VALUES (2, 'Ana', 'García', 'Av. Principal 456', 'anagarcia@hotmail.com', '555-5678', 'password456');

INSERT INTO ESTADO (ID, DETALLE, TIEMPO) VALUES (1, 'En proceso', '20 min');
INSERT INTO ESTADO (ID, DETALLE, TIEMPO) VALUES (2, 'En camino', '30 min');
INSERT INTO ESTADO (ID, DETALLE, TIEMPO) VALUES (3, 'Entregado', '40 min');
INSERT INTO ESTADO (ID, DETALLE, TIEMPO) VALUES (4, 'Cancelado', '10 min');
INSERT INTO ESTADO (ID, DETALLE, TIEMPO) VALUES (5, 'En espera', '50 min');

INSERT INTO VEHICULOS (ID, NOMBRE) VALUES (1, 'Moto');
INSERT INTO VEHICULOS (ID, NOMBRE) VALUES (2, 'Bicicleta');
INSERT INTO VEHICULOS (ID, NOMBRE) VALUES (3, 'Carro');
INSERT INTO VEHICULOS (ID, NOMBRE) VALUES (4, 'Scooter');
INSERT INTO VEHICULOS (ID, NOMBRE) VALUES (5, 'Camión');

INSERT INTO Repartidores (ID_REPARTIDOR, ID_VEHICULO, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (1, 1, 'Pedro', 'García', '1234567890', 'Calle 1, #123');
INSERT INTO Repartidores (ID_REPARTIDOR, ID_VEHICULO, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (2, 2, 'Juan', 'Pérez', '2345678901', 'Calle 2, #456');
INSERT INTO Repartidores (ID_REPARTIDOR, ID_VEHICULO, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (3, 3, 'María', 'González', '3456789012', 'Calle 3, #789');
INSERT INTO Repartidores (ID_REPARTIDOR, ID_VEHICULO, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (4, 4, 'Sofía', 'Rodríguez', '4567890123', 'Calle 4, #101112');
INSERT INTO Repartidores (ID_REPARTIDOR, ID_VEHICULO, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (5, 5, 'Carlos', 'López', '5678901234', 'Calle 5, #131415');

INSERT INTO Pedidos(fecha_creacion, direccion_entrega, metodo_pago, id_usuarios, ID_ESTADO, ID_PRODUCTOS)
VALUES ('2023-03-28', 'Calle Falsa 123', 'Tarjeta de crédito', 1, 1, 1);

INSERT INTO Pedidos(fecha_creacion, direccion_entrega, metodo_pago, id_usuarios, ID_ESTADO, ID_PRODUCTOS)
VALUES ('2023-03-28', 'Avenida Principal 456', 'Efectivo', 2, 2, 2);

INSERT INTO DETALLE_PEDIDO(ID,Precio, Cantidad, ID_PEDIDO, ID_PRODUCTO)
VALUES (1,150,3, 1, 1);

INSERT INTO DETALLE_PEDIDO(ID,Precio, Cantidad ,ID_PEDIDO, ID_PRODUCTO)
VALUES (2,180,6, 1, 2);

INSERT INTO Usuario (ID_TIPO_DOCUMENTO, nombre, apellido, direccion, correo_electronico, telefono, contrasena) VALUES (1, 'Juan', 'Pérez', 'Calle 12 #34-56', 'juanperez@gmail.com', '3214567890', 'contraseña');
INSERT INTO Usuario (ID_TIPO_DOCUMENTO, nombre, apellido, direccion, correo_electronico, telefono, contrasena) VALUES (2, 'María', 'González', 'Carrera 9 #8-7', 'mariagonzalez@gmail.com', '3157894561', '123');

INSERT INTO Pedidos (fecha_creacion, direccion_entrega, metodo_pago, HORA_CREACION, id_usuarios, ID_ESTADO)
VALUES ('2023-03-29', 'Av. Siempre Viva 742', 'Efectivo', '17:10:00', 2, 2);

INSERT INTO Pedidos (fecha_creacion, direccion_entrega, metodo_pago, HORA_CREACION, id_usuarios, ID_ESTADO)
VALUES ('2023-03-29', 'Calle del Pez 42', 'Tarjeta de débito', '18:15:00', 3, 1);

INSERT INTO DETALLE_PEDIDO (ID, Precio, cantidad, ID_PRODUCTO, ID_PEDIDO)
VALUES (3, 15, 2, 1, 1);

INSERT INTO DETALLE_PEDIDO (ID, Precio, cantidad, ID_PRODUCTO, ID_PEDIDO)
VALUES (4, 10, 1, 2, 1);

SELECT z.DESCRIPCION AS 'Zona', COUNT(*) AS 'Cantidad de pedidos', 
       MAX(p.precio) AS 'Venta máxima', MIN(p.precio) AS 'Venta mínima'
FROM ZONA z
JOIN RESTAURANTE r ON r.ID_ZONA = z.ID
JOIN DETALLE_PEDIDO pp ON pp.ID_PEDIDO = r.ID
JOIN Producto p ON p.id_producto = pp.ID_PRODUCTO
GROUP BY z.ID
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT 
    CASE 
        WHEN HOUR(HORA_CREACION) >= 0 AND HOUR(HORA_CREACION) < 6 THEN 'Noche'
        WHEN HOUR(HORA_CREACION) >= 6 AND HOUR(HORA_CREACION) < 12 THEN 'Mañana'
        WHEN HOUR(HORA_CREACION) >= 12 AND HOUR(HORA_CREACION) < 18 THEN 'Tarde'
        ELSE 'Noche'
    END AS Periodo_del_dia,
    ROUND(AVG(HOUR(HORA_CREACION)), 0) AS Hora_con_mas_pedidos_promedio
FROM Pedidos
WHERE fecha_creacion >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY Periodo_del_dia
ORDER BY COUNT(*) DESC
LIMIT 1;


SELECT
p.id_producto,
p.nombre,
SUM(dp.cantidad) AS cantidad_pedida,
p.precio AS precio_actual
FROM Pedidos pe
JOIN DETALLE_PEDIDO dp ON pe.id_pedido = dp.ID_PEDIDO
JOIN Producto p ON dp.ID_PRODUCTO = p.id_producto
WHERE YEARWEEK(pe.fecha_creacion) = YEARWEEK(CURRENT_DATE())
GROUP BY p.id_producto
ORDER BY cantidad_pedida DESC;

