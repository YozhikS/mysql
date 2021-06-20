#Операторы, фильтрация, сортировка и ограничение. Агрегация данных
# задание 1
SELECT 
	firstname, 
	lastname, 
	hometown  AS city,
	filename  AS main_photo
FROM users u,profiles p,media m
WHERE u.id = 202 and u.id = p.user_id and p.user_id = m.user_id;

# задание 2
@set id_user = 204

select count(id),
		from_user_id 
from messages m2
WHERE from_user_id IN (
	SELECT initiator_user_id FROM friend_requests WHERE target_user_id = :id_user AND status='approved'
	union
	SELECT target_user_id FROM friend_requests WHERE initiator_user_id = :id_user AND status='approved'
) and to_user_id = :id_user
GROUP BY from_user_id;

# задание 3
select count(*)
from (
select count(l.id),
	p2.user_id,
	birthday
from likes l, media m, profiles p2 
where l.media_id = m.id and m.user_id = p2.user_id 
GROUP BY p2.user_id
ORDER BY birthday desc
limit 10
) as young_10;

# задание 4
SELECT count(l.id) as likes, 
    CASE
         WHEN gender = 'm' THEN 'male'
         else 'female'
    end as gender
FROM profiles, likes l 
where l.user_id = profiles.user_id
group by gender
ORDER BY likes DESC;

# задание 5
select 
	firstname, 
	lastname,
	count(activity.id) as active
from (
	SELECT 
		user_id,
		m.id 
	FROM media m, media_types mt 
	WHERE m.media_type_id = mt.id and mt.name = 'post'
	union all 
	SELECT 
		user_id,
		l.id 
	FROM likes l
	) as activity, users u
where u.id = activity.user_id
GROUP BY user_id
order by active
limit 10;