CREATE VIEW v_nvidia_employees AS
SELECT user_id, username, email
FROM users
WHERE company_id = 6;


select * from v_nvidia_employees;

DROP VIEW v_nvidia_employees;