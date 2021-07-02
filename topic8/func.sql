# задание 1.1
START TRANSACTION;
INSERT INTO sample.users (id, name) SELECT id, name FROM shop.users WHERE id = 1;
delete from shop.users WHERE id = 1;
COMMIT;

# задание 1.2
CREATE VIEW products_cotolog_vw AS select p.name as product_name, c.name as catalog_name from products p join catalogs c on p.catalog_id = c.id;

# задание 2.1
CREATE USER shop_read IDENTIFIED WITH sha256_password BY 'pass_easy';
GRANT usage,select ON shop.* TO 'shop_read'@'%';
CREATE USER shop IDENTIFIED WITH sha256_password BY 'pass_hard';
GRANT ALL ON shop.* TO 'shop'@'%';

# задание 3.1
DELIMITER //
DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello ()
RETURNS VARCHAR(255) DETERMINISTIC
begin
  DECLARE hour_now INT;
  SET hour_now = HOUR(NOW());
  if (hour_now < 6) THEN
    RETURN 'Доброй ночи';
  elseif (hour_now < 12) THEN
    RETURN 'Доброе утро';
  elseif (hour_now < 18) THEN
    RETURN 'Добрый день';
  else 
    RETURN 'Добрый вечер';
  END IF;
end//
DELIMITER ;

select hello();

# задание 3.2
DELIMITER //
DROP TRIGGER IF EXISTS check_name_and_description;
CREATE TRIGGER check_name_and_description BEFORE INSERT ON products
FOR EACH ROW
begin
	IF (NEW.name IS null AND NEW.description IS null) then 
	  SIGNAL SQLSTATE '23000'
	    SET MESSAGE_TEXT = 'Ошибка вставки значения';
	end if;
END//
DELIMITER ;

INSERT INTO products
  (name, description, price, catalog_id)
values (null, null, 54125.00, 1);