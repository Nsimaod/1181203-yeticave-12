-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.30-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных yeticave
CREATE DATABASE IF NOT EXISTS `yeticave` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `yeticave`;

-- Дамп структуры для таблица yeticave.bid
CREATE TABLE IF NOT EXISTS `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid_amount` decimal(12,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`bid_date`),
  KEY `bidder` (`user_id`),
  KEY `lot` (`lot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы yeticave.bid: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` (`id`, `bid_date`, `bid_amount`, `user_id`, `lot_id`) VALUES
	(1, '2020-05-24 13:00:00', 12000.00, 1, 1),
	(2, '2020-05-24 13:01:00', 9500.00, 2, 3),
	(3, '2020-05-24 13:02:00', 13000.00, 2, 1),
	(4, '2020-05-24 13:03:00', 10000.00, 1, 5),
	(5, '2020-05-24 13:04:00', 11000.00, 2, 5),
	(6, '2020-05-24 13:05:00', 8000.00, 2, 6),
	(7, '2020-05-24 13:06:00', 8500.00, 3, 6);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;

-- Дамп структуры для таблица yeticave.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы yeticave.category: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `code`) VALUES
	(1, 'Доски и лыжи', 'boards'),
	(2, 'Крепления', 'attachment'),
	(3, 'Ботинки', 'boots'),
	(4, 'Одежда', 'clothing'),
	(5, 'Инструменты', 'tools'),
	(6, 'Разное', 'other');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Дамп структуры для таблица yeticave.lot
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_price` decimal(12,2) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `bid_step` decimal(6,2) NOT NULL,
  `author_id` int(11) NOT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`creation_date`),
  KEY `exp` (`expiration_date`),
  KEY `name` (`name`),
  KEY `author` (`author_id`),
  KEY `winner` (`winner_id`),
  KEY `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы yeticave.lot: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` (`id`, `creation_date`, `name`, `description`, `image`, `start_price`, `expiration_date`, `bid_step`, `author_id`, `winner_id`, `category_id`) VALUES
	(1, '2020-05-24 12:00:00', '2014 Rossignol District Snowboard', 'Обжаренная куриная котлета, панированная в сухарях, с беконом и свежим салатом на карамелизованной булочке, заправленной специальным соусом «МакЧикен»', 'img/lot-1.jpg', 10999.00, '2020-06-08 00:00:00', 100.00, 1, NULL, 1),
	(2, '2020-05-24 12:23:00', 'DC Ply Mens 2016/2017 Snowboard', 'Чизбургер с беконом – это рубленый бифштекс из натуральной цельной говядины с ломтиком сыра «Чеддер» и двумя ломтиками бекона на карамелизованной булочке, заправленной горчицей, кетчупом, луком и кусочком маринованного огурчика.', 'img/lot-2.jpg', 159999.00, '2020-06-07 00:00:00', 200.00, 2, NULL, 1),
	(3, '2020-05-24 12:10:00', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Вкуснейшее рубленое куриное филе в хрустящей панировке, сыр "Чеддер", ароматный бекон, ломтик помидора, свежий салат, специальный дижонский соус и, конечно, та самая булочка с кунжутом.', 'img/lot-3.jpg', 8000.00, '2020-06-09 00:00:00', 100.00, 3, NULL, 2),
	(4, '2020-05-24 12:15:00', 'Ботинки для сноуборда DC Mutiny Charocal', 'Сандвич с большим, рубленым бифштексом из 100% говядины на большой булочке с кунжутом. Особенный вкус сандвичу придают три кусочка сыра «Эмменталь», два ломтика помидора, свежий салат, лук и пикантный соус «Гриль».', 'img/lot-4.jpg', 10999.00, '2020-06-07 10:00:00', 150.00, 2, NULL, 3),
	(5, '2020-05-24 12:20:00', 'Куртка для сноуборда DC Mutiny Charocal', 'Два бифштекса из сочной рубленной говядины, приготовленных на гриле, с двумя кусочками сыра «Чеддер» на карамелизованной булочке с кунжутом, заправленной горчицей, кетчупом, свежим луком и маринованными огурчиками.', 'img/lot-5.jpg', 7500.00, '2020-06-08 13:00:00', 250.00, 1, NULL, 4),
	(6, '2020-05-24 12:25:00', 'Маска Oakley Canopy', 'Рубленый бифштекс из натуральной цельной говядины с кусочками сыра «Чеддер» на карамелизованной булочке, заправленной горчицей, кетчупом, луком и кусочком маринованного огурчика.', 'img/lot-6.jpg', 5400.00, '2020-06-09 18:00:00', 150.00, 2, NULL, 6),
	(7, '2020-05-27 14:15:45', 'Сноуборд GNU MONEY C2E', 'Два кусочка филе рыбы (семейство тресковых), которые подаются на пышной пропаренной булочке с кусочком сыра «Чеддер». Сандвич заправлен соусом «Тар-Тар».', 'img/lot-7.jpg', 20990.00, '2020-06-07 14:16:32', 150.00, 2, NULL, 1);
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;

-- Дамп структуры для таблица yeticave.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `contacts` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы yeticave.user: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `reg_date`, `email`, `name`, `password`, `contacts`) VALUES
	(1, '2020-05-24 19:13:27', 'sasha@mail.ru', 'Sasha', '$2y$10$LrtJ2ER3TVntpJGKczkbWeu4X8mzCyqzNi8/zuaqXEBZ/sdQiRElW', '123-45-67'),
	(2, '2020-05-24 19:13:27', 'masha@mail.ru', 'Masha', '$2y$10$NmIYEJ3MJ5654H4IskMqKOme4M5IP4/VdgWEi20ePGivIQ4M6ICsm', '123-45-68'),
	(3, '2020-05-24 19:13:27', 'lesha@mail.ru', 'Lesha', '$2y$10$PCNY.u2I6lbYfJ.ospF4QuozaIFBeUivmt5fg/HGWjxIe6qWt4e6u', '123-45-69');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
