-- TABLA DIMENSIÓN "REGION"
create table DIM_Region(
      ID_Region int primary key,
	  Region varchar(50) not null
)
go

-- TABLA DIMENSIÓN "CIUDAD"
create table DIM_Ciudad(
      ID_Ciudad int primary key,
	  ID_Region int not null,
	  Ciudad varchar(50) not null
CONSTRAINT FK_Region FOREIGN KEY (ID_Region) REFERENCES DIM_Region(ID_Region)
)
go

-- TABLA DIMENSIÓN "PROVEEDOR"
create table DIM_Proveedor(
	  ID_Proveedor int primary key,
	  ID_Ciudad int,
	  Nombre varchar(50),
	  NIF varchar(15),
	  [Calle y Nº] varchar(max),
	  Telefono varchar(15),
	  Web varchar(max)
CONSTRAINT FK_Ciudad FOREIGN KEY (ID_Ciudad) REFERENCES DIM_Ciudad(ID_Ciudad)
)
go


-- TABLA DIMENSIÓN "CATEGORIA"
create table DIM_Categoria(
	  ID_Categoria int primary key,
	  Categoria varchar(max),
	  Descripcion varchar(max)
)
go

-- TABLA DIMENSIÓN "PRODUCTO"
create table DIM_Producto(
	  ID_Producto int primary key,
	  ID_Categoria int,
	  ID_Proveedor int,
	  Producto varchar(50),
	  Precio int,
	  Stock int
CONSTRAINT FK_Categoria FOREIGN KEY (ID_Categoria) REFERENCES DIM_Categoria(ID_Categoria),
CONSTRAINT FK_Proveedor FOREIGN KEY (ID_Proveedor) REFERENCES DIM_Proveedor(ID_Proveedor)
)
go

-- TABLA DIMENSIÓN "CLIENTE"
create table DIM_Cliente(
	  ID_Cliente int primary key,
	  ID_Ciudad int,
	  Nombre varchar(50),
	  NIF varchar(50),
	  [Calle y Nº] varchar(max),
	  Tel_1 varchar(15),
	  Tel_2 varchar(15),
	  Tel_3 varchar(15)
CONSTRAINT FK_Ciudad1 FOREIGN KEY (ID_Ciudad) REFERENCES DIM_Ciudad(ID_Ciudad)
)
go

-- TABLA DIM "DESCUENTOS"
create table DIM_Descuentos(
	  ID_Descuento int not null primary key,
	  Porcentaje float not null
)

-- TABLA DE HECHOS "VENTAS"
create table FACT_Ventas(
	  ID_Venta int primary key,
	  ID_Cliente int,
	  ID_Producto int,
	  ID_Descuento int,
	  Fecha datetime,
	  Cantidad int not null	  
CONSTRAINT FK_Cliente FOREIGN KEY (ID_Cliente) REFERENCES DIM_Cliente(ID_Cliente),
CONSTRAINT FK_Producto FOREIGN KEY (ID_Producto) REFERENCES DIM_Producto(ID_Producto),
CONSTRAINT FK_Descuento FOREIGN KEY (ID_Descuento) REFERENCES DIM_Descuentos(ID_Descuento)
)
go


-- INSERCIÓN DE DATOS
insert into Retail.dbo.DIM_Region(ID_Region,Region)
values (1,'Cataluña'),
       (2,'Madrid')
go

insert into Retail.dbo.DIM_Ciudad(ID_Ciudad, ID_Region,Ciudad)
values (1,1,'Barcelona'),
       (2,1,'Tarragona'),
	   (3,1,'Girona'),
	   (4,1,'Lérida'),
	   (5,1,'Badalona'),
	   (6,2,'Madrid'),
	   (7,2,'Getafe'),
	   (8,2,'Fuenlabrada'),
	   (9,2,'Leganés'),
	   (10,2,'Alcorcón')
go

insert into Retail.dbo.DIM_Proveedor(ID_Proveedor,ID_Ciudad,Nombre,NIF,[Calle y Nº],Telefono,Web)
values (1,1,'El Corte Ingles','A–3900001–3','','644365245','https://www.elcorteingles.es'),
       (2,2,'Mercadona','B–5646512–5','','644452031','https://www.mercadona.es'),
	   (3,7,'Inditex','C–4589712–3','','644585230','https://www.inditex.com/es/home'),
	   (4,5,'Leroy Merlin','F–4523600–8','','644879897', 'https://www.leroymerlin.es'),
	   (5,6,'Carrefour','A–3900001–3','','644569986', 'https://www.carrefour.es/'),
	   (6,1,'Fnac','A–6543211–0','','644123562','https://www.fnac.es/'),
	   (7,6,'Eroski','G–8560001–1','','644852147', 'https://www.eroski.es/'),
	   (8,1,'Dechatlon','A–3900001–3','','644444200','https://www.decathlon.es/es/'),
	   (9,10,'PC Componentes','J-6543215-2','','644000222','https://www.pccomponentes.com/'),
	   (10,8,'Lidl','A-7954621-9','','644258654','https://www.lidl.es')
go

insert into Retail.dbo.DIM_Categoria(ID_Categoria,Categoria,Descripcion)
values (1,'Tecnología','PC y accesorios'),
	   (2,'Electrodomésticos','Neveras, lavadoras y microondas'),
	   (3,'Muebles','Muebles de hogar y oficina'),
	   (4,'Indumentaria','Ropa de adulto y niños')

insert into Retail.dbo.DIM_Producto(ID_Producto,ID_Categoria,ID_Proveedor,Producto,Precio,Stock)
values (1,4,3,'Camisa',20,500),
       (2,4,8,'Sudadera deportiva hombre',10,400),
	   (3,4,3,'Zapato mujer',100,300),
	   (4,4,3,'Zapatilla unisex',80,1000),
	   (5,4,8,'Short deportivo hombre',10,700),
	   (6,1,6,'PC Gamer',2500,30),
	   (7,1,9,'PC Oficina',1000,50),
	   (8,1,1,'Teclado inalámbrico',30,200),
	   (9,1,1,'Mouse inalámbrico',10,200),
	   (10,1,6,'Disco externo 1TB',100,50),
	   (11,1,1,'Teclado inalámbrico',30,200),
	   (12,2,5,'Nevera no frost',600,30),
	   (13,2,10,'Lavadora 6kg',300,30),
	   (14,2,5,'Microonda 25L',150,60),
	   (15,2,5,'Microondas 50L',250,40),
	   (16,3,1,'Armario 2x1.5 mts',200,10),
	   (17,3,4,'Mesa de noche',50,100),
	   (18,3,10,'Cómoda 2 puertas',75,25),
	   (19,3,4,'Sofa cama 2 plazas',450,5),
	   (20,3,4,'Escritorio 1x0.6 mts',200,30)
go

insert into Retail.dbo.DIM_Cliente(ID_Cliente,ID_Ciudad,Nombre,Tel_1)
values (1,1,'Ráúl Aragones','644587878'),
       (2,1,'Juan Gárcía','644789321'),
	   (3,1,'Valentina Gómez','644214562'),
	   (4,1,'Carla Robles','644784512'),
	   (5,1,'Esteban Tablada','64412356'),
	   (6,6,'Roxana Tarragona','644963214'),
	   (7,6,'Leonardo González','644451203'),
	   (8,6,'Juana Contador','644639751'),
	   (9,6,'Anabella Velázquez','644852147'),
	   (10,3,'Matías López','644478451'),
	   (11,8,'Crlos Domínguez','644000222'),
	   (12,4,'Isabel Vargas','644451002'),
	   (13,10,'Mariano Ruíz','644333222'),
	   (14,2,'Mercedes Moreno','644001133'),
	   (15,5,'Mirtha Ortega','644412099'),
	   (16,9,'Ricardo Castillo','644012366'),
	   (17,7,'Agustín Ramos','644778812'),
	   (18,2,'Lisandro Sánchez','644111333'),
	   (19,4,'Georgina Medina','644112234'),
	   (20,8,'Sebastián López','644258999')
go


insert into Retail.dbo.DIM_Descuentos(ID_Descuento,Porcentaje)
values (1,0),
	   (2,0.05),
	   (3,0.1),
	   (4,0.15),
	   (5,0.2)

insert into Retail.dbo.FACT_Ventas(ID_Venta,ID_Cliente,ID_Producto,ID_Descuento,Fecha,Cantidad)
values (1,15,10,1,cast('10/04/2021' as datetime),5),
	   (2,8,4,3,cast('8/04/2021' as datetime),2),
	   (3,12,1,3,cast('3/04/2021' as datetime),8),
	   (4,8,4,3,cast('25/04/2021' as datetime),1),
	   (5,8,4,4,cast('26/04/2021' as datetime),3),
	   (6,4,4,3,cast('26/04/2021' as datetime),4),
	   (7,8,4,5,cast('1/05/2021' as datetime),4),
	   (8,20,3,1,cast('1/05/2021' as datetime),1),
	   (9,4,8,2,cast('2/05/2021' as datetime),5),
	   (10,3,14,2,cast('3/05/2021' as datetime),10),
	   (11,1,7,3,cast('4/05/2021' as datetime),8),
	   (12,9,19,1,cast('5/05/2021' as datetime),1),
	   (13,20,11,1,cast('5/05/2021' as datetime),3),
	   (14,13,1,5,cast('6/05/2021' as datetime),15),
	   (15,3,17,1,cast('7/05/2021' as datetime),1),
	   (16,5,5,2,cast('1/06/2021' as datetime),3),
	   (17,14,8,1,cast('2/06/2021' as datetime),3),
	   (18,3,9,1,cast('3/06/2021' as datetime),1),
	   (19,15,2,3,cast('4/06/2021' as datetime),5),
	   (20,4,18,4,cast('3/06/2021' as datetime),7)
go


-- CONSULTAS
-- MOSTRAR EL DETALLE DE CADA VENTA CON LA FECHA, NOMBRE DEL CLIENTE,CIUDAD DEL CLIENTE, PRODUCTO, CATEGORÍA, PRECIO, CANTIDAD, DESCUENTO, Y TOTAL. ORDENAR POR FECHA DE FORMA ASCENENTE
select v.ID_Venta,
       v.Fecha,
	   c.Nombre as Cliente,
	   cd.Ciudad,
	   p.Producto,
	   cat.Categoria,
	   p.Precio,
	   v.Cantidad,
	   d.Porcentaje as Descuento,
	   (p.Precio*v.Cantidad)-(p.Precio*v.Cantidad*d.Porcentaje) as Total
from Retail.dbo.FACT_Ventas as v
inner join Retail.dbo.DIM_Cliente as c
on v.ID_Cliente = c.ID_Cliente
inner join Retail.dbo.DIM_Ciudad as cd
on c.ID_Ciudad = cd.ID_Ciudad
inner join Retail.dbo.DIM_Producto as p
on v.ID_Producto = p.ID_Producto
inner join Retail.dbo.DIM_Categoria as cat
on p.ID_Categoria = cat.ID_Categoria
inner join Retail.dbo.DIM_Descuentos as d
on v.ID_Descuento = d.ID_Descuento
order by Fecha asc
go

-- MOSTRAR LA CANTIDAD DE PROVEEDORES POR CIUDAD Y ORDENAR DE MAYOR A MENOR
select c.Ciudad,
	   count(p.ID_Proveedor) as Proveedores
from Retail.dbo.DIM_Ciudad as c
inner join Retail.dbo.DIM_Proveedor as p
on c.ID_Ciudad = p.ID_Ciudad
group by c.Ciudad
order by count(p.ID_Proveedor) desc

-- MOSTRAR EL TOTAL DE VENTAS POR CIUDAD, ORDENADO DE MAYOR A MENOR
select c.Ciudad,
	   sum((p.Precio*v.Cantidad)-(p.Precio*v.Cantidad*d.Porcentaje)) as Ventas
from Retail.dbo.DIM_Ciudad as c
inner join Retail.dbo.DIM_Cliente as cte
on c.ID_Ciudad = cte.ID_Ciudad
inner join Retail.dbo.FACT_Ventas as v
on v.ID_Cliente = cte.ID_Cliente
inner join Retail.dbo.DIM_Producto as p
on p.ID_Producto = v.ID_Producto
inner join Retail.dbo.DIM_Descuentos as d
on d.ID_Descuento = v.ID_Descuento
group by c.Ciudad
order by Ventas desc
