CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;
  
USE yeticave;

 CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 CREATE TABLE `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_price` decimal(12,2) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `bid_step` decimal(6,2) NOT NULL,
  `author_id` int(11) NOT NULL,
  `winner_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`creation_date`),
  KEY `exp` (`expiration_date`),
  KEY `name` (`name`),
  KEY `author` (`author_id`),
  KEY `winner` (`winner_id`),
  KEY `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
CREATE TABLE `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `bid_amount` decimal(12,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`bid_date`),
  KEY `bidder` (`user_id`),
  KEY `lot` (`lot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `contacts` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
