drop database if exists ej14;
create database ej14;
use ej14;

create table Usuario(
id int auto_increment primary key,
foto varchar(500),
nombre varchar(40),
apellidos varchar(80),
contrasenia varchar(200),
correo varchar(80),
direccion varchar(80),
is_celebrity boolean
);

create table Grupo(
id int auto_increment primary key,
nombre varchar(80),
num_contactos int,
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Comentario(
id int auto_increment primary key,
texto text,
imagen varchar(500),
privacidad enum('publico', 'privado'),
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Telefono(
telefono varchar(9) primary key,
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Grupo_Usuario(
id_grupo int,
id_usuario int,
primary key (id_grupo, id_usuario),
foreign key (id_grupo) references Grupo(id)
on delete cascade on update cascade,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table usuario_bloqueado(
id_usuario int,
id_usuario_bloqueado int,
primary key (id_usuario, id_usuario_bloqueado),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_usuario_bloqueado) references Usuario(id)
on delete cascade on update cascade
);

create table usuario_contacto(
id_usuario int,
id_usuario_contacto int,
comentario varchar(255),
primary key (id_usuario, id_usuario_contacto),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_usuario_contacto) references Usuario(id)
on delete cascade on update cascade
);

insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Edith', 'Boultwood', 'http://cafepress.com/est/lacinia/nisi.js?pulvinar=rutrum&sed=nulla&nisl=tellus&nunc=in&rhoncus=sagittis&dui=dui&vel=vel&sem=nisl&sed=duis&sagittis=ac&nam=nibh&congue=fusce&risus=lacus&semper=purus&porta=aliquet&volutpat=at&quam=feugiat&pede=non&lobortis=pretium&ligula=quis&sit=lectus&amet=suspendisse&eleifend=potenti','Constraseña' ,'eboultwood0@uol.com.br', '32 Dawn Road', true);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Sheilah', 'Trulocke', 'http://sciencedaily.com/luctus/et/ultrices/posuere/cubilia/curae.jpg?nulla=nullam&integer=porttitor&pede=lacus&justo=at&lacinia=turpis&eget=donec&tincidunt=posuere&eget=metus&tempus=vitae&vel=ipsum&pede=aliquam&morbi=non&porttitor=mauris&lorem=morbi&id=non&ligula=lectus&suspendisse=aliquam&ornare=sit&consequat=amet&','Constraseña', 'strulocke1@sbwire.com', '26 Shoshone Point', false);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Mariska', 'Ilem', 'http://parallels.com/molestie/nibh/in/lectus.png?etiam=in&faucibus=eleifend&cursus=quam&urna=a&ut=odio&tellus=in&nulla=hac&ut=habitasse&erat=platea&id=dictumst&mauris=maecenas&vulputate=ut&elementum=massa&nullam=quis&varius=augue&nulla=luctus&facilisi=tincidunt&cras=nulla&non=mollis&velit=molestie&nec=lorem&nisi=quisque','Constraseña', 'milem2@opensource.org', '36 Linden Park', false);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Nap', 'Renard', 'https://elpais.com/vivamus/tortor/duis/mattis.aspx?venenatis=lacinia&tristique=eget&fusce=tincidunt&congue=eget&diam=tempus&id=vel&ornare=pede&imperdiet=morbi&sapien=porttitor&urna=lorem&pretium=id&nisl=ligula&ut=suspendisse&volutpat=ornare&sapien=consequat&arcu=lectus&sed=in&augue=est&aliquam=risus&erat=auctor&volutpat=s','Constraseña', 'nrenard3@printfriendly.com', '98895 Harper Place', true);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Marta', 'Portress', 'http://irs.gov/ac/diam/cras/pellentesque/volutpat/dui/maecenas.aspx?vehicula=natoque&condimentum=penatibus&curabitur=et&in=magnis&libero=dis&ut=parturient&massa=montes&volutpat=nascetur&convallis=ridiculus', '$2a$04$ZvaeO6B9HP.0zQZiGCKt..bcUyvFCwc.ftuM7ZOtVSt1bs8O8Jasu','mportress4@nytimes.com', '7606 Clarendon Court', true);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Benedikt', 'Traynor', 'http://blinklist.com/vestibulum/sagittis/sapien/cum/sociis/natoque.json?quis=luctus&libero=nec&nullam=molestie&sit=sed&amet=justo&turpis=pellentesque&elementum=viverra&ligula=pede&vehicula=ac&consequat=diam&morbi=cras&a=pellentesque&ipsum=volutpat&integer=dui&a=maecenas&nibh=tristique&in=est&quis=et&justo=tempus&', '$2a$04$YcXnyfCFA7yaiPk47vzQPOWkoLOKwydVswMsUP.QjaTX3bNMvDHMm', 'btraynor5@washingtonpost.com', '763 Almo Drive', false);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Gardiner', 'Eldrett', 'https://delicious.com/integer/pede/justo/lacinia/eget/tincidunt.aspx?diam=consequat&id=varius&ornare=integer&imperdiet=ac&sapien=leo&urna=pellentesque&pretium=ultrices&nisl=mattis&ut=odio&volutpat=donec&sapien=vitae&arcu=nisi&sed=nam&augue=ultrices&aliquam=libero&erat=non&volutpat=mattis&in=pulvinar&congue=nulla&', 'Constraseña' ,'geldrett6@newsvine.com', '65 Comanche Avenue', true);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Gabrielle', 'Quarless', 'https://gizmodo.com/dui/luctus.json?quis=id&libero=justo&nullam=sit&sit=amet&amet=sapien&turpis=dignissim&elementum=vestibulum&ligula=vestibulum&vehicula=ante&consequat=ipsum&morbi=primis&a=in&ipsum=faucibus&integer=orci&a=luctus&nibh=et&in=ultrices&quis=posuere&justo=cubilia&maecenas=curae&rhoncus=nulla&aliquam', '$2a$04$2AnfEdA84pJJX9S1e.Cc7OWqbebZVmC.VowlYKsCiNKzHjhzUHKZK', 'gquarless7@drupal.org', '25758 Holy Cross Circle', true);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Jessa', 'Alejandri', 'http://wiley.com/bibendum/morbi/non/quam.json?in=ligula&felis=vehicula&eu=consequat&sapien=morbi&cursus=a&vestibulum=ipsum&proin=integer&eu=a&mi=nibh&nulla=in&ac=quis&enim=justo&in=maecenas&tempor=rhoncus&turpis=aliquam&nec=lacus&euismod=morbi&scelerisque=quis&quam=tortor&turpis=id&adipiscing=nulla&lorem=ultrices&vitae', '$2a$04$nG6bQK/kNn7UNtVgAGPg0.qRgL8YM2uuZDTSznwSliEPYW2S5XIYq', 'jalejandri8@pagesperso-orange.fr', '688 American Way', false);
insert into Usuario (nombre, apellidos, foto, contrasenia, correo, direccion, is_celebrity) values ('Theodoric', 'Tantum', 'http://360.cn/quis/lectus/suspendisse/potenti.aspx?tempor=sit&convallis=amet&nulla=sapien&neque=dignissim&libero=vestibulum&convallis=vestibulum&eget=ante&eleifend=ipsum&luctus=primis&ultricies=in&eu=faucibus&nibh=orci&quisque=luctus&id=et&justo=ultrices&sit=posuere&amet=cubilia&sapien=curae', '$2a$04$SsNqsOlsJPe2CZ6y/.xhbOUl7MSYjyCHp7kDUJ1TW6froFxQDprVi', 'ttantum9@google.cn', '34799 Division Hill', false);

insert into Grupo (nombre, num_contactos, id_usuario) values ('Bachillerato 2023',22,1),('Los cools',7,2),('Bachillerato2022',21,3),('SMX',24,4),('Bootcamp',19,5),
('Las lolis',7,6),('Los cubanos',6,7),('Las pajaras',3,8),('Las divinas',4,9),('Nadie pasa de esta esquina',5,10);

insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Me gusta el brocoli', 'https://ebay.co.uk/quis/orci/nullam/molestie.jsp?consequat=interdum&in=in&consequat=ante&ut=vestibulum&nulla=ante&sed=ipsum&accumsan=primis&felis=in&ut=faucibus&at=orci&dolor=luctus&quis=et&odio=ultrices&consequat=posuere&varius=cubilia&integer=curae&ac=duis&leo=faucibus&pellentesque=accumsan&ultrices=odio&mattis=curabitur&odio=convallis&donec=', 'publico', 1);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Ayer me caí desde el balcón de mi casa', 'https://slashdot.org/proin/leo/odio/porttitor/id/consequat/in.jpg?integer=quis&aliquet=lectus&massa=suspendisse&id=potenti&lobortis=in&convallis=eleifend&tortor=quam&risus=a&dapibus=odio&augue=in&vel=hac&accumsan=habitasse&tellus=platea&nisi=dictumst&eu=maecenas&orci=ut&mauris=massa&lacinia=quis&sapien=augue&quis=luctus&liber', 'privado', 2);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('¿Colacao o nesquik?', 'http://columbia.edu/ut/ultrices.json?elit=velit&ac=id&nulla=pretium&sed=iaculis&vel=diam&enim=erat&sit=fermentum&amet=justo&nunc=nec&viverra=condimentum&dapibus=neque&nulla=sapien&suscipit=placerat&ligula=ante&in=nulla&lacus=justo&curabitur=aliquam&at=quis&ipsum=turpis&ac=eget&tellus=elit&semper=sodales&interdum=scelerisque&mauris=mauris&ullamc', 'publico', 3);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Sinceramente a veces pienso que Einstein tenía razón', 'http://wunderground.com/in/tempus/sit.jpg?sagittis=at&nam=turpis&congue=donec&risus=posuere&semper=metus&porta=vitae&volutpat=ipsum&quam=aliquam&pede=non&lobortis=mauris&ligula=morbi&sit=non&amet=lectus&eleifend=aliquam&pede=sit&libero=amet&quis=diam&orci=in&nullam=magna&molestie=bibendum&nibh=imperdiet&in=nulla', 'publico', 4);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Einstein dijo que solo había dos cosas infinitas', 'https://altervista.org/etiam/justo/etiam/pretium.jpg?magna=risus&ac=semper&consequat=porta&metus=volutpat&sapien=quam&ut=pede&nunc=lobortis&vestibulum=ligula&ante=sit&ipsum=amet&primis=eleifend&in=pede&faucibus=libero&orci=quis&luctus=orci&et=nullam&ultrices=molestie&posuere=nibh&cubilia=in&curae=lectus&mauris=pelle', 'privado', 5);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('¿Alguna vez os habéis parado a pensar que con un paraguas es más fácil que te caiga un rayo?', 'http://princeton.edu/luctus/ultricies/eu/nibh/quisque/id.xml?consequat=dis&varius=parturient', 'privado', 6);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Teneis demasiado tiempo libre', 'http://discovery.com/morbi/sem.png?interdum=adipiscing&mauris=lorem&non=vitae&ligula=mattis&pellentesque=nibh&ultrices=ligula&phasellus=nec&id=sem&sapien=duis&in=aliquam&sapien=convallis&iaculis=nunc&congue=proin&vivamus=at&metus=turpis&arcu=a&adipiscing=pede&molestie=posuere&hendrerit=nonummy&at=integer&vulputate=non&vitae=velit&nisl', 'publico', 7);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Ayer mi hermano se cayó del balcón de su casa', 'http://unc.edu/elementum/eu/interdum/eu/tincidunt/in.html?vel=elit&lectus=proin&in=interdum&quam=mauris&fringilla=non&rhoncus=ligula&mauris=pellentesque&enim=ultrices&leo=phasellus&rhoncus=id&sed=sapien&vestibulum=in&sit=sapien&amet=iaculis&cursus=congue&id=vivamus&turpis=metus&integer=arcu&aliquet=adipiscing&massa=mol', 'privado', 8);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Como dijo murphy, haz lo que quieras que siempre te va a salir mal', 'http://bizjournals.com/justo/in/blandit/ultrices/enim/lorem.xml?justo=vestibulum&in=quam&blandit=sapien&ultrices=varius&enim=ut&lorem=blandit&ipsum=non&dolor=interdum&sit=in&amet=ante&consectetuer=vestibulum&adipiscing=ante&elit=ipsum&proin=primis&interdum=in&mauris=faucibus&non=orci&ligula=luctus&', 'publico', 9);
insert into Comentario (texto, imagen, privacidad, id_usuario) values ('Mi gato siempre pone esa cara cuando me ve ¿es normal?', 'https://i.pinimg.com/736x/c3/94/03/c39403438b4f25f16be866168631ef75.jpg', 'privado', 10);

insert into Telefono (telefono, id_usuario) values (549343478, 1);
insert into Telefono (telefono, id_usuario) values (810667672, 2);
insert into Telefono (telefono, id_usuario) values (446000543, 3);
insert into Telefono (telefono, id_usuario) values (116918626, 4);
insert into Telefono (telefono, id_usuario) values (158146732, 5);
insert into Telefono (telefono, id_usuario) values (195674736, 6);
insert into Telefono (telefono, id_usuario) values (994527659, 7);
insert into Telefono (telefono, id_usuario) values (945334807, 8);
insert into Telefono (telefono, id_usuario) values (663883327, 9);
insert into Telefono (telefono, id_usuario) values (851397853, 10);

insert into Grupo_Usuario values (1,1),(2,3),(3,4),(5,7),(4,6),(9,5),(7,6),(8,2),(10,9),(6,10);

insert into usuario_bloqueado values (1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(10,1),(2,5);

insert into usuario_contacto values (2,5,'Es un pesado'),(2,3,'Tiene ojos lindos'),(3,4,'Primo'),(6,7,'Padre de Diaz'),(8,9,'Me debe 10€'),(6,3,'Sabe lo de mi prima'),
(10,1, 'Amigo de juan'),(1,10,'Juega al Ajedrez'),(9,3,'Cuarentena'),(5,2,'Me cae mal');

select * from Usuario;
select * from Grupo;
select * from Telefono;
select * from Grupo_Usuario;
select * from usuario_bloqueado;
select * from usuario_contacto;

update Telefono set telefono = '631020682' where id_usuario = 1; 
update Telefono set telefono = '356487122' where id_usuario = 2; 
update Telefono set telefono = '875421364' where id_usuario = 3; 

delete from Usuario where id = 1;
delete from Usuario where id = 4;
delete from Usuario where id = 8;