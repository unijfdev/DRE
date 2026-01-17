DROP TABLE IF EXISTS trash_table;

CREATE TABLE IF NOT EXISTS trash_table (
    id SERIAL PRIMARY KEY,
    message VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO trash_table (message) VALUES
('This is a template form a .sql database script');