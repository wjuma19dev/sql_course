DELIMITER $$
CREATE PROCEDURE p_find_company_users (IN company_id_params int)
BEGIN
  SELECT * FROM users WHERE company_id = company_id_params;
END;
$$

CALL p_find_company_users(9);

DROP PROCEDURE p_find_company_users;
