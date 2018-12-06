ALTER TABLE requests
  ADD space_name VARCHAR(60),
      space_description VARCHAR(300),
      requested_date date,
      owner_id int4,
      price int
;
