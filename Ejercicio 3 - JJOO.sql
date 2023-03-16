-- DIMENSIÓN "SEDE"
create table DIM_Sede(
	ID_Sede int primary key,
	Sede varchar(50)
)
go

-- DIMENSIÓN "JEFE"
create table DIM_Jefe(
	ID_Jefe int primary key,
	Nombre varchar(50),
	Apellido varchar(50)
)

-- DIMENSIÓN "TIPO"
create table DIM_Tipo(
	ID_Tipo int primary key,
	Tipo varchar(50)
)
go

-- DIMENSIÓN "COMPLEJO"
create table DIM_Complejo(
	ID_Complejo int primary key,
	ID_Sede int,
	ID_Tipo int,
	ID_Jefe int,
	Complejo varchar(max),
	Area_m2 float,
	Presupuesto float,
constraint FK_Sede foreign key (ID_Sede) REFERENCES DIM_Sede(ID_Sede),
constraint FK_Tipo foreign key (ID_Tipo) REFERENCES DIM_Tipo(ID_Tipo),
constraint FK_Jefe foreign key (ID_Jefe) REFERENCES DIM_Jefe(ID_Jefe)
)
go

-- DIMENSION "DEPORTE"
create table DIM_Deporte(
	ID_Deporte int primary key,
	Deporte varchar(max)
)
go

-- DIMENSION "EQUIPAMIENTO"
create table DIM_Equipamiento(
	ID_Equipo int primary key,
	ID_Deporte int,
	Ítem varchar(max)
constraint FK_Deporte foreign key (ID_Deporte) references DIM_Deporte(ID_Deporte)
)
go

-- DIMENSION "COMISARIO"
create table DIM_Comisario(
	ID_Comisario int primary key,
	Nombre varchar(50),
	Apellido varchar(50),
)
go



-- TABLA DE HECHOS "EVENTOS"
create table FACT_Evento(
	ID_Evento int primary key,
	ID_Complejo int,
	ID_Deporte int,
	Evento varchar(50),
	Fecha date,
	Duracion_hs float,
	Asistentes int
constraint FK_Complejo foreign key (ID_Complejo) references DIM_Complejo(ID_Complejo),
constraint FK_Deporte1 foreign key (ID_Deporte) references DIM_Deporte(ID_Deporte),
)
go

-- TABLA DIMENSION "ROL"
create table DIM_Rol(
	ID_Rol int primary key,
	Rol varchar(50)
)

-- TABLA UNION "SUPERVISION"
create table U_Supervision(
	ID_Supervision int primary key,
	ID_Evento int,
	ID_Comisario int,
	ID_Rol int
constraint FK_Evento foreign key (ID_Evento) references FACT_Evento(ID_Evento),
constraint FK_Comisario foreign key (ID_Comisario) references DIM_Comisario(ID_Comisario),
constraint FK_Rol foreign key (ID_Rol) references DIM_Rol(ID_Rol)

)



-- INSERCIÓN DE DATOS
insert into DIM_Sede(ID_Sede,Sede)
values (1,'Barcelona'),
	   (2,'Madrid'),
	   (3,'Valencia')
go

insert into DIM_Jefe(ID_Jefe,Nombre,Apellido)
values (1,'Roberto','Ramírez'),
	   (2,'Marta','Gutierrez'),
	   (3,'Juan','Centurión'),
	   (4,'Concepción','Ruíz'),
	   (5,'Roberto','Ramírez'),
	   (6,'Jesús','García'),
	   (7,'Jesica','Montero'),
	   (8,'Domingo','Blanco'),
	   (9,'Luis','Pérez')
go

insert into DIM_Tipo(ID_Tipo,Tipo)
values (1,'Unideportivo'),
	   (2, 'Polideportivo')
go

insert into DIM_Complejo(ID_Complejo,ID_Sede,ID_Tipo,ID_Jefe,Complejo,Area_m2,Presupuesto)
values (1,1,2,4,'Montjuic',17000, 500000),
	   (2,1,2,5,'Palau Sant Jordi',7000,300000),
	   (3,1,1,8,'Camp Nou',10000,1000000),
	   (4,2,1,1,'Wanda',9000,700000),
	   (5,2,2,9,'Bernabeu',12000,1300000),
	   (6,2,2,7,'Plaza de los Toros',9000,450000),
	   (7,3,1,2,'Mestalla',9000,600000),
	   (8,3,2,3,'Ciudad de Valencia',7500,350000),
	   (9,3,2,6,'Madrigal',8500000,200000)
go

insert into DIM_Comisario(ID_Comisario, Nombre, Apellido)
values (1,'Santiago', 'Giménez'),
	   (2,'Salvador', 'García'),
	   (3,'Estela', 'López'),
	   (4,'Santiago', 'Giménez'),
	   (5,'Germán', 'Iribarren'),
	   (6,'Alfredo', 'Vargas'),
	   (7,'Cecilia', 'Ortega'),
	   (8,'Mercedes', 'Tarragona'),
	   (9,'Alcidez', 'Núñez'),
	   (10,'Eugenio', 'Estévez'),
	   (11,'Sebastián', 'Gonzalez'),
	   (12,'Alba', 'Sánchez'),
	   (13,'Nicolás', 'Álvarez'),
	   (14,'Ricardo', 'Pérez'),
	   (15,'Marianela', 'Torres')
go

insert into DIM_Deporte(ID_Deporte,Deporte)
values (1,'Fútbol'),
	   (2,'Tenis'),
	   (3,'Hockey'),
	   (4,'Natación'),
	   (5,'Básquet'),
	   (6,'Atletismo'),
	   (7,'Yudo'),
	   (8,'Rugby'),
	   (9,'Tenis de mesa'),
	   (10,'Waterpolo')
go

insert into DIM_Equipamiento(ID_Equipo,ID_Deporte,Ítem)
values (1,1,'Balon futbol'),
	   (2,1, 'Arco'),
	   (3,1, 'Red futbol'),
	   (4,1, 'Banderines'),
	   (5,1, 'Tarjetas'),
	   (6,2, 'Pelotas'),
	   (7,2, 'Raqueta'),
	   (8,2, 'Toalla de mano'),
	   (9,2, 'Funda para raquets'),
	   (10,3, 'Palo corto'),
	   (11,3, 'Palo medio'),
	   (12,3, 'Palo Largo'),
	   (13,3, 'Red hockey'),
	   (14,4, 'Gafas'),
	   (15,4, 'Gorra'),
	   (16,4, 'Tapones de oidos'),
	   (17,5, 'Balon basquet'),
	   (18,5, 'Aro'),
	   (19,5, 'Red basquet'),
	   (20,6, 'Barra paralela'),
	   (21,6, 'Pértiga'),
	   (22,6, 'Cinta'),
	   (23,6, 'Colchoneta'),
	   (24,7, 'Dummies'),
	   (25,7, 'Barra paralela'),
	   (26,7, 'Chaleco'),
	   (27,8, 'Balon Rugby'),
	   (28,8, 'Arco H'),
	   (29,8, 'Casco protector'),
	   (30,9, 'Paleta'),
	   (31,9, 'Pelotas tenis de mesa'),
	   (32,9, 'Red tenis de mesa'),
	   (33,10, 'Balon waterpolo'),
	   (34,10, 'Arco waterpolo'),
	   (35,10, 'Red waterpolo')
go


insert into FACT_Evento(ID_Evento,ID_Complejo,ID_Deporte,Evento,Fecha,Duracion_hs,Asistentes)
values (1,3,1,'España vs Italia',cast('1/07/2021' as date),3,45000),
       (2,1,6,'Maraton 45k',cast('2/07/2021' as date),5,10000),
	   (3,4,8,'Cuartos de final',cast('5/07/2021' as date),2,25000),
	   (4,5,1,'Federer vs Nadal',cast('8/07/2021' as date),5,50000),
	   (5,8,5,'Semifinal',cast('9/07/2021' as date),4,30000),
	   (6,2,1,'Final',cast('30/07/2021' as date),3,75000),
	   (7,6,3,'Holanda vs Austraila',cast('4/07/2021' as date),3,10000),
	   (8,4,9,'Final',cast('30/07/2021' as date),3,7000),
	   (9,1,1,'Argentina vs Brasil',cast('10/07/2021' as date),3,75000),
	   (10,5,3,'Final',cast('30/07/2021' as date),3,55000)
go

insert into DIM_Rol(ID_Rol,Rol)
values (1,'Juez'),
	   (2,'Observador')

insert into U_Supervision (ID_Supervision,ID_Evento,ID_Comisario,ID_Rol)
values (1,1,5,1),
       (2,1,4,2),
       (3,3,5,2),
	   (4,3,14,1),
	   (5,4,6,2),
	   (6,4,13,1),
	   (7,6,5,1),
	   (8,6,3,2),
	   (9,10,15,1),
	   (10,10,7,2),
	   (11,5,9,1),
	   (12,5,11,2),
	   (13,9,13,1),
	   (14,9,1,2),
	   (15,7,15,1),
	   (16,7,3,2)
go


-- SELECCIONAR TODOS LOS EVENTOS LLEVADOS A CABO EN BARCELONA
select e.Evento,
	   s.Sede
from JJOO.dbo.FACT_Evento as e
inner join JJOO.dbo.DIM_Complejo as c
on e.ID_Complejo = c.ID_Complejo
inner join JJOO.dbo.DIM_Sede as s
on c.ID_Sede = s.ID_Sede
where s.Sede = 'Barcelona'

-- SELECCIONAR TODOS LOS EVENTOS DE FUTBOL CON MÁS DE 40.000 ESPECTADORES
select e.Evento,
       d.Deporte,
	   e.Asistentes
from JJOO.dbo.FACT_Evento as e
inner join JJOO.dbo.DIM_Deporte as d
on e.ID_Deporte = d.ID_Deporte
where e.Asistentes > 40000
order by e.Asistentes desc

-- MOSTRAR TODOS LOS EVENTOS CON SUS RESPECTIVOS SUPERVISORES Y ROLES
select e.Evento,
	   c.Nombre,
	   c.Apellido,
	   r.Rol
from JJOO.dbo.FACT_Evento as e
inner join JJOO.dbo.U_Supervision as s
on e.ID_Evento = s.ID_Evento
inner join JJOO.dbo.DIM_Comisario as c
on s.ID_Comisario = c.ID_Comisario
inner join JJOO.dbo.DIM_Rol as r
on r.ID_Rol = s.ID_Rol