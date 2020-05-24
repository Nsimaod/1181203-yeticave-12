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

INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2020-06-01 00:00:00', 100, 1, 1);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', 159999, '2020-06-02 00:00:00', 200, 2, 1);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', 8000, '2020-05-29 00:00:00', 100, 3, 2);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', 10999, '2020-05-30 00:00:00', 150, 2, 3);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', 7500, '2020-05-31 00:00:00', 250, 1, 4);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('Маска Oakley Canopy', 'img/lot-6.jpg', 5400, '2020-06-05 00:00:00', 150, 2, 6);
