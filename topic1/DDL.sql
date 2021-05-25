create database IF NOT EXISTS example;
use example;
create table IF NOT EXISTS users (id INT, name CHAR(10));
-- пререквизит: должен быть настроен .my.cnf, работы с dump выполняются из консоли
\! mysqldump example > example_dump.sql
create database sample;
\! mysql sample < example_dump.sql