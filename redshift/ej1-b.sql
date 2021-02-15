with marcas_con_venta as (
	select distinct mar.cod_marca 
	from data_movimientos as dm
	join data_productos as dp on dm.cod_prod = dp.cod_prod
	join data_marcas as mar on dp.cod_marca = mar.cod_marca
)
select *
from data_marcas as dm
where dm.cod_marca not in (select cod_marca from marcas_con_venta)