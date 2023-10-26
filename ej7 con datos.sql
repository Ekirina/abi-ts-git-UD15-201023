DROP DATABASE IF EXISTS Ej7;
CREATE DATABASE Ej7;
USE Ej7;

CREATE TABLE Departamento(
codigo_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(20),
coordinador varchar(20)
);

CREATE TABLE Empleado(
num_trabajador int auto_increment  primary key,
nombre varchar(20),
apellidos varchar(40),
dni varchar(9) unique,
num_seguridad_social varchar(11),
direccion varchar(40),
telefono varchar(9),
codigo_dep int,
responsable int,
foreign key (responsable) references Empleado (num_trabajador)
on delete no action on update cascade,
foreign key (codigo_dep) references Departamento (codigo_departamento)
);
create table Contrato(
id int auto_increment primary key,
categoria varchar(40),
fecha_inicio date,
fecha_final date,
num_trabajador int,
foreign key (num_trabajador) references Empleado(num_trabajador)

);

create table Nomina(
id int auto_increment primary key,
fecha date,
salario double,
id_contrato int,
foreign key (id_contrato) references Contrato(id)
);


insert into Departamento (nombre) values ("Marketing"),
										 ("Ventas"),
                                         ("IT"),
                                         ("HR"),
                                         ("QA"),
                                         ("Atención al cliente"),
                                         ("Internacional");

insert into Empleado (nombre, apellidos, dni, telefono, codigo_dep, responsable)
			values("Alfredo", "rodrigez araujo"  , "98745245R", "694029934", 1, null),
				  ("Marta"  , "perez corto"      , "42745245F", "694449934", 1, 1),
				  ("Carlos" , "largo martinez"   , "98235245Z", "694652434", 2, null),
				  ("Manolo" , "caminos rodriguez", "98766345N", "600989934", 2, 3),
				  ("Martina", "cuevas llano"     , "98745987E", "694029008", 2, 3),
				  ("Clara"  , "cajon gonzalez"   , "98395645T", "691129934", 3, null),
				  ("Martin" , "rebollo martinez" , "98765565U", "694021604", 4, null);


insert into Contrato(categoria, fecha_inicio, fecha_final, num_trabajador)
				values("Junior Marketing"    , '2023-03-23', '2023-06-20', 1),
                      ("Senior Marketing"    , '2023-06-23', '2023-11-10', 1),
                      ("Junior Web Developer", '2023-01-10', '2023-05-05', 6),
                      ("Senior Web Developer", '2023-05-07', '2024-05-10', 6),
                      ("Becario/a"           , '2023-05-17', '2023-11-12', 5),
                      ("Encargado/a"         , '2023-01-24', '2024-01-20', 3),
                      ("Senior Marketing"    , '2023-06-23', '2023-11-10', 2);


insert into Nomina(fecha, salario, id_contrato) values  ('2023-04-30', 1090.0, 1),
														('2023-05-30', 1090.0, 1),
														('2023-06-20', 745.2 , 1),
														('2023-07-30', 1400.0, 2),
														('2023-08-30', 1410.0, 2),
														('2023-06-30', 1700.0, 4),
														('2023-07-30', 1700.0, 4),
														('2023-08-30', 1750.0, 4),
														('2023-09-30', 1723.0, 4);
                                                        
select * 
from Empleado;


/*Trabajadores que hayan tenido una nomina superior a 1200*/
select *
from Empleado
where num_trabajador in (select num_trabajador
						 from Contrato
						 where id in (select id_contrato
									  from Nomina
                                      where salario > 1200.0));

/*Añadir 200 al salario de las nominas del contrato 4*/
update Nomina
set salario = salario + 200
where id_contrato = 4;

select *
from Nomina;

/*Actualziar el numero de telefono del empleado 3*/
update Empleado
set telefono = "684950055"
where num_trabajador = 3;

/*Eliminar al trabajador con num_trabajador = 7*/
delete from Empleado
where num_trabajador = 7;