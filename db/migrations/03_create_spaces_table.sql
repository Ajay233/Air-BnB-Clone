CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  name varchar(60) UNIQUE,
  description varchar(300),
  date_available date,
  booked boolean,
  owner_id integer REFERENCES users (id),
  booker_id integer REFERENCES users (id),
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
