--TABLA DIM_PROVEEDOR
DROP TABLE IF EXISTS dbo.DIM_Proveedor
create table DIM_Proveedor (
ID_Proveedor int NOT NULL PRIMARY KEY,
Proveedor nchar(50),
CIF nchar(50),
Direccion nchar(50),
CP int,
Localidad nchar(50)
)

--TABLA PRODUCTO
DROP TABLE IF EXISTS dbo.DIM_Producto
Create table DIM_Producto (
ID_Producto int NOT NULL PRIMARY KEY,
Producto nchar(50),
Categoria nchar(50),
Unidad_id int NOT NULL
)

--TABLA UNIDAD
DROP TABLE IF EXISTS dbo.DIM_Unidad
Create table DIM_Unidad (
ID_Unidad int NOT NULL PRIMARY KEY,
Unidad nchar(50)
)

--TABLA FACT PRECIO PRODUCTO
DROP TABLE IF EXISTS dbo.FACT_Precio_Producto
Create table FACT_Precio_Producto (
ID_Precio_Producto int NOT NULL PRIMARY KEY,
Producto_id int NOT NULL,
Proveedor_id int NOT NULL,
Coste_por_unidad float
)


--TABLA OrdenVenta
DROP TABLE IF EXISTS dbo.FACT_OrdenVenta
Create table FACT_OrdenVenta (
ID_Orden int NOT NULL PRIMARY KEY,
Cliente_id int NOT NULL,
Producto_id int NOT NULL,
Cantidad float,
Precio_unitario float,
Fecha datetime,
Envio_id int NOT NULL,
FechaEnvio datetime
)

--TABLA DIM_Cliente
DROP TABLE IF EXISTS dbo.DIM_Cliente
Create table DIM_Cliente(
ID_Cliente int NOT NULL PRIMARY KEY,
Nombre_Cliente nchar(50),
DNI nchar(50),
Direccion_id int NOT NULL,
MetodoPago_id int NOT NULL
)

--TABLA EmpresasEnvio
DROP TABLE IF EXISTS dbo.DIM_EmpresaEnvio
Create table Dim_EmpresaEnvio (
ID_EmpresaEnvio int NOT NULL PRIMARY KEY,
Empresa nchar(50),
CIF nchar(50),
Direccion nchar(50),
CP int,
Localidad nchar(50)
)

--TABLA Direccion CLIENTE
DROP TABLE IF EXISTS dbo.DIM_Direccion_Cliente
create table DIM_Direccion_Cliente (
ID_Direccion int NOT NULL PRIMARY KEY,
Direccion nchar(50),
CP int,
Localidad nchar(50),
Provincia nchar(50)
)

--TABLA METODOPAGO
DROP TABLE IF EXISTS dbo.DIM_MetodoPago
create table DIM_MetodoPago (
ID_MetodoPago int NOT NULL PRIMARY KEY,
CC_numero nchar(50),
CC_tipo nchar(10),
CC_fechaCaducidad date
)


--FOREIGN KEYS

alter table dbo.DIM_Producto
add foreign key (Unidad_id) references dbo.DIM_Unidad(ID_Unidad);

--Precio_producto
alter table dbo.FACT_Precio_Producto
add foreign key (Proveedor_id) references dbo.DIM_Proveedor(ID_Proveedor)

alter table dbo.FACT_Precio_Producto
add foreign key (Producto_id) references dbo.DIM_Producto(ID_Producto)


--OrdenVenta
alter table dbo.FACT_OrdenVenta
add foreign key (Cliente_id) references dbo.DIM_Cliente(ID_Cliente)

alter table dbo.FACT_OrdenVenta
add foreign key (Producto_id) references dbo.FACT_Precio_Producto(ID_Precio_Producto)

alter table dbo.FACT_OrdenVenta
add foreign key (Envio_id) references dbo.DIM_EmpresaEnvio(ID_EmpresaEnvio)

--Cliente
alter table dbo.DIM_Cliente
add foreign key (Direccion_id) references dbo.DIM_Direccion_Cliente(ID_Direccion)

alter table dbo.DIM_Cliente
add foreign key (MetodoPago_id) references dbo.DIM_MetodoPago(ID_MetodoPago)