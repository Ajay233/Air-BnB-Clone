CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username varchar(60) UNIQUE,
  email varchar(120) UNIQUE,
  password varchar(60),
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
