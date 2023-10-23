CREATE DATABASE Receta9;
USE Receta9;

create table Etiqueta (nombre varchar(20) primary key);

create table Receta (
id int auto_increment primary key,
nombre_plato varchar(40),
dificultad varchar(12),
duracion_media varchar(10),
cantidad_personas int
);

create table Paso(
id int auto_increment primary key, 
num_paso int,
descripcion varchar(400),
id_receta int,
foreign key (id_receta) references Receta(id)
on delete cascade on update cascade

);

create table Ingrediente(
nombre varchar(20) primary key,
cantidad double,
unidad varchar(20)
);

create table Utensilio(
nombre varchar(20) primary key,
tipo varchar (20)
);

create table Etiqueta_Receta(
nombre_etiqueta varchar(20) not null,
id_receta int not null,
foreign key (nombre_etiqueta) references Etiqueta(nombre)
on delete cascade on update cascade,
foreign key (id_receta) references Receta(id)
on delete cascade on update cascade,
primary key (nombre_etiqueta, id_receta)
);

create table Ingrediente_Receta(
id_receta int not null,
nombre_ingrediente varchar(20) not null,
primary key(id_receta, nombre_ingrediente),
foreign key (id_receta) references Receta(id)
on delete cascade on update cascade,
foreign key (nombre_ingrediente) references Ingrediente(nombre)
on delete cascade on update cascade
);

create table Receta_Utensilio(
id_receta int not null,
nombre_utensilio varchar(20) not null,
primary key (id_receta, nombre_utensilio),
foreign key (id_receta) references Receta(id)
on delete cascade on update cascade,
foreign key (nombre_utensilio) references Utensilio(nombre)
on delete cascade on update cascade

);

/*Inserción de datos*/

insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (1, 'Delicias terrarias', 'Fácil', '30 min', 6);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (2, 'A la vieja escuela', 'Fácil', '5 min', 4);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (3, 'Con cucurucho', 'Media', '140 min', 5);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (4, 'BBQ', 'Fácil', '45 min', 9);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (5, 'Lluvia de colores', 'Fácil', '20 min', 2);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (6, 'Estrellados', 'Fácil', '20 min', 3);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (7, 'Ponyo ponyo', 'Fácil', '15 min', 5);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (8, 'Guau guau', 'Fácil', ' 15 min', 4);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (9, 'Tocado y hundido', 'Difícil', '200 min', 6);
insert into Receta (id, nombre_plato, dificultad, duracion_media, cantidad_personas) values (10, 'Jerry', 'Media', '45 min', 10);

SELECT * FROM Receta;

insert into Paso (id, num_paso, descripcion, id_receta) values (1, 1, 
'En una olla añadimos agua y esperamos a que hierva. Mientras esperamos, vamos con la salsa de mayonesa', 8);
insert into Paso (id, num_paso, descripcion, id_receta) values (2, 2, 'Para la salsa de mayonesa cascamos un 
huevo en un pequeño bol a parte para comprobar si hay algún resto de cáscara y evitar una posible contaminación
de salmonella. Luego transferimos el huevo al vaso de la batidora y añadimos la sal, el vinagre (o zumo de limón)
y la mitad del aceite. Colocamos el brazo de la batidora en el interior, tocando la base, y empezamos a batir
a baja potencia.', 8);
insert into Paso (id, num_paso, descripcion, id_receta) values (3, 3, 'Hasta que la mezcla no esté emulsionada,
no moveremos la batidora, entonces (solo entonces) incorporamos el resto del aceitey levantamos al tiempo que
seguimos batiendo hasta obtener el espesor deseado. Si no consumimos toda la mayonesa en el momento, podemos
guardarla en la nevera en un recipiente cerrado durante un máximo de dos días.', 8);
insert into Paso (id, num_paso, descripcion, id_receta) values (4, 4, 'Cuando el agua de la olla ya esté por
fin hirviendo, podemos añadir nuestros frankfurts al estilo viena durante 5 minutos. Una vez transcurrido ese
tiempo, podemos ya escurrirlos y servirlos directamente en nuestros panes junto con la mayonesa casera.', 8);
insert into Paso (id, num_paso, descripcion, id_receta) values (5, 1, 'Abrimos nuestra barra de pan con un 
cuchillo de sierra sin llegar al final de la barra. De esta manera, cuando se funda el
chocolate por el calor, no nos ensuciamos las manos por el chocolate derretido', 2);
insert into Paso (id, num_paso, descripcion, id_receta) values (6, 2, 'Añadimos nuestro chocolate favorito dentro
de nuestro pan y en un pequeño bol servimos un mixto de frutos secos !y a disfrutar!', 2);
insert into Paso (id, num_paso, descripcion, id_receta) values (7, 1, 'Para nuestra fondue de queso seleccionamos
el queso gruyere y el queso Vacherin Fribourgeois por su gran combinación en la cazuela. Para ello, la cazuela
debe ser una especial para fondue, ya que debe llevarse a la mesa (colocada sobre un soporte con un quemador para
mantenerla caliente y que no se quede enganchado el queso en el fondo del recipiente).', 10);
insert into Paso (id, num_paso, descripcion, id_receta) values (8, 2, 'Una vez listos y equipados, comenzamos a 
trocear nuestro quesos en dado o también se puede rallar.', 10);
insert into Paso (id, num_paso, descripcion, id_receta) values (9, 3, 'Tomamos la cazuela, cortamos el ajo en dos
y frotamos en su interior. Introducimos el queso troceado, el vino y el zumo de limón en la cazuela y calentamos
a fuego lento removiendo constantemente.', 10);
insert into Paso (id, num_paso, descripcion, id_receta) values (10, 4, 'Cuando comience a fundirse, añadimos el
queso Vacherin Fribourgeois y la maicena diluida en el kirsch. Condimentamos con pimienta y removemos hasta obtener
una crema homogénea y lisa. Prepara los acompañamientos en tu mesa y date el placer. Bon appetit!', 10);

SELECT * FROM Paso;

insert into Utensilio (nombre, tipo) values ('Olla fondue', 'porcelana usada'),
											('Batidora ', 'eléctrica'),
                                            ('Cuchillo de sierra', 'acero'),
                                            ('Soplete de cocina', 'hierro y con gas'),
                                            ('Lengua de cocina', 'silicona'),
                                            ('Mandolina', 'acero'),
                                            ('Cucharas para miel', 'madera'),
                                            ('Sifon de soda', 'acero'),
                                            ('Pinza para marisco', 'acero'),
                                            ('Rallador microplano', 'acero');
                                            
UPDATE Utensilio SET nombre= 'Batidora' WHERE nombre = 'Batidora ';  
                                          
SELECT * FROM Utensilio;

insert into Ingrediente (nombre, cantidad, unidad) values ('Huevo', 1, NULL);
insert into Ingrediente (nombre, cantidad, unidad) values ('Sal', 4, 'gr.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Vinagre', 10, 'ml.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Zumo de limón', 10, 'ml.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Aceite vegetal', 200, 'ml.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Aceite de oliva', 200, 'ml.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Queso gruyere', 400, 'gr.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Queso Vacherin', 400, 'gr.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Vino blanco', 300, 'ml.');
insert into Ingrediente (nombre, cantidad, unidad) values ('Diente de ajo', 1, NULL);

SELECT * FROM Ingrediente;

UPDATE Ingrediente SET nombre = 'Licor de cereza' WHERE nombre = 'Aceite vegetal';
UPDATE Ingrediente SET cantidad = 100 WHERE nombre = 'Licor de cereza';

insert into Etiqueta (nombre) values ('vegetariano'),
									('lactosa'),
                                    ('fondue'),
                                    ('comida francesa'),
                                    ('dulce'),
                                    ('gluten'),
                                    ('sin gluten'),
                                    ('sin lactosa'),
                                    ('sal'),
                                    ('sin sal'),
                                    ('salsa');

insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('vegetariano', 10);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('lactosa', 10);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('fondue', 10);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('comida francesa', 10);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('lactosa', 2);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('dulce', 2);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('gluten', 2);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('sal', 2);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('sal', 8);
insert into Etiqueta_Receta (nombre_etiqueta, id_receta) values ('salsa', 8);

SELECT * FROM Etiqueta_Receta;

insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (8, 'Huevo');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (8, 'Sal');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (2, 'Sal');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (10, 'Sal');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (8, 'Vinagre');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (8, 'Zumo de limón');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (10, 'Zumo de limón');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (10, 'Vino blanco');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (10, 'Diente de ajo');
insert into Ingrediente_Receta (id_receta, nombre_ingrediente) values (10, 'Queso gruyere');

SELECT * FROM Ingrediente_Receta;

insert into Receta_Utensilio (id_receta, nombre_utensilio) values (10, 'Olla fondue');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (8, 'Batidora');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (2, 'Cuchillo de sierra');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (4, 'Lengua de cocina');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (4, 'Cucharas para miel');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (10, 'Rallador microplano');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (1, 'Rallador microplano');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (5, 'Mandolina');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (7, 'Mandolina');
insert into Receta_Utensilio (id_receta, nombre_utensilio) values (8, 'Cuchillo de sierra');

SELECT * FROM Receta_Utensilio;
