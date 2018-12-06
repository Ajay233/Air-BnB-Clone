CREATE TABLE requests (
  id SERIAL PRIMARY KEY,
  space_id integer REFERENCES spaces (id),
  approval_status varchar(8),
  requester_id integer REFERENCES users (id),
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
