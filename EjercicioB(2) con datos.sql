drop database if exists piezas;

create database piezas;
use piezas;

create table pieza(
    codigo int auto_increment,
    nombre varchar(100),
    primary key (codigo)
);

create table proveedor(
    id char(4),
    nombre varchar(100),
    primary key (id)
);

create table suministra(
    codigo_pieza int,
    id_proveedor char(4),
    precio int,
    primary key (codigo_pieza, id_proveedor),
    foreign key (codigo_pieza) references pieza(codigo)
    on delete cascade on update cascade,
    foreign key (id_proveedor) references proveedor(id)
    on delete cascade on update cascade
);

insert into pieza (nombre) values ("RTX 2080"),
								  ("Intel Core i7-12700k"),
								  ("CPU Fan Hyper"),
								  ("Placa Base Gigabyte z200"),
								  ("Razer Blackwidow 2022"),
								  ("Razer Naga"),
								  ("SteelSeries Actis Pro 7");

insert into proveedor values    ("as31", "Razer"),
								("ds76", "Nvidia"),
								("bg45", "Gigabyte"),
								("sd43", "SteelSeries"),
								("aw12", "Intel");
                                
insert into suministra values (1, "ds76", 1780),
							  (2, "aw12", 980),
							  (3, "bg45", 35),
							  (4, "bg45", 98),
							  (5, "as31", 130),
							  (6, "as31", 78),
							  (7, "sd43", 167);
                              
select *
from pieza;

/*Mostrar todos los datos de productos y sus proveedores*/
select p.*, pr.*
from pieza as p join suministra as s on p.codigo = s.codigo_pieza join proveedor as pr on s.id_proveedor = pr.id;

/*Mostrar todos los datos de productos y sus proveedores donde el precio sea superior a 100*/
select p.*, pr.*
from pieza as p join suministra as s on p.codigo = s.codigo_pieza join proveedor as pr on s.id_proveedor = pr.id
where s.precio > 100;

update pieza
set nombre = "Gigabyte CPU Fan Hyper"
where codigo = 3;

delete from proveedor
where nombre = "SteelSeries";