drop database if exists cientificos;

create database cientificos;
use cientificos;

create table cientifico(
    dni varchar(8),
    nomapels varchar(255),
    primary key (dni)
);

create table proyecto(
    id char(4),
    nombre varchar(255),
    horas int,
    primary key (id)
);

create table asignado_a(
    dni_cientifico varchar(8),
    id_proyecto char(4),
    primary key (dni_cientifico, id_proyecto),
    foreign key (dni_cientifico) references cientifico(dni)
    on delete cascade on update cascade,
    foreign key (id_proyecto) references proyecto(id)
    on delete cascade on update cascade
);

insert into cientifico (dni, nomapels) values ("99149698", 'Kissee'),
											  ("94058792", 'Warden'),
											  ("95880396", 'Worthington'),
											  ("91486196", 'Rory'),
											  ("93827341", 'Barbaraanne'),
											  ("93538273", 'Ermin'),
										  	  ("99117579", 'Violante'),
										  	  ("97285086", 'Filia'),
											  ("93951813", 'Reagen'),
											  ("95564872", 'Elwin');
                                              
insert into proyecto values ("RE32", "Scorpio", 500),
					        ('YK84', 'Skin Eruptions', 669),
					        ('RZ78', 'Aversion to Exertion', 523),
					        ('WK47', 'Lovenox', 585),
					        ('AS05', 'EROS LONG STAY SILICONE GLIDE', 355),
					        ('PX22', 'Antibiotic and Pain Relief', 508),
					        ('KZ62', 'VYTORIN', 337);
                            
insert into asignado_a values("99149698", "RE32"),
							 ("94058792", "RE32"),
							 ("95880396", "YK84"),
							 ("91486196", "RZ78"),
							 ("99117579", "WK47"),
							 ("95564872", "AS05");
                             
select * 
from cientifico;

/*Mostrar los datos de los cientificos asignados a un pryecto y los datos del proyecto */
select c.*, p.*
from cientifico as c join asignado_a as a on c.dni = a.dni_cientifico join proyecto as p on a.id_proyecto = p.id;

/*Actualizar el nombre dle proyecto Scorpio*/
update proyecto
set nombre = "XBOX X"
where id = "RE32";

/*Eliminar el proyecto AS05*/
delete from proyecto
where id = "AS05";