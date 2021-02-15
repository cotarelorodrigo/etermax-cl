CREATE TABLE info_movimientos(
	fecha date,
	descripcion_de_cliente text,
	descripcion_de_proveedor text,
	descripcion_de_producto text,
	descripcion_de_marca text,
	cantidad integer,
	costo integer,
	venta integer,
	ganancia_neta integer
);

INSERT INTO info_movimientos
select 
dm.fecha, 
dc.descripcion as descripcion_de_cliente,
prov.descripcion as descripcion_de_proveedor,
dp.descripcion as descripcion_de_producto,
marcas.descripcion as descripcion_de_marca,
dm.cantidad,
dm.costo,
dm.venta,
dm.venta - dm.costo as ganancia_neta
from data_movimientos as dm
join data_clientes as dc on dm.cod_cliente = dc.cod_cliente
join data_productos as dp on dm.cod_prod = dp.cod_prod
join data_marcas as marcas on dp.cod_marca = marcas.cod_marca
join data_proveedores as prov on dp.cod_proveedor = prov.cod_proveedor;