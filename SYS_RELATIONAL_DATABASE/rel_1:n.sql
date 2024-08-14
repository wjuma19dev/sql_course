-- Active: 1723303958993@@127.0.0.1@3306@sql_course
CREATE TABLE companies (
  company_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(60)
);
describe companies;

ALTER TABLE users
ADD COLUMN company_id INT;

describe users;

ALTER TABLE users
ADD constraint fk_company_id 
FOREIGN KEY (company_id) REFERENCES companies (company_id);