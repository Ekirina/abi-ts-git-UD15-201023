create database academia;

use academia;

create table persona(
	dni varchar(9),
    nombre varchar(20) not null,
    telefono varchar(9),
    direccion varchar(100),
    primary key(dni)
);

create table alumno(
	dni varchar(9),
    edad int,
    primary key (dni),
    foreign key (dni) references persona(dni)
    on delete cascade on update cascade
);

create table desempleado(
	dni varchar(9),
    tiempo_desempleado int, -- meses
    primary key (dni),
    foreign key (dni) references alumno(dni)
    on delete cascade on update cascade
);

create table trabajador(
	dni varchar(9),
    cif varchar(15) not null,
    direccion_empresa varchar(100),
    primary key (dni),
    foreign key (dni) references alumno(dni)
    on delete cascade on update cascade
);

create table profesor(
	dni varchar(9),
    apellidos varchar(30) not null,
    primary key (dni),
    foreign key (dni) references persona(dni)
    on delete cascade on update cascade
);

create table curso(
	codigo int auto_increment,
    programa varchar(1000),
    horas int not null,
    titulo varchar(30) not null,
    profesor varchar(9) not null,
    primary key (codigo),
    foreign key (profesor) references profesor(dni)
    on delete no action on update cascade
);

create table alumno_curso(
	dni_alumno varchar(9),
    codigo_curso int,
    fecha_inicio date,
    fecha_fin date,
    nota double,
    primary key (dni_alumno, codigo_curso, fecha_inicio, fecha_fin),
    foreign key (dni_alumno) references alumno(dni)
    on delete cascade on update cascade,
    foreign key (codigo_curso) references curso(codigo)
    on delete cascade on update cascade
);

/*Inserción de datos*/
insert into persona (dni, nombre, telefono, direccion) values ('25443210K', 'Noby Palumbo', '317727164', '8156 Elgar Street');

DELETE FROM persona WHERE dni='25443210K';

insert into persona (dni, nombre, telefono, direccion) values ('12233489T', 'Alvina Kidman', '656396137', '92 International Parkway'),
															  ('84620473R', 'Sherry Applewhite', '657245952', '44913 Tennessee Point'),
															  ('83620457Y', 'Phaidra Molan', '144244159', '37 Quincy Plaza'),
															  ('12847382E', 'Torey Wey', '249214637', '4 Atwood Road'),
															  ('93383354H', 'Eldredge Huyghe', '583737625', '2 Sunnyside Point'),
															  ('83728221R', 'Gabriella Collick', '669120841', '672 Ramsey Point'),
															  ('87722100N', 'Barn Dittson', '656917685', '46980 Marcy Avenue'),
															  ('23303234H', 'Niko Sieve', '546362350', '40272 Prairie Rose Center'),
															  ('12039036M', 'Klarika Chaffyn', '179949503', '5 Graedel Circle'),
															  ('25443210K', 'Noby Palumbo', '317727164', '8156 Elgar Street');
insert into alumno (dni, edad) values ('84620473R', 23);
									  
DELETE FROM alumno WHERE dni = '84620473R';

insert into alumno (dni, edad) values ('12233489T', 40), 
									  ('84620473R', 23), 
                                      ('83620457Y', 33), 
                                      ('12847382E', 37), 
                                      ('93383354H', 56),
                                      ('83728221R', 18),
                                      ('87722100N', 32),
                                      ('23303234H', 23), 
                                      ('12039036M', 26), 
                                      ('25443210K', 45);
select * from alumno;

DELETE FROM alumno WHERE dni = '83728221R';
DELETE FROM alumno WHERE dni = '12039036M';

insert into desempleado (dni, tiempo_desempleado) values ('12233489T', 8), 
														 ('84620473R', 3), 
														 ('83620457Y', 0), 
														 ('12847382E', 7), 
														 ('93383354H', 6),
														 ('83728221R', 1),
														 ('87722100N', 2),
														 ('23303234H', 0), 
														 ('12039036M', 2), 
														 ('25443210K', 5);
                                                         
UPDATE desempleado SET tiempo_desempleado = 3 WHERE dni = '87722100N';
DELETE FROM desempleado WHERE dni = '23303234H';
DELETE FROM desempleado WHERE dni = '84620473R';
														
insert into trabajador (dni, cif, direccion_empresa) values ('84620473R', 'T42387590448765', '7 Center Road'), 
															('83620457Y', 'J36898254150908', '31 Memorial Parkway'), 
															('23303234H', 'B62138669734327', '2207 Toban Crossing'); 
select * from profesor;   
insert into profesor (dni, apellidos) values ('83728221R', 'Figiovanni Munder'),
											 ('12039036M', 'Birdall Hoobs');
                                             
insert into curso (codigo, programa, horas, titulo, profesor) values (1, 'JumpXS', 2600, 'Social Worker', '12039036M'),  
																	(2, 'Feedbug', 1900, 'Marketing Manager', '83728221R'),
                                                                    (3, 'Mynte', 820, 'Assistant Media Planner', '83728221R'),
                                                                    (4, 'Vipe', 1000, 'Senior Financial Analyst', '12039036M'),
                                                                    (5, 'Realcube', 2200, 'Automation Specialist IV', '83728221R'),
                                                                    (6, 'Quamba', 800, 'Media Manager IV', '12039036M'),
                                                                    (7, 'Jazzy', 2200, 'Junior Executive', '83728221R'),
                                                                    (8, 'Rhybox', 880, 'Director of Sales', '83728221R'),
                                                                    (9, 'Jabbertype', 2600, 'Geological Engineer', '12039036M'),
                                                                    (10, 'Trudeo', 1400, 'Clinical Specialist', '12039036M');
 
 insert into alumno_curso (dni_alumno, codigo_curso, fecha_inicio, fecha_fin, nota) values ('12233489T', 1, '2021-07-10', '2022-04-20', 5.81),  
																	('84620473R', 2, '2021-10-10', '2022-07-27', 6.65),
                                                                    ('83620457Y', 3, '2021-01-31', '2022-02-18', 7.67),
                                                                    ('12847382E', 4, '2021-07-15', '2022-11-23', 2.5),
                                                                    ('93383354H', 5, '2021-09-02', '2022-04-26', 2.16),
                                                                    ('87722100N', 6, '2021-02-05', '2022-04-29', 8.89),
                                                                    ('23303234H', 7, '2021-10-10', '2022-03-07', 2.36),
                                                                    ('25443210K', 8, '2021-02-09', '2022-12-23', 7.35);
select * from alumno_curso;