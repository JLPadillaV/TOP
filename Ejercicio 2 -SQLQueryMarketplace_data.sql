
-- Data for Marketplace

-- Unidad
Delete DIM_Unidad
INSERT INTO DIM_Unidad (ID_Unidad, Unidad) Values (1, 'gramos')
INSERT INTO DIM_Unidad (ID_Unidad, Unidad) Values (2, 'kilogramos')

-- Producto
Delete DIM_Producto
INSERT INTO DIM_Producto(ID_Producto, Producto, Categoria, Unidad_id) Values (1, 'Maduro', 'Tomate', 2 )
INSERT INTO DIM_Producto(ID_Producto, Producto, Categoria, Unidad_id) Values (2, 'Canario', 'Tomate', 2 )
INSERT INTO DIM_Producto(ID_Producto, Producto, Categoria, Unidad_id) Values (3, 'Pera', 'Tomate', 2 )
INSERT INTO DIM_Producto(ID_Producto, Producto, Categoria, Unidad_id) Values (4, 'Fashion', 'Sandía', 2 )
INSERT INTO DIM_Producto(ID_Producto, Producto, Categoria, Unidad_id) Values (5, 'Piñones',NULL , 1 )



--Proveedor
Delete DIM_Proveedor
INSERT INTO DIM_Proveedor (ID_Proveedor, Proveedor, CIF, Direccion, CP, Localidad) Values (1, 'Mortadelo SL', 'F3423764', '13 Rua del Percebe', 08705, 'Poblenou')
INSERT INTO DIM_Proveedor (ID_Proveedor, Proveedor, CIF, Direccion, CP, Localidad) Values (2, 'Filemon SL', 'F3468764', 'Castellana 15', 09245, 'Poblenou')
INSERT INTO DIM_Proveedor (ID_Proveedor, Proveedor, CIF, Direccion, CP, Localidad) Values (3, 'Tomatina SL', 'F34656776', 'Rambles 15', 08018, 'Poblenou')
INSERT INTO DIM_Proveedor (ID_Proveedor, Proveedor, CIF, Direccion, CP, Localidad) Values (4, 'Piñones SL', 'F3483604', 'Entença 45', 08015, 'Poblenou')

--Precio_Producto
delete FACT_Precio_Producto
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (1, 1, 1, 2.5)
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (2, 2, 1, 3.5)
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (3, 4, 2, 0.8)
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (4, 2, 3, 1.5)
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (5, 3, 3, 2)
INSERT INTO FACT_Precio_Producto ( ID_Precio_Producto, Producto_id, Proveedor_id, Coste_por_unidad) Values (6, 5, 4, 8.2)


-- Dirección CLiente
delete DIM_Direccion_Cliente
INSERT INTO DIM_Direccion_Cliente (ID_Direccion, Direccion, CP, Localidad, Provincia ) Values ( 1, 'C/ la palma 34', 98789, 'Barcelona', 'Barcelones')

-- Metodo Pago
delete DIM_MetodoPago
INSERT INTO DIM_MetodoPago (ID_MetodoPago, CC_numero, CC_tipo, CC_fechaCaducidad) VALUES (1, 2225544885522155489, 'VISA', '08/07/2021')

-- Cliente
Delete DIM_Cliente
INSERT INTO DIM_Cliente (ID_Cliente, Nombre_Cliente, DNI, Direccion_id, MetodoPago_id) Values (1, 'Toni', '44444444D', 1, 1)

-- Empresas Envio
delete DIM_EmpresaEnvio
INSERT INTO DIM_EmpresaEnvio (ID_EmpresaEnvio,Empresa, CIF, Direccion, CP, Localidad) VAlues (1, 'SEUR', 'F547798', 'c/Rocafort 44', 08015, 'Barcelona')

--OrdenVenta
delete FACT_OrdenVenta
INSERT INTO FACT_OrdenVenta (ID_Orden, Cliente_id, Producto_id, Cantidad, Precio_unitario, Fecha, Envio_id, FechaEnvio) Values (1, 1, 1, 15, 2.5, GETDATE(), 1, GETDATE()+2)
INSERT INTO FACT_OrdenVenta (ID_Orden, Cliente_id, Producto_id, Cantidad, Precio_unitario, Fecha, Envio_id, FechaEnvio) Values (2, 1, 3, 5, 0.8, GETDATE(), 1, GETDATE()+2)

