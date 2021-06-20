#Сложные запросы
# задание 1
select 
	name,
	count(*) as count_orders 
from users u join orders o on u.id = o.user_id 
group by u.id;

# задание 2
select 
	p.name, 
	desription,
	price,
	c.name as category
from products p left join catalogs c on p.catalog_id = c.id 

# задание 3
select c.name as `from` , flights_to.name as `to` 
from flights f join cities c on f.`from` = c.label
join (
select id,c.name 
from flights f join cities c on f.`to` = c.label
) as flights_to on flights_to.id = f.id