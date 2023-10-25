drop database if exists ej16;
create database ej16;
use ej16;

create table Usuario(
id int auto_increment primary key,
email varchar(80),
descripcion tinytext,
telefono varchar(9),
imagen_perfil varchar(200)
);

create table Tweet(
id int auto_increment primary key,
texto varchar(280),
fecha date,
likes int,
retweets int,
multimedia varchar(200),
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Usuario_Retweet(
id_usuario int,
id_tweet int,
primary key (id_usuario, id_tweet),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_tweet) references Tweet(id)
on delete cascade on update cascade

);

create table Usuario_Like(
id_usuario int,
id_tweet int,
primary key (id_usuario, id_tweet),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_tweet) references Tweet(id)
on delete cascade on update cascade
);

insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('adawid0@jalbum.net', 'Chico amable', 728840692, 'http://dummyimage.com/202x100.png/5fa2dd/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('redy1@eepurl.com', 'Ojos azules', 963097906, 'http://dummyimage.com/164x100.png/cc0000/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('afihelly2@nsw.gov.au', '19%', 599352855, 'http://dummyimage.com/238x100.png/cc0000/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('thubbins3@hp.com', 'Me gustan los elefantes', 977992043, 'http://dummyimage.com/225x100.png/dddddd/000000');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('edoig4@go.com', '"Si la vida te da limones, dile que no te gustan"', 409938105, 'http://dummyimage.com/232x100.png/5fa2dd/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('cbullene5@nationalgeographic.com', '"Espero que sepas que somos mejores amigos"', 773188682, 'http://dummyimage.com/126x100.png/ff4444/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('dtilly6@flickr.com', '"Ya empezarón los rumores entre los vecinos"', 458546451, 'http://dummyimage.com/241x100.png/5fa2dd/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('ghugonnet7@bbc.co.uk', '"Soldado advertido no muere en guerra"', 520547689, 'http://dummyimage.com/185x100.png/5fa2dd/ffffff');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('cdunklee8@delicious.com', '"Espero que no te enamores"', 920173193, 'http://dummyimage.com/165x100.png/dddddd/000000');
insert into Usuario (email, descripcion, telefono, imagen_perfil) values ('rcasacchia9@vimeo.com', '"Por algo cenicienta nunca se queda"', 495845885, 'http://dummyimage.com/135x100.png/ff4444/ffffff');

insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('Mi sobrino ayer se comio una albóndiga, que cuqui', '2022-05-05', 6225, 2567, 'http://dummyimage.com/185x100.png/dddddd/000000', 1);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Qué es rojo y malo para tus dientes? Un ladrillo.', '2020-09-12', 5379, 435, 'http://dummyimage.com/172x100.png/5fa2dd/ffffff', 2);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Por qué no pueden hablar los dinosaurios? Porque están muertos.', '2020-04-24', 3342, 1313, 'http://dummyimage.com/130x100.png/ff4444/ffffff', 3);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Qué le dijo Batman a Robin antes de subir al coche? "Robin, sube al coche".', '2023-07-29', 9028, 5774, 'http://dummyimage.com/130x100.png/5fa2dd/ffffff', 4);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Que es más grande 1 elevado a 10 o 10 elevado a 1?', '2020-03-01', 607, 4521, 'http://dummyimage.com/193x100.png/cc0000/ffffff', 5);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('Van dos fantasmas y se cae el del médium.', '2021-05-13', 9803, 3153, 'http://dummyimage.com/103x100.png/cc0000/ffffff', 6);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Qué le dice un jardinero a otro? Nos vemos cuando podamos.', '2022-07-21', 6256, 6498, 'http://dummyimage.com/178x100.png/dddddd/000000', 7);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Que llevan las mujeres polacas? po laca', '2023-10-23', 8398, 6114, 'http://dummyimage.com/214x100.png/cc0000/ffffff', 8);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Y cómo se llama un boomerang que no vuelve? Palo.', '2019-12-11', 2733, 9465, 'http://dummyimage.com/249x100.png/ff4444/ffffff', 9);
insert into Tweet (texto, fecha, likes, retweets, multimedia, id_usuario) values ('¿Qué es rojo y tiene forma de cubo? Un cubo azul pintado de rojo.', '2021-01-07', 3630, 2268, 'http://dummyimage.com/195x100.png/ff4444/ffffff', 10);

insert into Usuario_Retweet values (1,2),(3,1),(2,4),(4,6),(5,7),(6,10),(7,9),(8,7),(9,8),(10,5);

insert into Usuario_Like values (1,3),(2,2),(3,1),(4,10),(5,9),(6,8),(7,7),(8,6),(9,5),(10,4);

select * from Usuario;
select * from Tweet;
select * from Usuario_Retweet;
select * from Usuario_Like;

update Usuario set descripcion = "Trabajando" where id = 1;
update Tweet set texto = "Los perros verdes aún no existen, pero es cuestión de tiempo que los inventen" where id = 1;
update Usuario set email = "trabajador@trabajando.work" where id = 1;

delete from Tweet where id = 1;
delete from Usuario where id = 1;
delete from Tweet where id = 5;