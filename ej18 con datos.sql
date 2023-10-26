drop database if exists ej18;
create database ej18;
use ej18;

create table Inmueble(
id int auto_increment primary key,
superficie double,
descripcion tinytext,
direccion varchar(80)
);

create table Trabajador(
id int auto_increment primary key,
dni varchar(9) unique,
nombre varchar(40),
apellidos varchar(80),
movil varchar(9), 
telefono_fijo varchar(9)
);

create table Cliente(
id int auto_increment primary key,
dni varchar(9) unique,
nombre varchar(40),
apellidos varchar(80),
movil varchar(9), 
telefono_fijo varchar(9)
);

create table Compra(
id int auto_increment primary key,
fecha date,
valor double,
id_trabajador int,
id_inmueble int,
foreign key (id_trabajador) references Trabajador(id)
on delete cascade on update cascade,
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);

create table Alquiler(
id int auto_increment primary key,
anio year,
mes enum('enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'),
valor double,
id_trabajador int,
id_inmueble int,
foreign key (id_trabajador) references Trabajador(id)
on delete cascade on update cascade,
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);

create table Alquiler_cliente(
id_cliente int,
id_alquiler int,
primary key (id_cliente, id_alquiler),
foreign key (id_cliente) references Cliente(id)
on delete cascade on update cascade,
foreign key (id_alquiler) references Alquiler(id)
on delete cascade on update cascade
);

create table Cliente_Compra(
id_cliente int,
id_compra int,
primary key (id_cliente, id_compra),
foreign key (id_cliente) references Cliente(id)
on delete cascade on update cascade,
foreign key (id_compra) references Compra(id)
on delete cascade on update cascade
);

create table Piso(
id int auto_increment,
id_inmueble int,
primary key(id, id_inmueble),
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);

create table LocalInm(
id int primary key,
uso varchar(40),
servicio boolean,
foreign key (id) references Inmueble(id)
on delete cascade on update cascade
);
create table Garaje(
id int primary key,
numero int,
planta smallint,
foreign key (id) references Inmueble(id)
on delete cascade on update cascade
);

create table Piso_Garaje(
id_garaje int,
id_piso int,
primary key(id_garaje, id_piso),
foreign key (id_garaje) references Garaje(id)
on delete cascade on update cascade,
foreign key (id_piso) references Piso(id)
on delete cascade on update cascade
);


insert into Inmueble(superficie, descripcion, direccion) values (54 , "Local"           , "Av, alguna"),
																(30 , "Piso 2 personas" , "Calle de al lado"),
																(200, "Terreno"         , "Pueblo tal"),
																(50, "Piso 3 personas"  , "Av, alguna 2"),
																(12, "Local"            , "Av, alguna"),
																(10, "Garaje"           , "Plaza principal"),
																(12, "Garaje Moto"      , "Av, la puebla n3"),
																(10, "Garaje"           , "Plaza principal"),
																(18, "Garaje Coche"     , "Av, la puebla n3"),
																(25, "Piso 1 habitaion" , "Av, alguna 2"),
																(36, "Piso"             , "Av, alguna 2"),
																(12, "Local videojuegos", "Av, alguna"),
																(12, "Local comida"     , "Av, alguna");
 
insert into Garaje values  (6, 12, -1),
						   (7, 2, -1),
                           (8, 1, -2),
						   (9, 21, -1);

insert into Piso(id_inmueble) values(2),
									(4),
									(10),
									(11);



insert into LocalInm values (1, "Venta de caramelos"   , true),
							(5, "Peluqiería"           , true),
							(12, "Venta de videojuegos", true),
							(13, "Venta comida"        , true);

insert into Trabajador (dni, nombre, apellidos, movil) values   ("91701102R", 'Nikola', 'Pozzo', 680657503),
																("91652569F", 'Mavra', 'Brilon', 606524079),
																("98741715V", 'Jany', 'Linggard', 612736283),
																("97084963T", 'Janie', 'Wistance', 606093033),
																("90657875D", 'Frank', 'Polini', 650367905),
																("91368894S", 'Darcy', 'Reddings', 611631061),
																("91566083A", 'Sinclair', 'Sheldon', 604861503),
																("93863622Y", 'Jacklyn', 'Robard', 649311959),
																("99208679B", 'Pyotr', 'Stobbe', 603753401),
																("99633211F", 'Teirtza', 'Ghelardi', 644406687);


insert into Cliente(dni, nombre, apellidos, movil) values  	("93803530N", 'Jamesy', 'Lobell', 662718355),
															("93337082H", 'Barbi', 'Mandrake', 678168624),
															("99532077F", 'Casey', 'Manthroppe', 696808764),
															("91755623F", 'Niles', 'Donn', 661303064),
															("91019403D", 'Yvor', 'Thackston', 603357090),
															("94585024S", 'Hesther', 'Beauly', 644073241),
															("93961175A", 'Fina', 'Palffy', 640840397),
															("97061513J", 'Berti', 'Senussi', 639539704),
															("98860497L", 'Liane', 'Shane', 695217133),
															("99490947G", 'Blane', 'Potter', 658919443);



insert into Compra (fecha, valor, id_trabajador, id_inmueble) values ('2023-01-02', 1200.0, 1, 1),
																	 ('2023-01-05', 1430.0, 2, 2),
																	 ('2023-01-04', 1210.0, 1, 4),
																	 ('2023-02-06', 1200.0, 3, 6),
																	 ('2023-03-02', 1000.0, 1, 8),
																	 ('2023-04-21', 100000.0, 6, 10),
																	 ('2023-06-15', 120000.0, 9, 11);
                                                                     


insert into Cliente_Compra values (1, 1),
								  (2, 2),
								  (1, 3),
								  (3, 4),
								  (6, 5),
								  (5, 6),
								  (7, 7);
                                  


insert into Alquiler(anio, mes, valor, id_trabajador, id_inmueble) values   (2023, "Enero"  , 4123.0, 1, 1),
																			(2023, "Febrero", 4352.0, 1, 1),
																			(2023, "Enero", 123.0, 2, 2),
																			(2023, "Marzo", 7654.0, 3, 6),
																			(2023, "Julio", 2783.0, 5, 2),
																			(2023, "Octubre", 2347.0, 7, 11);
                                                                            
insert into Alquiler_cliente values (1,1),
									(1,2),
									(1,3),
									(2,4),
									(6,5),
									(8,6);
  

insert into Piso_Garaje values (6, 1),
							   (7, 2),
							   (9, 3);
                               
                               
select *
from Cliente;

/*Mostrar los datos del cliente y el inmueble que ha comprado*/
select c.*, inm.*
from Cliente as c join Cliente_Compra as cc on c.id = cc.id_cliente join Compra as co on cc.id_compra = co.id join Inmueble as inm on co.id_inmueble = inm.id;

/*Actualizar el telefono del cliente 7*/
update Cliente
set movil = "694839044"
where id = 7;

/*Eliminar el inmueble 3 correspondiente al terreno*/
delete from Inmueble
where id = 3;