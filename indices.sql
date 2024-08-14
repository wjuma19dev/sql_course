describe users;

CREATE INDEX idx_username ON users(username);
-- OR
CREATE UNIQUE INDEX idx_username ON users(username);

DROP INDEX idx_username ON users;

CREATE INDEX idx_username_email ON users(username, email);

DROP INDEX idx_username_email ON users;