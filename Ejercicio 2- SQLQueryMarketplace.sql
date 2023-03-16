--TABLA PROVEEDOR
DROP TABLE IF EXISTS dbo.Proveedor
create table Proveedor (
ID_Proveedor int NOT NULL PRIMARY KEY,
Proveedor nchar(50),
Direccion nchar(50),
CP int,
Localidad nchar(50)
)

--TABLA VARIEDAD
DROP TABLE IF EXISTS dbo.Variedad
Create table Variedad (
ID_Variedad int NOT NULL PRIMARY KEY,
Nombre_Var nchar(50),
Categoria nchar(50),
Unidad_id int NOT NULL
)

--TABLA UNIDAD
DROP TABLE IF EXISTS dbo.Unidad
Create table Unidad (
ID_Unidad int NOT NULL PRIMARY KEY,
Unidad nchar(50)
)

--TABLA PRODUCTO
DROP TABLE IF EXISTS dbo.Producto
Create table Producto (
ID_Producto int NOT NULL PRIMARY KEY,
Proveedor_id int NOT NULL,
Variedad_id int NOT NULL,
Coste_por_unidad float
)

--TABLA CARRITO
DROP TABLE IF EXISTS dbo.Carrito
Create table Carrito (
ID_Carrito int NOT NULL PRIMARY KEY,
Orden_id int NOT NULL,
Producto_id int NOT NULL,
Cantidad int
)

--TABLA OrdenVenta
DROP TABLE IF EXISTS dbo.OrdenVenta
Create table OrdenVenta (
ID_Orden int NOT NULL PRIMARY KEY,
Fecha datetime,
Cliente_id int NOT NULL,
Carrito_id int NOT NULL,
MetodoPago_id int NOT NULL,
Envio_id int NOT NULL,
FechaEnvio datetime
)

--TABLA Cliente
DROP TABLE IF EXISTS dbo.Cliente
Create table Cliente(
ID_Cliente int NOT NULL PRIMARY KEY,
Nombre_Cliente nchar(50),
DNI int,
Direccion_id int NOT NULL,
MetodoPago_id int NOT NULL
)

--TABLA EmpresasEnvio
DROP TABLE IF EXISTS dbo.EmpresaEnvio
Create table EmpresaEnvio (
ID_EmpresaEnvio int NOT NULL PRIMARY KEY,
Empresa_E nchar(50),
CIF int,
Direccion nchar(50),
CP int,
Localidad nchar(50)
)

--TABLA Direccion CLIENTE
DROP TABLE IF EXISTS dbo.Direccion_Cliente
create table Direccion_Cliente (
ID_Direccion int NOT NULL PRIMARY KEY,
Cliente_id int NOT NULL,
Direccion nchar(50),
CP int,
Localidad nchar(50),
Provincia nchar(50)
)

--TABLA METODOPAGO
DROP TABLE IF EXISTS dbo.MetodoPago
create table MetodoPago (
ID_MetodoPago int NOT NULL PRIMARY KEY,
Cliente_id int NOT NULL,
CC_numero nchar(50),
CC_tipo nchar(10),
CC_fechaCaducidad date
)


--DROP TABLE IF EXISTS dbo.Variedad

alter table dbo.Variedad
add foreign key (Unidad_id) references dbo.Unidad(ID_Unidad);

alter table dbo.Producto
add foreign key (Proveedor_id) references dbo.Proveedor(ID_Proveedor)

alter table dbo.Producto
add foreign key (Variedad_id) references dbo.Variedad(ID_Variedad)

alter table dbo.Carrito
add foreign key (Orden_id) references dbo.OrdenVenta(ID_Orden)

alter table dbo.Carrito
add foreign key (Producto_id) references dbo.Producto(ID_Producto)

--OrdenVenta
alter table dbo.OrdenVenta
add foreign key (Cliente_id) references dbo.Cliente(ID_Cliente)

alter table dbo.OrdenVenta
add foreign key (Carrito_id) references dbo.Carrito(ID_Carrito)

alter table dbo.OrdenVenta
add foreign key (MetodoPago_id) references dbo.MetodoPago(ID_MetodoPago)

alter table dbo.OrdenVenta
add foreign key (Envio_id) references dbo.EmpresaEnvio(ID_EmpresaEnvio)

--Cliente
alter table dbo.Cliente
add foreign key (Direccion_id) references dbo.Direccion_Cliente(ID_Direccion)

alter table dbo.Cliente
add foreign key (MetodoPago_id) references dbo.MetodoPago(ID_MetodoPago)

--MetodoPago
alter table dbo.MetodoPago
add foreign key (Cliente_id) references dbo.Cliente(ID_Cliente)
