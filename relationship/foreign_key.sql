-- Active: 1723549151109@@127.0.0.1@3306@sql_course
-- show tables

-- DROP TABLE employees;

--### RENAME TABLE
-- RENAME TABLE employees_departments TO employees;

-- ALTER TABLE employees RENAME COLUMN role TO role_id;

-- UPDATE employees SET role_id=NULL;  


-- ALTER TABLE employees
-- MODIFY COLUMN role_id int;

-- show tables;
-- describe employees

-- alter table employees add CONSTRAINT role_id_FK;


-- drop table roles


-- CREATE TABLE roles (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(11) NOT NULL,
--   employees_id int,
--   UNIQUE(id), 
--   FOREIGN KEY(employees_id) REFERENCES employees (id)  
-- );

-- select * from roles;
-- select * from employees;



-- update employees set role_id=1 where id=2;


-- drop table roles;

-- show tables;
-- alter table employees 
-- RENAME COLUMN role_id to role;

-- describe employees;


-- CREATE TABLE roles (
--   role_id INT AUTO_INCREMENT PRIMARY KEY,
--   role_name VARCHAR(11) NOT NULL,
--   UNIQUE(role_id)
-- );
-- show tables;
-- describe roles;

-- alter table roles 
-- add column employe_id int;

-- alter table roles 
-- rename column employees_id to employee_id;

-- alter table roles
-- add CONSTRAINT role_id_fk 
-- FOREIGN KEY (employee_id) 
-- REFERENCES employees(id);


-- create table companies (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(100) NOT NULL
-- );


-- insert into companies (name) VALUES
-- ('verizon'),
-- ('viva'),
-- ('altice');

-- alter table companies
-- rename column id to company_id;

-- select * from companies;

-- describe companies;

-- describe employees;

-- alter table employees
-- UPDATE column company_id int;


-- ALTER TABLE employees
-- ADD CONSTRAINT company_id_fk 
-- FOREIGN KEY (company_id) REFERENCES companies(company_id);


--### RELACION N:N


-- INSERT INTO companies (
--   name
-- ) VALUES (
--   'macdonalds'
-- )


-- INSERT INTO users (
--   user_id,
--   username,
--   email,
--   password,
--   company_id
-- ) VALUES (
--   2,
--   'michale jordan',
--   'michale_jordan@gmail.com',
--   'password123',
--   6
-- );

# REVIEW The simple way would be to disable the foreign key check; make the changes then re-enable foreign key check.
-- SET FOREIGN_KEY_CHECKS=0;  -- to disable them
-- SET FOREIGN_KEY_CHECKS=1; -- to re-enable them
--  delete from users where user_id=2;

-- CREATE TABLE languages (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   language_name VARCHAR(50) UNIQUE NOT NULL
-- );

-- INSERT INTO languages (
--   language_name
-- ) VALUES (
--   'rust'
-- )

-- CREATE TABLE users_languages (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   language_id INT UNIQUE,
--   user_id INT UNIQUE,
--   CONSTRAINT FK_language
--   FOREIGN KEY (language_id) REFERENCES languages(id),
--   CONSTRAINT FK_user
--   FOREIGN KEY (user_id) REFERENCES users(user_id)
-- );

-- alter table users_languages
-- rename column users_id to user_id; 

# REVIEW REMOVE FOREIGN KEY
-- alter table users_languages
-- drop FOREIGN KEY fk_user;

-- alter table users_languages
-- add CONSTRAINT FK_user
--   FOREIGN KEY (user_id) REFERENCES users(user_id)

-- INSERT INTO users_languages (
--   user_id, 
--   language_id
-- ) VALUES (
--   10,
--   3
-- );


# REVIEW REMOVE UNIQUE KEY AND FOREIGN KEY
-- FIRST SET 
-- set FOREIGN_KEY_CHECKS=0;
-- set FOREIGN_KEY_CHECKS=1;
-- ALTER TABLE users_languages DROP KEY users_id;
-- ALTER TABLE users_languages DROP KEY language_id;

-- ALTER TABLE users_languages
-- DROP FOREIGN KEY FK_user;

-- ALTER TABLE users_languages
-- DROP FOREIGN KEY FK_language;
-- ALTER TABLE users_languages DROP KEY users_id;
-- ALTER TABLE users_languages DROP KEY language_id;

-- ALTER TABLE users_languages
-- DROP FOREIGN KEY FK_user;

-- ALTER TABLE users_languages
-- DROP FOREIGN KEY FK_language;


-- ALTER TABLE users_languages
-- MODIFY COLUMN 
--   language_id INT NOT NULL,
-- MODIFY COLUMN 
--   user_id INT NOT NULL

-- ALTER TABLE users_languages
-- ADD
--   -- CONSTRAINT FK_user
--   -- FOREIGN KEY(user_id) REFERENCES users(user_id);
--   CONSTRAINT FK_language
--   FOREIGN KEY(language_id) REFERENCES languages(id);




-- select * from users_languages
--   JOIN users
--     ON users.user_id = users_languages.user_id
--   JOIN languages
--     ON languages.id = users_languages.language_id
-- ;

-- select * from users
--   JOIN users_languages
--     ON users.user_id = users_languages.user_id
--   JOIN languages
--     ON languages.id = users_languages.language_id
-- ;

-- select * from users
--   LEFT JOIN users_languages
--     ON users.user_id = users_languages.user_id
--   JOIN languages
--     ON languages.id = users_languages.language_id
-- ;


-- SELECT username, dni_number FROM users 
--   LEFT JOIN dni 
--     on dni.user_id = users.user_id;

-- SELECT username, dni_number FROM dni
--   RIGHT JOIN users
--     on dni.user_id = users.user_id;



-- SELECT * FROM users
--   FULL JOIN dni 
--     ON users.user_id = dni.user_id;