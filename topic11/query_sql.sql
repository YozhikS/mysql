# задание 1
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id SERIAL,
  table_name VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(255)
)  ENGINE=ARCHIVE;

DELIMITER //
DROP TRIGGER IF EXISTS add_users_to_logs;
CREATE TRIGGER add_users_to_logs BEFORE INSERT ON users
FOR EACH ROW
begin
	INSERT INTO logs 
	  (table_name, name)
	values ("users", NEW.name);
end//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS add_catalogs_to_logs;
CREATE TRIGGER add_catalogs_to_logs BEFORE INSERT ON catalogs
FOR EACH ROW
begin
	INSERT INTO logs 
	  (table_name, name)
	values ("catalogs", NEW.name);
end//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS add_products_to_logs;
CREATE TRIGGER add_products_to_logs BEFORE INSERT ON products
FOR EACH ROW
begin
	INSERT INTO logs 
	  (table_name, name)
	values ("products", NEW.name);
end//
DELIMITER ;

INSERT INTO products
  (name, description, price, catalog_id)
values ("бугагага", "что-то там", 54125.00, 1);
select * from logs;