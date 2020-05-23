CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
USE yeticave;

/* CREATE TABLE category
(
  id int PRIMARY KEY auto_increment,
  name VARCHAR(255),
  code VARCHAR(30),
);
 */
 CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* CREATE TABLE lot
(
  id int PRIMARY KEY auto_increment,
  creation_date DATETIME,
  name VARCHAR(255),
  description VARCHAR(1000),
  image VARCHAR(255),
  start_price DECIMAL(12,2) NOT NULL,
  expiration_date DATETIME NOT NULL,
  bid_step DECIMAL(6,2),
  author_id int NOT NULL,
  winner_id int NOT NULL,
  category_id int NOT NULL
  );
 */
 CREATE TABLE `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_price` decimal(12,2) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `bid_step` decimal(6,2) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lot_by_date` (`creation_date`),
  KEY `lot_by_exp` (`expiration_date`),
  KEY `lot_by_name` (`name`),
  KEY `lot_by_author` (`author_id`),
  KEY `lot_by_winner` (`winner_id`),
  KEY `lot_by_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
/* CREATE TABLE bid
(
  id int PRIMARY KEY auto_increment,
  bid_date DATETIME,
  bid_amount DECIMAL(12,2),
  user_id int NOT NULL,
  lot_id int NOT NULL
);
 */
CREATE TABLE `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_date` datetime DEFAULT NULL,
  `bid_amount` decimal(12,2) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid_by_date` (`bid_date`),
  KEY `bid_by_bidder` (`user_id`),
  KEY `bid_by_lot` (`lot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* CREATE TABLE user */
/* ( */
  /* id int PRIMARY KEY auto_increment, */
  /* reg_date DATETIME, */
  /* email VARCHAR(255) NOT NULL UNIQUE, */
  /* name VARCHAR(255) NOT NULL, */
  /* password CHAR(60) NOT NULL, */
  /* contacts VARCHAR(1000) NOT NULL */
/* ); */
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `contacts` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_by_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

