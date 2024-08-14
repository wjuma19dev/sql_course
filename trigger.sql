CREATE TABLE IF NOT EXISTS email_history (
  email_history_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  email_address TEXT
);


DELIMITER $$
CREATE TRIGGER TG_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
  IF NEW.email <> OLD.email THEN
    INSERT INTO email_history (user_id, email_address) VALUES (OLD.user_id, OLD.email);
  END IF;
END;
$$ ;

DROP TRIGGER TG_email;