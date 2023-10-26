drop database if exists ej11;

create database ej11;
use ej11;

create table Pais(
nombre varchar(40) primary key,
extension double,
poblacion int
);

create table Localidad(
id int auto_increment primary key,
nombre varchar(40),
nombre_pais varchar(40),
foreign key (nombre_pais) references Pais(nombre)
on delete cascade on update cascade
);

create table Accidente_Geografico(
nombre varchar(40) primary key,
pos_horizontal double,
pos_vertical double
);

create table Pais_Accidente(
nombre_pais varchar(40),
nombre_accidente varchar(40),
primary key(nombre_pais, nombre_accidente),
foreign key(nombre_pais) references Pais(nombre)
on delete cascade on update cascade,
foreign key(nombre_accidente) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Montana(
nombre varchar(40) primary key,
altura double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Lago(
nombre varchar(40) primary key,
extension double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Rio(
nombre varchar(40) primary key,
longitud double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade

);

create table Localidad_rio(
id_localidad int,
nombre_rio varchar(40),
primary key (id_localidad, nombre_rio),
foreign key (id_localidad) references Localidad(id)
on delete cascade on update cascade,
foreign key (nombre_rio) references Rio(nombre)
on delete cascade on update cascade
);

insert into Pais values ("España", 52345, 54),
						("China", 345345, 9000),
						("Francia", 70345, 65),
						("Ecuador", 4567, 48),
						("Egipto", 45637, 70),
						("Reino Unido", 45637, 62);
                        
insert into Localidad(nombre, nombre_pais) values("Sevilla", "España"),
												 ("Cairo","Egipto"),
												 ("Londres","Reino Unido"),
												 ("Barcelona","España"),
												 ("Paris","Francia"),
												 ("Quito","Ecuador");
                                                 
insert into Accidente_Geografico values ("Everest", 23.0, 54.0),
										("Guadalquivir", 12.0, 12.0),
										("Nilo", 17.0, 9.0),
										("Amazonas", 34.0, 24.0),
										("Mont Blanc", 13.0, 7.0),
										("Certascany", 12.0, 10.0),
										("Tamesis", 23.0, 54.0),
										("Lop Nur", 23.0, 54.0),
										("Pica D'estats", 23.0, 54.0),
										("Teide", 23.0, 54.0),
										("Sena", 23.0, 54.0);
                                        
insert into Montana values  ("Everest", 8120.0),
							("Teide", 3715.0),
							("Mont Blanc", 4800.0),
							("Pica D'estats", 3100.0);
                            
insert into Lago values ("Certascany", 2000.0),
						("Lop Nur", 5000.0);
                        
insert into Rio values  ("Guadalquivir", 657.0),
						("Nilo", 6650.0),
						("Amazonas", 6400.0),
						("Tamesis", 346.0),
						("Sena", 777.0);

insert into Localidad_rio values (1, "Guadalquivir"),
								 (2, "Nilo"),
                                 (3, "Tamesis"),
                                 (5, "Sena"),
                                 (6, "Amazonas");

select *
from Localidad;


/*Mostrar las localidades por las que pasa algún rio y mostrar los datos del rio*/
select l.*, r.*
from Localidad as l join Localidad_rio as lr on l.id = id_localidad join Rio as r on lr.nombre_rio = r.nombre;

/*Añadir 400 kilometros a la longitud del rio amazonas*/
update Rio
set longitud = longitud + 400
where nombre = "Amazonas";

/*Eliminar la localidad de barcelona*/
delete from Localidad
where nombre = "Barcelona";