/*Script creacion de la base de datos para el Hotel Canino Guau*/

/*Creación y uso de la base de datos*/

create database GuauHotelCanino;
use GuauHotelCanino;

/*Creación de tablas*/

create table cliente (
ciCli int NOT NULL,
nombreCli varchar (20) NOT NULL,
apellidoCli varchar (20) NOT NULL,
correo varchar (35) NOT NULL,
fechaNacCli date,
direccion varchar (30) NOT NULL,
primary key (ciCli)
);

create table telefonoCli (
ciCli int NOT NULL references ciCli (cliente),
telefonoCli int NOT NULL,
primary key (ciCli)
);

create table mascota (
idMascota int auto_increment NOT NULL,
ciCli int NOT NULL references ciCli (cliente),
nombreMascota varchar (20) NOT NULL,
sexo enum ("MACHO", "HEMBRA") NOT NULL,
comida varchar (100),
vacunas varchar (100) NOT NULL,
complementos varchar (100),
primary key (idMascota)
);

create table medicamento (
idMascota int NOT NULL references idMascota (mascota),
nombreMed varchar(30),
horarioMed varchar(50),
dosis varchar (50),
primary key (idMascota)
);

create table funcionario (
ciFun int NOT NULL,
nombreFun varchar (20) NOT NULL,
apellidoFun varchar (20) NOT NULL, 
fechaNacFun date,
primary key (ciFun)
);

create table telefonoFuncionario (
ciFun int NOT NULL references ciFun (funcionario),
telefonoFun int,
primary key (ciFun)
);

create table funcionario_cliente_mascota (
idMascota int NOT NULL references idMascota (mascota),
ciFun int NOT NULL references ciFun (funcionario),
ciCli int NOT NULL references ciCli (cliente),
primary key (idMascota)
);

create table cargo (
idCargo int auto_increment NOT NULL,
puesto varchar (50) NOT NULL,
primary key (idCargo)
);

create table cargo_funcionario (
ciFun int NOT NULL references ciFun (funcionario),
idCargo int NOT NULL references idCargo (cargo),
primary key (cifun)
);

create table habitacion (
idHab int auto_increment NOT NULL,
tipoHab enum ("ESTANDAR", "SUITE", "MINI_SUITE", "JUNIOR_SUITE") NOT NULL,
webCam boolean NOT NULL,
dogTv boolean NOT NULL,
cantidadPerros int NOT NULL,
precioHab decimal(20,1) NOT NULL,
primary key (idHab)
);

create table listaPrecio (
idPrecio int auto_increment NOT NULL,
tipoHabPrecio enum ("ESTANDAR", "SUITE", "MINI_SUITE", "JUNIOR_SUITE") NOT NULL,
capacidad int NOT NULL,
precioFijo decimal(20,1),
primary key (idPrecio)
);

create table habitacion_listaPrecio (
idprecio int NOT NULL references idPrecio (listaPrecio),
idHab int NOT NULL references idHab (habitacion),
primary key (idprecio)
);

create table reserva (
idRes int auto_increment NOT NULL,
idHab int NOT NULL references idHab (habitacion),
idMascota int NOT NULL references idMascota (mascota),
ciCli int NOT NULL references ciCli (cliente),
horaRes datetime,
fechaAlta date,
precioRes decimal(20,1),
metodoPago enum ("CONTADO", "TARJETA"),
primary key (idRes)
);

create table funcionario_reserva (
idRes int NOT NULL references idRes (reserva),
ciFun int NOT NULL references ciFun (funcionario),
primary key (idRes)
);

create table reserva_habitacion (
idHab int NOT NULL references idHab (habitacion),
idRes int NOT NULL references idRes (reserva),
primary key (idHab)
);

create table horario (
idHorario int auto_increment NOT NULL,
horarioEntrega time,
horarioRetiro time,
primary key (idHorario)
);

create table camioneta (
matricula varchar (12) NOT NULL,
cantidadPerrosCamioneta int,
idHorario int NOT NULL references idHorario (horario),
primary key (matricula)
);

create table camioneta_horario (
matricula varchar (12) NOT NULL references matricula (camioneta),
idhorario int references idhorario (horario),
primary key (matricula)
);

create table reserva_camioneta_horario (
idRes int NOT NULL references idRes (reserva),
matricula varchar (8) references matricula (camioneta),
primary key (idRes)
);

/*Insertamos datos*/
select * from funcionario;

insert into funcionario values
("49509922", "Nicolas", "Gonzalez", "2000-01-12"),
("49788556", "Maximiliano", "Robles", "1998-02-08");

insert into cargo values
("1", "Gerente"),
("2", "Oficinista"),
("3", "Recepcionista de Garage");

insert into listaPrecio values
("1", "ESTANDAR", "1", "28"),
("2", "ESTANDAR", "2", "40"),
("3", "ESTANDAR", "3", "56"),
("4", "SUITE", "1", "34"),
("5", "SUITE", "2", "51"),
("6", "SUITE", "3", "68"),
("7", "JUNIOR_SUITE", "1", "31"),
("8", "JUNIOR_SUITE", "2", "46.5"),
("9", "JUNIOR_SUITE", "3", "62"),
("10", "MINI_SUITE", "1", "31"),
("11", "MINI_SUITE", "2", "46.5"),
("12", "MINI_SUITE", "3", "62");

insert into habitacion values
("1", "SUITE", "0", "0", "0", "0"),
("2", "SUITE", "0", "0", "0", "0"),
("3", "SUITE", "0", "0", "0", "0"),
("4", "SUITE", "0", "0", "0", "0"),
("5", "ESTANDAR", "0", "0", "0", "0"),
("6", "ESTANDAR", "0", "0", "0", "0"),
("7", "ESTANDAR", "0", "0", "0", "0"),
("8", "ESTANDAR", "0", "0", "0", "0"),
("9", "ESTANDAR", "0", "0", "0", "0"),
("10", "ESTANDAR", "0", "0", "0", "0"),
("11", "MINI_SUITE", "0", "0", "0", "0"),
("12", "MINI_SUITE", "0", "0", "0", "0"),
("13", "MINI_SUITE", "0", "0", "0", "0"),
("14", "MINI_SUITE", "0", "0", "0", "0"),
("15", "MINI_SUITE", "0", "0", "0", "0"),
("16", "JUNIOR_SUITE", "0", "0", "0", "0"),
("17", "JUNIOR_SUITE", "0", "0", "0", "0"),
("18", "JUNIOR_SUITE", "0", "0", "0", "0"),
("19", "JUNIOR_SUITE", "0", "0", "0", "0"),
("20", "JUNIOR_SUITE", "0", "0", "0", "0");

insert into horario values
("1", "13:55:00", "16:50:00"),
("2", "12:00:50", "17:10:45");

insert into camioneta values
("AAA1111", "0", "1"),
("BBB2222", "0", "2");

/*Creacion de usuarios*/

create user 'ngonzalez'@localhost identified by '12345';
create user 'mrobles'@localhost identified by '11111';

grant all privileges on GuauHotelCanino.* to 'ngonzalez'@localhost;
grant insert, select, update, delete on GuauHotelCanino.* to 'mrobles'@localhost;

flush privileges;

/* Triggers*/
/*Creamos una tabla que lleve un registro de cuando se ingresó un funcionario y luego creamos el trigger*/

create table reg_funcionario (
ciFun int,
nombreFun varchar (20),
apellidoFun varchar (20),
ingresado datetime,
primary key (ciFun)
);

create trigger funcionario_ai after
insert on funcionario
for each row
insert into reg_funcionario (ciFun, nombreFun , apellidoFun, insertado)
values (new.ciFun, new.nombreFun, new.apellidoFun, now());

/*Creamos otro trigger para que cuando se actualicen precios de habitaciones, guarde cuándo fue actualizado, y el valor antiguo*/

create table precios_actualizados (
antidPrecio int,
antprecioFijo decimal(20,1),
nuevoidPrecio int,
nuevoprecioFijo decimal(20,1),
fechaModif datetime
);

create trigger precios_bu before update on listaPrecio
for each row
insert into precios_actualizados
(antidPrecio, antprecioFijo, nuevoidPrecio, nuevoprecioFijo, fechaModif)
values (old.idPrecio, old.precioFijo, new.idPrecio, new.precioFijo, now()
);