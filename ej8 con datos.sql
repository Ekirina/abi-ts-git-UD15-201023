drop database if exists aeropuerto;
create database aeropuerto;

use aeropuerto;

create table cliente(
	dni varchar(9),
    nombre varchar(25) not null,
    apellidos varchar(40),
    direccion varchar(100),
    telefono varchar(10),
    tarjeta_credito varchar(10),
    primary key (dni)
);


create table tarjeta_embarque(
	id int auto_increment,
    num_asiento varchar(2),
    dni_cliente varchar(9),
	primary key (id),
    foreign key (dni_cliente) references cliente(dni)
    on delete cascade on update cascade
);

create table asiento(
	fila int,
    columna int,
    planta int,
    numero int,
    primary key (fila, columna, planta)
);

create table tarjeta_embarque_asiento(
	id_tarjeta int,
    fila int,
    columna int,
    planta int,
    fecha date,
    primary key (id_tarjeta, fila, columna, planta, fecha),
    foreign key (id_tarjeta) references tarjeta_embarque(id)
    on delete cascade on update cascade,
    foreign key (fila, columna, planta) references asiento(fila, columna, planta)
    on delete cascade on update cascade
);

create table aeropuerto(
	codigo int auto_increment,
    nombre varchar(50),
    pais varchar(20),
    localidad varchar(30),
    primary key (codigo)
);

create table avion(
	codigo int auto_increment,
    num_plazas int not null,
    primary key(codigo)
);

create table vuelo(
	codigo int auto_increment,
    fecha_salida date,
    fecha_llegada date,
    hora_salida varchar(7),
    hora_llegada varchar(7),
    codigo_avion int,
    primary key(codigo),
    foreign key(codigo_avion) references avion(codigo)
    on delete no action on update cascade
);

create table vuelo_aeropuerto(
	codigo_vuelo int,
    codigo_aeropuerto_salida int,
    codigo_aeropuerto_llegada int,
    primary key (codigo_vuelo, codigo_aeropuerto_salida, codigo_aeropuerto_llegada),
    foreign key (codigo_vuelo) references vuelo(codigo)
    on delete cascade on update cascade,
    foreign key (codigo_aeropuerto_salida) references aeropuerto(codigo)
    on delete cascade on update cascade,
    foreign key (codigo_aeropuerto_llegada) references aeropuerto(codigo)
    on delete cascade on update cascade
);


create table cliente_vuelo(
	dni_cliente varchar(9),
    codigo_vuelo int,
    primary key (dni_cliente, codigo_vuelo),
    foreign key (dni_cliente) references cliente(dni)
    on delete cascade on update cascade,
    foreign key (codigo_vuelo) references vuelo(codigo)
    on delete cascade on update cascade
);

insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('38422014F', 'Massimo', 'Hudghton', '634 Dunning Street', 544638934, 727789256);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('67510289T', 'Julina', 'Mcwhinney', '0 High Crossing Parkway', 582541969, 782940845);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('35360174S', 'Donnell', 'Lovitt', '57 Oxford Center', 451947913, 657273998);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('75026480G', 'Dulcea', 'Pell', '50 Buena Vista Park', 607402733, 844485097);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('62529741K', 'Kaylyn', 'Baulk', '029 Holmberg Way', 661066208, 297290934);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('51632405L', 'Crosby', 'Powland', '80 Sutteridge Parkway', 580112654, 499481165);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('33777236R', 'Aleen', 'Dargavel', '98165 Summerview Lane', 102783800, 207713801);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('23826021T', 'Nicola', 'Gurwood', '3 Bartelt Way', 991818940, 352799537);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('89314455F', 'Pamelina', 'Deveral', '72511 Anthes Junction', 865101824, 154563459);
insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjeta_credito) values ('93566206G', 'Coleen', 'Twamley', '18 Merry Place', 368029784, 182133081);

insert into tarjeta_embarque(num_asiento, dni_cliente) values('12','38422014F');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('15','67510289T');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('18','35360174S');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('22','75026480G');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('19','62529741K');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('32','51632405L');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('45','33777236R');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('27','23826021T');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('36','89314455F');
insert into tarjeta_embarque(num_asiento, dni_cliente) values('11','93566206G');

insert into asiento values(1,2,1,12);
insert into asiento values(1,5,1,15);
insert into asiento values(1,8,1,18);
insert into asiento values(2,2,1,22);
insert into asiento values(1,9,1,19);
insert into asiento values(3,2,1,32);
insert into asiento values(4,5,1,45);
insert into asiento values(2,7,1,27);
insert into asiento values(3,6,1,36);
insert into asiento values(1,1,1,11);

insert into tarjeta_embarque_asiento values(1,1,2,1,20231014);
insert into tarjeta_embarque_asiento values(1,1,5,1,20230612);
insert into tarjeta_embarque_asiento values(1,1,8,1,20230825);
insert into tarjeta_embarque_asiento values(1,2,2,1,20230424);
insert into tarjeta_embarque_asiento values(1,1,9,1,20230115);
insert into tarjeta_embarque_asiento values(1,3,2,1,20230301);
insert into tarjeta_embarque_asiento values(1,4,5,1,20230906);
insert into tarjeta_embarque_asiento values(1,2,7,1,20230709);
insert into tarjeta_embarque_asiento values(1,3,6,1,20230611);
insert into tarjeta_embarque_asiento values(1,1,1,1,20230404);

insert into aeropuerto (nombre, pais, localidad) values ('Sauce Viejo Airport', 'Brazil', 'Conceição do Coité');
insert into aeropuerto (nombre, pais, localidad) values ('Maxson Airfield', 'Luxembourg', 'Bridel');
insert into aeropuerto (nombre, pais, localidad) values ('Mweka Airport', 'Indonesia', 'Sukojember');
insert into aeropuerto (nombre, pais, localidad) values ('Daporijo Airport', 'Poland', 'Promna');
insert into aeropuerto (nombre, pais, localidad) values ('Taloyoak Airport', 'Kazakhstan', 'Georgīevka');
insert into aeropuerto (nombre, pais, localidad) values ('Bahia Cupica Airport', 'Bangladesh', 'Mehendiganj');
insert into aeropuerto (nombre, pais, localidad) values ('Mataveri Airport', 'Indonesia', 'Kliteh');
insert into aeropuerto (nombre, pais, localidad) values ('Delma Airport', 'Indonesia', 'Dawung');
insert into aeropuerto (nombre, pais, localidad) values ('Funter Bay Seaplane Base', 'China', 'Luodian');
insert into aeropuerto (nombre, pais, localidad) values ('Chifeng Airport', 'Argentina', 'Patquía');

insert into avion (num_plazas) values (435);
insert into avion (num_plazas) values (539);
insert into avion (num_plazas) values (515);
insert into avion (num_plazas) values (493);
insert into avion (num_plazas) values (336);
insert into avion (num_plazas) values (537);
insert into avion (num_plazas) values (427);
insert into avion (num_plazas) values (433);
insert into avion (num_plazas) values (415);
insert into avion (num_plazas) values (418);

insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230102,20230102,'13:45','16:30',1);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230215,20230216,'15:35','01:30',3);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230323,20230324,'17:31','02:30',5);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230414,20230415,'19:21','05:30',4);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230526,20230526,'03:15','09:30',8);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230619,20230619,'06:45','15:30',9);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230723,20230723,'09:30','19:30',10);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230814,20230814,'10:45','17:30',7);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20230904,20230904,'11:25','16:30',2);
insert into vuelo(fecha_salida,fecha_llegada,hora_salida,hora_llegada,codigo_avion) values(20231009,20231009,'15:15','17:30',6);

insert into vuelo_aeropuerto values(1, 1, 2);
insert into vuelo_aeropuerto values(2, 2, 4);
insert into vuelo_aeropuerto values(3, 4, 8);
insert into vuelo_aeropuerto values(4, 10, 5);
insert into vuelo_aeropuerto values(5, 9, 7);
insert into vuelo_aeropuerto values(6, 6, 3);
insert into vuelo_aeropuerto values(7, 5, 7);
insert into vuelo_aeropuerto values(8, 3, 9);
insert into vuelo_aeropuerto values(9, 2, 4);
insert into vuelo_aeropuerto values(10, 1, 10);

insert into cliente_vuelo values ('38422014F', 1);
insert into cliente_vuelo values ('67510289T', 1);
insert into cliente_vuelo values ('35360174S', 1);
insert into cliente_vuelo values ('75026480G', 1);
insert into cliente_vuelo values ('62529741K', 1);
insert into cliente_vuelo values ('51632405L', 1);
insert into cliente_vuelo values ('33777236R', 1);
insert into cliente_vuelo values ('23826021T', 1);
insert into cliente_vuelo values ('89314455F', 1);
insert into cliente_vuelo values ('93566206G', 1);

select * from avion;
select * from aeropuerto;
select * from vuelo;
select * from asiento;
select * from tarjeta_embarque;
select * from cliente;

update avion set num_plazas = num_plazas * 1.1 where codigo = 1;

delete from cliente where dni = '38422014F';