with n_movs as (
	select
	im.fecha,
	im.descripcion_de_cliente,
	im.ganancia_neta,
	row_number() over(partition by im.descripcion_de_cliente order by im.fecha desc) as rn
	from info_movimientos as im
)
select 
nm.descripcion_de_cliente as cliente,
max(nm.fecha) as ultima_compra,
sum(nm.ganancia_neta) as ganancia_total
from n_movs as nm
where rn <= 7
group by 1;
