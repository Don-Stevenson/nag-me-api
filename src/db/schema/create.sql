DROP TABLE IF EXISTS nags;
DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  email text UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY NOT NULL,
  goal_name VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
  cron VARCHAR(255),
  friend_1_phone_number VARCHAR(15) NOT NULL,
  friend_2_phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE nags (
  id SERIAL PRIMARY KEY NOT NULL,
  goal_id INTEGER NOT NULL REFERENCES goals(id) ON DELETE CASCADE,
  nag_name VARCHAR(255) NOT NULL,
  completion BOOLEAN,
  date DATE,
  time TIME
);