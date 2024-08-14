-- Active: 1723303958993@@127.0.0.1@3306@blog
-- select * from users where email LIKE '%.com%'
-- select * from users WHERE NOT email="juan@test.com"
-- select * from users WHERE NOT email="juan@test.com" AND age=20
-- SELECT * FROM users LIMIT 3
-- insert INTO users (name, email, password, age, init_date) VALUES ('adriana', NULL, 'adriana@test.do', 30, '2008-03-23'),
-- ('michelle', NULL, 'michelle@test.do', 8, '2018-05-19'),
-- ('samuel', NULL, 'samuel@test.do', 33, '2018-05-19'),
-- ('dereck', NULL, 'dereck@test.do', 33, '2008-03-23'),
-- ('cristian', NULL, 'cristian@test.do', 8, '2018-05-19')
-- SELECT * FROM users WHERE email IS NOT NULL AND email LIKE '%.com%'
-- SELECT MAX(age) from users
-- SELECT MIN(age) from users
-- SELECT AVG(age) from users
-- select * from users where name in ('dereck', 'samuel');
-- select * from users where age BETWEEN 23 and 40
-- select name, init_date as "Fecha Inicio Programacion" from users where age BETWEEN 23 and 40
-- SELECT CONCAT(name, ' ', init_date) AS "nombre_fecha" FROM users

-- SELECT * FROM users ORDER BY age

/**
* IF ELSE en forma de CASE
*/
-- SELECT *, 
-- CASE 
--   WHEN age > 18 THEN 'Es mayor de edad'
--   WHEN age = 18 THEN 'Es de edad exacta'
--   ELSE 'Es menor de edad'
-- END AS age_status
-- FROM users ORDER BY age ASC
-- SELECT name, email, age, IFNULL(email, "Sin correo") AS email FROM users

-- INSERT INTO users (id, name, email, password) 
-- VALUES (20, 'Stephen', 'stephen@test.net', 'stephen123456');

-- SELECT * FROM users;

-- CREATE TABLE  movies (
--   title VARCHAR(100),
--   year VARCHAR(100),
--   director VARCHAR(50),
--   genre VARCHAR(20),
--   rating VARCHAR(100)
-- );

-- insert into movies (title, year, director, genre) values 
-- ('Ninja Turtles Caos Mutante', '2024', 'Micah Abbey', 'Comedia'),
-- ('Lupin III Vs. Ojo de Gato', '2023', 'Kanichi Kurita', 'Aventura'),
-- ('Vi el Brillo del Televisor', '2024', 'Justice Smith', 'Terror'),
-- ('The Good Doctor', '2024', 'Freddie Highmore', 'Drama'),
-- ('Misiones Cruzadas', '2024', 'Gang Mu', 'Accion');
-- update movies set init_date='2023-12-01' where movie_id=1;
-- select * from movies;

-- Eliminar una base de datos.
-- drop DATABASE tienda;

-- TABLE COMMANDS
-- CREATE DATABASE IF NOT EXISTS movies;
-- show DATABASES;
-- select * from movies;
-- use blog;

-- DROP DATABASE movies;

-- DESCRIBE categories;

-- Restrincciones al momento de crear una tabla
-- use store;
-- CREATE TABLE employees_departments (
--   name VARCHAR(100) NOT NULL,
--   role VARCHAR(50) NOT NULL,
--   employee_id INT,
--   department_id INT NOT NULL,
--   create_at TIMESTAMP,
--   UNIQUE(employee_id, department_id)
-- );

-- NO FUNCIONA, REVISAR
-- ALTER TABLE employees_departments ADD UNIQUE INDEX 'employee_id_UNIQUE'('employee_id'  ASC) VISIBLE;


-- CREATE INDEX department_id_UNIQUE ON employees_departments(department_id);

-- DROP INDEX employee_id;


ALTER TABLE employees
-- MODIFY COLUMN role_id int;
--   age INT,
--   employee_id INT NOT NULL,
--   department_id INT NOT NULL,
--   create_at TIMESTAMP,
--   UNIQUE(employee_id, department_id),
--   CHECK(age >= 18)
-- );

--# modify column and set default values
-- ALTER TABLE employees MODIFY COLUMN create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP();

-- INSERT INTO employees_departments (id, name, employee_id, department_id) VALUES
-- (2,'martha', '12', '2');

--# RENAME COLUMN
-- ALTER TABLE employees_departments RENAME COLUMN usrename TO username;

--# ADD COLUMN
-- ALTER TABLE employees_departments 
-- ADD COLUMN age INT(3) NOT NULL;

--# DELETE COLUMN
-- ALTER TABLE employees_departments 
-- DROP COLUMN age;


-- INSERT INTO employees_departments (username, department_id) VALUES
-- ('juan', '2'),
-- ('pedro', '1');
