# проверка запросов друзей

delete from friend_requests where initiator_user_id = target_user_id;
select * from friend_requests where initiator_user_id = target_user_id;


# Повторить все действия CRUD

insert into users (`id`,`firstname`, `lastname`, `email`, `phone`) 
values ('455', 'Dean', 'Satterfi', 'lkerfg@example.com', '79784561232');

insert into users values
('412', 'Reta', 'Kertzmann', 'okuneva.est6543@example.org', NULL, '79784561233'),
('421', 'Lauren', 'Beahan', 'ashlynn.gottl6457@example.org', NULL, '79784561234'),
('456', 'Elfrieda', 'Grant', 'caesar65@example.com', NULL, '79784561235'),
('555', 'Allison', 'Rolfson', 'caesar66@example.com', NULL, '79784561236');

select * from users

insert into users
set 
	firstname = 'Lauren',
	lastname = 'Rolfson',
	email = 'caesar67@example.com',
	phone = '79784561237'
;


select * from users where email = 'caesar67@example.com';

select * from users order by id desc;

select 10+15;

select distinct firstname, lastname from users;

select * from users limit 1 offset 5;

select * from users where id = 350 or firstname = 'Amaya';

select * from users where id in (350,365,379,380);


update friend_requests 
set
	status = 'declined',
	updated_at = now()
where 
	initiator_user_id = 330 
	and target_user_id = 382
	and status = 'requested'
	;


select * from messages where from_user_id = to_user_id;

delete from messages where from_user_id = 254 and to_user_id = 254;