USE yeticave;

INSERT INTO category (name, code) VALUES ('Доски и лыжи', 'boards');
INSERT INTO category (name, code) VALUES ('Крепления', 'attachment');
INSERT INTO category (name, code) VALUES ('Ботинки', 'boots');
INSERT INTO category (name, code) VALUES ('Одежда', 'clothing');
INSERT INTO category (name, code) VALUES ('Инструменты', 'tools');
INSERT INTO category (name, code) VALUES ('Разное', 'other');

INSERT INTO user (email, name, password, contacts) VALUES ('sasha@mail.ru', 'Sasha', '$2y$10$LrtJ2ER3TVntpJGKczkbWeu4X8mzCyqzNi8/zuaqXEBZ/sdQiRElW', '123-45-67');
INSERT INTO user (email, name, password, contacts) VALUES ('masha@mail.ru', 'Masha', '$2y$10$NmIYEJ3MJ5654H4IskMqKOme4M5IP4/VdgWEi20ePGivIQ4M6ICsm', '123-45-68');
INSERT INTO user (email, name, password, contacts) VALUES ('lesha@mail.ru', 'Lesha', '$2y$10$PCNY.u2I6lbYfJ.ospF4QuozaIFBeUivmt5fg/HGWjxIe6qWt4e6u', '123-45-69');

INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2020-06-01 00:00:00', 100, 1, 1, '2020-05-24 12:00:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', 159999, '2020-06-02 00:00:00', 200, 2, 1, '2020-05-24 12:23:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', 8000, '2020-05-29 00:00:00', 100, 3, 2, '2020-05-24 12:10:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', 10999, '2020-05-30 00:00:00', 150, 2, 3, '2020-05-24 12:15:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', 7500, '2020-05-31 00:00:00', 250, 1, 4, '2020-05-24 12:20:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('Маска Oakley Canopy', 'img/lot-6.jpg', 5400, '2020-06-05 00:00:00', 150, 2, 6, '2020-05-24 12:25:00');
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id, creation_date) VALUES ('Сноуборд GNU MONEY C2E', 'img/lot-7.jpg', 20990, '2020-06-07 00:00:00', 150, 2, 1, '2020-05-27 14:25:00');

INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (12000, 1, 1, '2020-05-24 13:00:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (9500, 2, 3, '2020-05-24 13:01:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (13000, 2, 1, '2020-05-24 13:02:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (10000, 1, 5, '2020-05-24 13:03:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (11000, 2, 5, '2020-05-24 13:04:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (8000, 2, 6, '2020-05-24 13:05:00');
INSERT INTO bid (bid_amount, user_id, lot_id, bid_date) VALUES (8500, 3, 6, '2020-05-24 13:06:00');

/*получить все категории;*/
SELECT * FROM category ORDER BY name;
/*получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, текущую цену, название категории;*/
SELECT L.name, start_price, image, C.name, (SELECT bid_amount FROM bid WHERE lot_id=L.id ORDER BY bid_date DESC LIMIT 1) last_bid FROM lot L JOIN category C ON L.category_id = C.id WHERE expiration_date >= CURRENT_TIMESTAMP ORDER BY creation_date DESC  LIMIT 3;
/*показать лот по его id. Получите также название категории, к которой принадлежит лот;*/
SELECT L.name, image, start_price, expiration_date, C.name FROM lot L JOIN category C ON L.category_id=C.id WHERE L.id=1 ORDER BY L.name;
/*обновить название лота по его идентификатору;*/
UPDATE lot SET name='Самый глупый способ потратить 160к рублей' WHERE id=2;
/*получить список ставок для лота по его идентификатору с сортировкой по дате.*/
SELECT L.name, B.bid_amount, B.bid_date FROM lot L JOIN bid B ON B.lot_id=L.id WHERE L.id=1 ORDER BY B.bid_date;
/* то же самое без имени лота*/
SELECT bid_amount, bid_date FROM bid WHERE lot_id=1 ORDER BY bid_date;