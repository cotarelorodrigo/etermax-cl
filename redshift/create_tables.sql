CREATE TABLE data_clientes (
	cod_cliente integer PRIMARY KEY,
	descripcion text
);

CREATE TABLE data_marcas(
	cod_marca integer PRIMARY KEY,
	descripcion text
);

CREATE TABLE data_proveedores(
	cod_proveedor integer PRIMARY KEY,
	descripcion text
);

CREATE TABLE data_productos(
	cod_prod integer PRIMARY KEY,
	cod_marca integer,
	cod_proveedor integer,
	descripcion text,
	FOREIGN KEY (cod_marca) REFERENCES data_marcas(cod_marca),
	FOREIGN KEY (cod_proveedor) REFERENCES data_proveedores(cod_proveedor)
);

CREATE TABLE data_movimientos (
	cod_prod integer,
	cod_cliente integer,
	fecha date,
	cantidad integer,
	costo integer,
	venta integer,
	FOREIGN KEY (cod_prod) REFERENCES data_productos(cod_prod),
	FOREIGN KEY (cod_cliente) REFERENCES data_clientes(cod_cliente),
	PRIMARY KEY(cod_prod, cod_cliente, fecha)
);