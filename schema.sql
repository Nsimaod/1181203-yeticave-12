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
  start_price NUMERIC(12,2) NOT NULL,
  expiration_date DATETIME NOT NULL,
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
  user_id int NOT NULL,
  lot_id int NOT NULL
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

CREATE INDEX i_lot_by_date ON lot(creation_date);
CREATE INDEX i_lot_by_exp ON lot(expiration_date);
CREATE INDEX i_lot_by_name ON lot(name);
CREATE INDEX i_lot_by_author ON lot(author_id);
CREATE INDEX i_lot_by_winner ON lot(winner_id);
CREATE INDEX i_lot_by_category ON lot(category_id);
CREATE INDEX i_bid_by_date ON bid(bid_date);
CREATE INDEX i_bid_by_bidder ON bid(user_id);
CREATE INDEX i_bid_by_lot ON bid(lot_id);
CREATE INDEX i_user_by_email ON t_user(email);
CREATE INDEX i_user_by_name ON t_user(name);
