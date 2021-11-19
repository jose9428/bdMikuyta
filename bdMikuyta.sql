drop database if exists bdMikuyta;

create database bdMikuyta;

use bdMikuyta;

CREATE TABLE CATEGORY(
  CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
  DESCRIPTION VARCHAR(60)
);

CREATE TABLE DISTRICT(
  DISTRICT_ID INT AUTO_INCREMENT PRIMARY KEY,
  DISTRICT_NAME VARCHAR(60)
);


CREATE TABLE USER(
    USER_ID INT AUTO_INCREMENT PRIMARY KEY,
    DISTRICT_ID INT,
    USER_TYPE VARCHAR(16) NOT NULL,
    FULL_NAME VARCHAR(256) NOT NULL,
    IDENTITY_NUMBER VARCHAR(16) NULL,
    PHONE VARCHAR(32) NOT NULL,
    EMAIL VARCHAR(128) NOT NULL,
    USERNAME VARCHAR(32) NOT NULL,
    PASSWORD VARCHAR(256) NOT NULL,
    ADDRESS VARCHAR(256) NULL,
    EMPLOYEER_ID INT NULL,
    FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID)
);

CREATE TABLE PRODUCT(
  PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY,
  USER_ID INT,
  CATEGORY_ID INT,
  PRODUCT_NAME VARCHAR(50),
  AVAILABILITY BOOLEAN NOT NULL,
  PRICE DECIMAL(8,2) NOT NULL,
  STOCK INT,
  URL_IMAGEN VARCHAR(100),
  FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID),
  FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

-- METODO PAGO
CREATE TABLE SALE(
  	SALE_ID INT AUTO_INCREMENT PRIMARY KEY,
   	USER_ID INT,
    DISTRICT_ID INT,
    REFERENCE VARCHAR(150),
	  ADDRESS VARCHAR(256) NULL,
    SALE_DATE TIMESTAMP NOT NULL,
    SUBTOTAL DECIMAL(8,2),
    DELIVERY_PRICE DECIMAL(8,2),
    TOTAL DECIMAL(8,2),
    STATUS_SALE VARCHAR(20),
    FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID),
    FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)
);

CREATE TABLE DETAIL(
  	DETAIL_ID INT AUTO_INCREMENT PRIMARY KEY,
  	SALE_ID INT ,
   	PRODUCT_ID INT,
    QUANTITY INT,
    PRICE DECIMAL(8,2),
    FOREIGN KEY(SALE_ID) REFERENCES SALE(SALE_ID),
    FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
);

CREATE TABLE DELIVERY(
  	DELIVERY_ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT,
    START_TIME DATETIME NOT NULL,
    END_TIME DATETIME NOT NULL,
    TIME_DELIVERY TIME,
  	STATUS_DELIVERY INT,
  	FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)
);



INSERT INTO district (DISTRICT_ID, DISTRICT_NAME) VALUES
(1, 'Lima'),
(2, 'Ancón'),
(3, 'Ate'),
(4, 'Barranco'),
(5, 'Breña'),
(6, 'Carabayllo'),
(7, 'Chaclacayo'),
(8, 'Chorrillos'),
(9, 'Cieneguilla'),
(10, 'Comas'),
(11, 'El Agustino'),
(12, 'Independencia'),
(13, 'Jesús María'),
(14, 'La Molina'),
(15, 'La Victoria'),
(16, 'Lince'),
(17, 'Los Olivos'),
(18, 'Lurigancho'),
(19, 'Lurin'),
(20, 'Magdalena del Mar'),
(21, 'Pueblo Libre'),
(22, 'Miraflores'),
(23, 'Pachacamac'),
(24, 'Pucusana'),
(25, 'Puente Piedra'),
(26, 'Punta Hermosa'),
(27, 'Punta Negra'),
(28, 'Rímac'),
(29, 'San Bartolo'),
(30, 'San Borja'),
(31, 'San Isidro'),
(32, 'San Juan de Lurigancho'),
(33, 'San Juan de Miraflores'),
(34, 'San Luis'),
(35, 'San Martín de Porres'),
(36, 'San Miguel'),
(37, 'Santa Anita'),
(38, 'Santa María del Mar'),
(39, 'Santa Rosa'),
(40, 'Santiago de Surco'),
(41, 'Surquillo'),
(42, 'Villa El Salvador'),
(43, 'Villa María del Triunfo');


insert into category values(1 , 'Piqueos');
insert into category values(2 , 'Bebidas');
insert into category values(3 , 'Postres');


-- clientes

insert into USER(user_type,full_name,phone,email , username,password) values('CUSTOMER' , 'Manuel Sanchez' , '954785653' , 'manuel-12@gmail.com' , 'manuel12','123456');
insert into USER(user_type,full_name,phone,email , username,password) values('CUSTOMER' , 'Carmen Carbajal' , '987563254' , 'carmen.carbajal@gmail.com' , 'carmen.carbajal','123456');

-- empresas

insert into USER(district_id,user_type,full_name,phone,email , identity_number, username,password,address) 
values(12,'COMPANY' , 'Restaurantes McDonalds S.A' , '2548569' , 'mcmadonal.service@gmail.com' ,
  '102541258965', 'mcmadonal.service' , '123456' , 'Av. Guardia Civil Sur 1031');

