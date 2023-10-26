drop database if exists pieza5;
CREATE database pieza5;
USE pieza5;
CREATE table tipo(
	siglas VARCHAR(5),
    descripcion VARCHAR (300),
    primary key (siglas)
);
CREATE table almacen(
	numero VARCHAR(10),
    descripcion VARCHAR(300),
    direccion VARCHAR(200),
    primary key (numero)
);
CREATE table pieza(
	siglas_tipo VARCHAR(5),
    numero VARCHAR(5),
    precio double,
    foreign key (siglas_tipo) REFERENCES tipo (siglas)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (numero, siglas_tipo)
);
CREATE table pieza_pieza(
	siglas_tipo VARCHAR(5),
    numero VARCHAR(5),
    siglas_tipo2 VARCHAR(5),
    numero2 VARCHAR(5),
	foreign key (siglas_tipo) REFERENCES pieza (siglas_tipo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (siglas_tipo2) REFERENCES pieza (siglas_tipo)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (siglas_tipo, numero, siglas_tipo2, numero2)
);
CREATE table estanteria(
	id3 VARCHAR (5),
    nombre VARCHAR (20),
    numero_almacen VARCHAR(10),
    foreign key (numero_almacen) REFERENCES almacen (numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id3)
);
CREATE table pieza_estanteria(
	siglas_tipo_pieza VARCHAR(20),
    numero_pieza VARCHAR(5),
    id3 VARCHAR(5),
    cantidad int,
    foreign key (siglas_tipo_pieza, numero_pieza) REFERENCES pieza (siglas_tipo, numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id3) REFERENCES estanteria (id3)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (siglas_tipo_pieza, numero_pieza, id3)
);

insert into tipo values ("TU", "Tuerca"),
						("TO", "Tornillo"),
						("AR", "Arandela"),
						("CL", "Clavo"),
						("RE", "Remache"),
                        ("CU", "Cuña"),
                        ("CUA", "Cuña avanzaza");

insert into pieza values("TU", "2", 1.05),
						("TU", "4", 2.10),
                        ("AR", "12", 0.56),
                        ("CU", "3", 4.89),
                        ("AR", "7", 0.37),
                        ("CUA", 1, 8.07);

insert into pieza_pieza values	("CUA", 1, "CU", 3),
								("CUA", 1, "TU", 2),
								("CUA", 2, "TU", 3),
								("CUA", 2, "TU", 5),
								("CUA", 3, "TU", 6);

insert into almacen values  ("1", "Almacen Reus", "Poligono A n50"),
							("2", "Almacen Reus 2", "Poligono C n3"),
                            ("3", "Almacen Tarragona", "Gavarres, Calle del sello n13"),
                            ("4", "Almacen Vilaseca", "Polihono Alba, calle barenys n3");
                            

insert into estanteria values  	("HD44D", "Estanteria L", "1"),
								("NMHG6", "Estanteria L", "2"),
								("MJH0V", "Estanteria M", "1"),
								("3D3SB", "Estanteria M", "1"),
								("FGDS5", "Estanteria L", "2"),
								("BG77J", "Estanteria XL", "3"),
								("46BN6", "Estanteria XXL", "3"),
								("JIT6D", "Estanteria XL", "4");
                                
insert into pieza_estanteria values ("TU", "2", "HD44D", 30),
									("TU", "2", "MJH0V", 50),
									("TU", "4", "MJH0V", 20),
									("AR", "12", "46BN6", 200),
									("CUA", 1, "46BN6", 100),
									("TU", "4", "FGDS5", 10),
									("CU", "3", "NMHG6", 34);

update tipo
set descripcion = "Tornillo de acero"
where siglas = "TO";

update pieza_estanteria
set cantidad = cantidad - 15
where siglas_tipo_pieza = "AR" and numero_pieza = "12" and id3 = "46BN6";

delete from pieza
where siglas_tipo = "TU" and numero = "4";