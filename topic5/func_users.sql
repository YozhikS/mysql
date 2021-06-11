#Операторы, фильтрация, сортировка и ограничение
#1.
UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at = '' AND updated_at = '';
#2.
SELECT name, DATE_FORMAT(created_at, '%d.%m.%Y %H:%i') created_at, DATE_FORMAT(updated_at, '%d.%m.%Y %H:%i') updated_at FROM users;
#3.
SELECT value FROM storehouses_products ORDER BY value;
#4.
SELECT name, birthday_at  FROM users WHERE birthday_at RLIKE '%may%|%august%';

#Агрегация данных
#1.
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age_avg FROM users;
#2.
SELECT COUNT(*),DATE_FORMAT(CONCAT(DATE_FORMAT(NOW(), '%Y-'),SUBSTRING("2017-06-15",6,10)), '%W') AS birthday_week FROM users GROUP BY birthday_week ORDER BY birthday_week;
#3.
SELECT exp(SUM(log(value))) as multiply product FROM table;