CREATE DATABASE sql_course;
USE sql_course;
create table users (
  user_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(60),
  email VARCHAR(60),
  password VARCHAR(60),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SHOW TABLES;
DESCRIBE users;
INSERT INTO users (username, email) VALUES
('maria', 'maria@gmail.com'),
('pedro', 'pedro@gmail.com');
SELECT * FROM users;
CREATE TABLE dni (
  dni_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id int,
  dni_number VARCHAR(11),
  UNIQUE(dni_number, user_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO dni (user_id, dni_number) VALUES
(1, '45212344445'),
(2, '09700244445');
SELECT * FROM dni;