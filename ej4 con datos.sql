drop database if exists guerra4;

CREATE database guerra4;
USE guerra4;
CREATE table guerra(
	nombre VARCHAR(80),
    anyo_inicio int NOT NULL,
    anyo_final int,
    primary key (nombre)
);

CREATE table bando(
	nombre VARCHAR(40),
    is_ganador boolean,
    primary key (nombre)
);

CREATE table guerra_bando(
	nombre_guerra VARCHAR(80),
    nombre_bando VARCHAR(40),
    foreign key (nombre_bando) REFERENCES bando (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_guerra) REFERENCES guerra (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre_bando, nombre_guerra)
    );


CREATE table pais(
	nombre VARCHAR(80),
    anyos_independiente int NOT NULL,
    primary key (nombre)
);

CREATE table pais_bando(
	nombre_bando VARCHAR(40),
    nombre_pais VARCHAR(80),
    fecha_inicio date,
    fecha_final date,
    foreign key (nombre_bando) REFERENCES bando (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre_pais) REFERENCES pais (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre_bando, nombre_pais)
);    


CREATE table independencia(
	fecha_inicio date,
    fecha_final date,
    primary key (fecha_inicio, fecha_final)
);

CREATE table pais_independencia(
	nombre VARCHAR(80),
    fecha_inicio date,
    fecha_final date,
	foreign key (nombre) REFERENCES pais (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (fecha_inicio, fecha_final) REFERENCES independencia (fecha_inicio, fecha_final)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre, fecha_inicio, fecha_final)
);
 
insert into guerra values ('Guerra de Vietnam', 1700, 1975);
insert into guerra values ('Guerra de Irak', 2003, 2011);
insert into guerra values ('Guerra de los Balcanes', 1912, 1913);
insert into guerra values ('Guerras Yugoslavas', 1991, 2001);
insert into guerra values ('Guerra de Siria', 2011, null);
insert into guerra values ('Primera Guerra Mundial', 1914, 1918);
insert into guerra values ('Segunda Guerra Mundial', 1939, 1945);
insert into guerra values ('Guerra de Afgansitán', 2001, 2021);
insert into guerra values ('Guerra Fría', 1947, 1991);
insert into guerra values ('Guerra del Acre', 1903, 1903);

insert into bando (nombre, is_ganador) values ('Nienow Inc', true);
insert into bando (nombre, is_ganador) values ('Bogisich-Kuphal', true);
insert into bando (nombre, is_ganador) values ('Runolfsson and Herman', true);
insert into bando (nombre, is_ganador) values ('Renner and Walker', false);
insert into bando (nombre, is_ganador) values ('Stamm and Durgan', false);
insert into bando (nombre, is_ganador) values ('Hessel Inc', true);
insert into bando (nombre, is_ganador) values ('Mayer Group', false);
insert into bando (nombre, is_ganador) values ('Walter-Barton', false);
insert into bando (nombre, is_ganador) values ('Koelpin-Mayer', false);
insert into bando (nombre, is_ganador) values ('Romaguera Group', false);
insert into bando (nombre, is_ganador) values ('Hirthe and Jenkins', false);
insert into bando (nombre, is_ganador) values ('Kihn and Sons', false);
insert into bando (nombre, is_ganador) values ('Hegmann and Sons', true);
insert into bando (nombre, is_ganador) values ('Ullrich, Barton and Stark', true);
insert into bando (nombre, is_ganador) values ('Altenwerth-Nicolas', true);
insert into bando (nombre, is_ganador) values ('Monahan and Sons', false);
insert into bando (nombre, is_ganador) values ('Willms-Leffler', true);
insert into bando (nombre, is_ganador) values ('Okuneva Inc', true);
insert into bando (nombre, is_ganador) values ('O''Hara Inc', false);
insert into bando (nombre, is_ganador) values ('Keeling-Glover', false);

insert into guerra_bando values ('Guerra de Vietnam','Nienow Inc');
insert into guerra_bando values ('Guerra de Vietnam','Bogisich-Kuphal');
insert into guerra_bando values ('Guerra de Irak','Runolfsson and Herman');
insert into guerra_bando values ('Guerra de Irak','Renner and Walker');
insert into guerra_bando values ('Guerra de los Balcanes','Stamm and Durgan');
insert into guerra_bando values ('Guerra de los Balcanes','Hessel Inc');
insert into guerra_bando values ('Guerras Yugoslavas','Mayer Group');
insert into guerra_bando values ('Guerras Yugoslavas','Walter-Barton');
insert into guerra_bando values ('Guerra de Siria','Koelpin-Mayer');
insert into guerra_bando values ('Guerra de Siria','Romaguera Group');
insert into guerra_bando values ('Primera Guerra Mundial','Hirthe and Jenkins');
insert into guerra_bando values ('Primera Guerra Mundial','Kihn and Sons');
insert into guerra_bando values ('Segunda Guerra Mundial','Hegmann and Sons');
insert into guerra_bando values ('Segunda Guerra Mundial','Ullrich, Barton and Stark');
insert into guerra_bando values ('Guerra de Afgansitán','Altenwerth-Nicolas');
insert into guerra_bando values ('Guerra de Afgansitán','Monahan and Sons');
insert into guerra_bando values ('Guerra Fría','Willms-Leffler');
insert into guerra_bando values ('Guerra Fría','Okuneva Inc');
insert into guerra_bando values ('Guerra del Acre','O''Hara Inc');
insert into guerra_bando values ('Guerra del Acre','Keeling-Glover');

insert into pais (nombre, anyos_independiente) values ('Poland', 86);
insert into pais (nombre, anyos_independiente) values ('Pakistan', 54);
insert into pais (nombre, anyos_independiente) values ('Philippines', 76);
insert into pais (nombre, anyos_independiente) values ('Northern Mariana Islands', 76);
insert into pais (nombre, anyos_independiente) values ('China', 66);
insert into pais (nombre, anyos_independiente) values ('France', 6);
insert into pais (nombre, anyos_independiente) values ('Russia', 72);
insert into pais (nombre, anyos_independiente) values ('Indonesia', 7);
insert into pais (nombre, anyos_independiente) values ('Italia', 66);
insert into pais (nombre, anyos_independiente) values ('Croatia', 68);
insert into pais (nombre, anyos_independiente) values ('Northland', 98);
insert into pais (nombre, anyos_independiente) values ('Israel', 35);
insert into pais (nombre, anyos_independiente) values ('Sweden', 91);
insert into pais (nombre, anyos_independiente) values ('United States', 100);
insert into pais (nombre, anyos_independiente) values ('Japan', 26);
insert into pais (nombre, anyos_independiente) values ('Cuba', 70);
insert into pais (nombre, anyos_independiente) values ('Argentina', 77);
insert into pais (nombre, anyos_independiente) values ('Brazil', 86);
insert into pais (nombre, anyos_independiente) values ('Ghana', 26);
insert into pais (nombre, anyos_independiente) values ('Martinique', 97);

insert into pais_bando values ('Nienow Inc','Martinique','17000101','17000130');
insert into pais_bando values ('Bogisich-Kuphal','Poland','17000101','17100105');
insert into pais_bando values ('Runolfsson and Herman','Pakistan','20030526','20081201');
insert into pais_bando values ('Renner and Walker','Northern Mariana Islands','19120105','19130506');
insert into pais_bando values ('Stamm and Durgan','China','19120201','19131212');
insert into pais_bando values ('Hessel Inc','France','19910630','20010101');
insert into pais_bando values ('Mayer Group','Russia','19910630','20010102');
insert into pais_bando values ('Walter-Barton','Indonesia','20110421', null);
insert into pais_bando values ('Koelpin-Mayer','Italia','20110421', null);
insert into pais_bando values ('Romaguera Group','Croatia','19391128','19450912');
insert into pais_bando values ('Hirthe and Jenkins','Northland','19391024','19450110');
insert into pais_bando values ('Kihn and Sons','Israel','20010101','20210402');
insert into pais_bando values ('Hegmann and Sons','Sweden','20010101','20210401');
insert into pais_bando values ('Ullrich, Barton and Stark','United States','19470102','19471202');
insert into pais_bando values ('Altenwerth-Nicolas','Japan','20010101','20210402');
insert into pais_bando values ('Monahan and Sons','Cuba','20010101','20210401');
insert into pais_bando values ('Willms-Leffler','Argentina','19800101','19850130');
insert into pais_bando values ('Okuneva Inc','Brazil','19800101','19850130');
insert into pais_bando values ('O''Hara Inc','Ghana','19030120','19030220');
insert into pais_bando values ('Keeling-Glover','Martinique','19030124','19030220');

insert into independencia (fecha_inicio, fecha_final) values ('19010225', '20150911');
insert into independencia (fecha_inicio, fecha_final) values ('19720511', '20100418');
insert into independencia (fecha_inicio, fecha_final) values ('19970127', '19980930');
insert into independencia (fecha_inicio, fecha_final) values ('19231226', '20050616');
insert into independencia (fecha_inicio, fecha_final) values ('19200227', '19420316');
insert into independencia (fecha_inicio, fecha_final) values ('19810513', '19830722');
insert into independencia (fecha_inicio, fecha_final) values ('19080111', '19760611');
insert into independencia (fecha_inicio, fecha_final) values ('19430302', '19810228');
insert into independencia (fecha_inicio, fecha_final) values ('19661010', '20161010');
insert into independencia (fecha_inicio, fecha_final) values ('19531011', '20070206'); 
 
insert into pais_independencia values ('Poland','19010225', '20150911');
insert into pais_independencia values ('Pakistan','19720511', '20100418');
insert into pais_independencia values ('Philippines','19970127', '19980930');
insert into pais_independencia values ('Northern Mariana Islands','19231226', '20050616');
insert into pais_independencia values ('China','19200227', '19420316');
insert into pais_independencia values ('France','19810513', '19830722');
insert into pais_independencia values ('Russia','19080111', '19760611');
insert into pais_independencia values ('Indonesia','19430302', '19810228');
insert into pais_independencia values ('Italia','19661010', '20161010');
insert into pais_independencia values ('Croatia','19531011', '20070206');

select * from guerra;
select * from bando;
select * from guerra_bando;
select * from pais;
select * from pais_bando;
select * from independencia;
select * from pais_independencia;

select * from guerra 
where nombre = "Guerra de Vietnam";

update guerra set nombre = "Guerra Vietnam"
where nombre = "Guerra de Vietnam";

select * from guerra 
where nombre = "Guerra Vietnam";

delete from guerra where nombre = "Guerra Vietnam";