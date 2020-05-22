CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
USE yeticave;

CREATE TABLE category
(
  id int PRIMARY KEY auto_increment,
  name VARCHAR(255),
  code VARCHAR(30)
);

CREATE TABLE lot
(
  id int PRIMARY KEY auto_increment,
  creation_date DATETIME,
  name VARCHAR(255),
  description VARCHAR(1000),
  image VARCHAR(255),
  start_price NUMERIC(12,2),
  expiration_date DATETIME,
  bid_step NUMERIC(6,2),
  author_id int NOT NULL,
  winner_id int NOT NULL,
  category_id int NOT NULL
  );

CREATE TABLE bid
(
  id int PRIMARY KEY auto_increment,
  bid_date DATETIME,
  bid_amount NUMERIC(12,2),
  user_id int NOT NULL
);

CREATE TABLE t_user
(
  id int PRIMARY KEY auto_increment,
  reg_date DATETIME,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  password CHAR(60),
  contacts VARCHAR(1000)
);
