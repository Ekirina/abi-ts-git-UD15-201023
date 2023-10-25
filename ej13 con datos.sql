drop database if exists restaurante13;
CREATE database restaurante13;
USE restaurante13;
CREATE table empleado(
	dni VARCHAR(9),
    nombre VARCHAR(40),
    apellido VARCHAR(80),
    num_ss VARCHAR(20),
    tel_fijo VARCHAR(10),
    tel_movil VARCHAR(10),
    primary key (dni)
);
CREATE table cocinero(
	dni VARCHAR(9),
    anyos_servicio int,
    foreign key (dni) REFERENCES empleado (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (dni)
);	
CREATE table pinche(
	dni VARCHAR(9),
    fecha_nacimiento date,
    dni_cocinero VARCHAR(9),
    foreign key (dni) REFERENCES empleado (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (dni_cocinero) REFERENCES cocinero (dni),
    primary key (dni)
 );   
CREATE table ingrediente(
	nombre VARCHAR(40),
    primary key (nombre)
);
CREATE table almacen(
	nombre VARCHAR(40),
    numero int,
    descripcion VARCHAR(300),
    primary key (nombre, numero)
);
CREATE table estanteria(
	letra VARCHAR(3),
    tamanyo int,
    nombre VARCHAR(40),
    numero int,
    foreign key (nombre, numero) REFERENCES almacen (nombre, numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (letra, tamanyo)
);
CREATE table plato(
	nombre VARCHAR(40),
    precio double,
    tipo VARCHAR(20),
    primary key (nombre)
);
CREATE table ingrediente_plato(
	nombre_ingrediente VARCHAR(40),
    nombre_plato VARCHAR(40),
    foreign key (nombre_ingrediente) REFERENCES ingrediente (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre_plato) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_ingrediente, nombre_plato)
);
CREATE table ingrediente_estanteria(
	nombre_ingrediente VARCHAR(40),
    letra VARCHAR(3),
    tamanyo int,
    foreign key (nombre_ingrediente) REFERENCES ingrediente (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (letra) REFERENCES estanteria (letra)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_ingrediente, letra, tamanyo)
);
CREATE table plato_cocinero(
	nombre_plato VARCHAR(40),
    dni VARCHAR(9),
    foreign key (dni) REFERENCES cocinero (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_plato) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_plato, dni)
);

insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('43037029F', 'Willie', 'Spiaggia', '25-434-5838', 126026606, 758904991);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('66285376A', 'Pieter', 'Gowman', '47-407-4696', 950897217, 178157957);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('32378996D', 'Gasper', 'Stollard', '64-939-8097', 907902850, 398585020);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('31411396A', 'Friederike', 'Cheston', '82-463-9634', 150637940, 532483780);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('23896033F', 'Billy', 'Agdahl', '34-785-0126', 172556459, 470589220);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('91160847G', 'Conrade', 'Alessandrelli', '85-264-8537', 725463601, 626199723);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('53319980H', 'Ahmad', 'Thying', '16-677-7275', 654466773, 589913103);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('70340159J', 'Ermentrude', 'Langlais', '81-590-6963', 527154036, 886275670);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('12959789L', 'Butch', 'Gulvin', '47-842-9012', 390079161, 422137729);
insert into empleado (dni, nombre, apellido, num_ss, tel_fijo, tel_movil) values ('68184189T', 'Gerhard', 'Hamberstone', '59-153-2761', 703966643, 755159579);

insert into cocinero (dni, anyos_servicio) values ('43037029F', 7);
insert into cocinero (dni, anyos_servicio) values ('66285376A', 6);
insert into cocinero (dni, anyos_servicio) values ('32378996D', 1);
insert into cocinero (dni, anyos_servicio) values ('31411396A', 10);
insert into cocinero (dni, anyos_servicio) values ('23896033F', 6);
insert into cocinero (dni, anyos_servicio) values ('91160847G', 7);
insert into cocinero (dni, anyos_servicio) values ('53319980H', 3);
insert into cocinero (dni, anyos_servicio) values ('70340159J', 7);
insert into cocinero (dni, anyos_servicio) values ('12959789L', 7);
insert into cocinero (dni, anyos_servicio) values ('68184189T', 10);

insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('68184189T', '19840503', '43037029F');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('12959789L', '19941109', '66285376A');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('70340159J', '20000707', '32378996D');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('53319980H', '19820925', '31411396A');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('91160847G', '19930321', '23896033F');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('23896033F', '20031229', '91160847G');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('31411396A', '19981111', '53319980H');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('32378996D', '19950513', '70340159J');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('66285376A', '20011123', '12959789L');
insert into pinche (dni, fecha_nacimiento, dni_cocinero) values ('43037029F', '19810927', '68184189T');

insert into ingrediente values ('Manzana'), ('Macarrones'), ('Tomate'), ('Piña'), ('Salchicha'), ('Harina'), ('Pan'), 
('Pera'), ('Atún'), ('Vino blanco');

insert into almacen values ('Almacen 1', 1, 'Un almacen para guardar frutas'), ('Almacen 2', 2, 'Un almacen para guardar verduras'),
('Almacen 3', 3, 'Un almacen para guardar Carne'),('Almacen 4', 4, 'Un almacen para guardar Harina'),('Almacen 5', 5, 'Un almacen para guardar pasta'),
('Almacen 6', 6, 'Un almacen para guardar Alcohol'),('Almacen 7', 7, 'Un almacen para guardar Pescado'),('Almacen 8', 8, 'Un almacen para guardar Utensilios'),
('Almacen 9', 9, 'Un almacen para guardar marisco'),('Almacen 10', 10, 'Un almacen para guardar especias');

insert into estanteria values('AAA', 10 ,'Almacen 1', 1),('ABB', 15 ,'Almacen 2', 2),('ABC', 10 ,'Almacen 3', 3),('BBB', 12 ,'Almacen 4', 4),
('BAA', 15 ,'Almacen 5', 5),('BAC', 10 ,'Almacen 6', 6),('CAA', 15 ,'Almacen 7', 7),('CAB', 20 ,'Almacen 8', 8),('CAC', 15 ,'Almacen 9', 9),
('CCC', 20 ,'Almacen 10', 10);

insert into plato values ('Pastel de manzana',15,'Postre'),('Macarrones a la boloñesa', 10,'Primero'),('Filete empanado',8,'Segundo'),
('Piña fresca',5,'Postre'),('Bocata de Salchicha',8,'Segundo'),('Tarta de pera',15,'Postre'),('Macarrones a la carbonara',15,'Primero'),
('Pollo al as',10,'Segundo'),('Carne marinada',10,'Segundo'),('Atún del norte enriquecido a la plancha',17,'Segundo');

insert into ingrediente_plato values('Manzana','Pastel de manzana'),('Macarrones','Macarrones a la boloñesa'),
('Tomate','Macarrones a la boloñesa'),('Piña','Piña fresca'),('Pera','Tarta de pera'),('Harina','Pastel de manzana'),
('Harina','Tarta de pera'),('Atún','Atún del norte enriquecido a la plancha'),('Vino blanco','Carne marinada'),
('Macarrones','Macarrones a la carbonara');

insert into ingrediente_estanteria values ('Harina', 'BBB', 12),('Manzana', 'AAA', 10),('Piña', 'AAA', 10),('Pera', 'AAA', 10),
('Tomate', 'ABB', 15),('Atún', 'CAA', 15),('Salchicha', 'ABC', 10),('Pan', 'BBB', 12),('Vino blanco', 'BAC', 10),('Macarrones', 'BAA', 15);

insert into plato_cocinero values('Pastel de manzana','43037029F'),('Macarrones a la boloñesa','66285376A'),('Filete empanado','32378996D'),
('Piña fresca','32378996D'),('Bocata de Salchicha','23896033F'),('Tarta de pera','53319980H'),('Macarrones a la carbonara','66285376A'),
('Pollo al as','68184189T'),('Carne marinada','12959789L'),('Atún del norte enriquecido a la plancha','68184189T');

select * from plato;
select * from almacen;
select * from estanteria;
select * from pinche;
select * from cocinero;
select * from empleado;
select * from ingrediente_plato;
select * from ingrediente_estanteria;
select * from plato_cocinero;
select * from ingrediente;

update ingrediente set nombre='Sandia' where nombre = 'Manzana';

delete from ingrediente where nombre = 'Sandia';