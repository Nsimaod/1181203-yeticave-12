USE yeticave;

INSERT INTO category (name, code) VALUES ('����� � ����', 'boards');
INSERT INTO category (name, code) VALUES ('���������', 'attachment');
INSERT INTO category (name, code) VALUES ('�������', 'boots');
INSERT INTO category (name, code) VALUES ('������', 'clothing');
INSERT INTO category (name, code) VALUES ('�����������', 'tools');
INSERT INTO category (name, code) VALUES ('������', 'other');

INSERT INTO user (email, name, password, contacts) VALUES ('sasha@mail.ru', 'Sasha', '$2y$10$LrtJ2ER3TVntpJGKczkbWeu4X8mzCyqzNi8/zuaqXEBZ/sdQiRElW', '123-45-67');
INSERT INTO user (email, name, password, contacts) VALUES ('masha@mail.ru', 'Masha', '$2y$10$NmIYEJ3MJ5654H4IskMqKOme4M5IP4/VdgWEi20ePGivIQ4M6ICsm', '123-45-68');
INSERT INTO user (email, name, password, contacts) VALUES ('lesha@mail.ru', 'Lesha', '$2y$10$PCNY.u2I6lbYfJ.ospF4QuozaIFBeUivmt5fg/HGWjxIe6qWt4e6u', '123-45-69');

INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2020-06-01 00:00:00', 100, 1, 1);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', 159999, '2020-06-02 00:00:00', 200, 2, 1);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('��������� Union Contact Pro 2015 ���� ������ L/XL', 'img/lot-3.jpg', 8000, '2020-05-29 00:00:00', 100, 3, 2);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('������� ��� ��������� DC Mutiny Charocal', 'img/lot-4.jpg', 10999, '2020-05-30 00:00:00', 150, 2, 3);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('������ ��� ��������� DC Mutiny Charocal', 'img/lot-5.jpg', 7500, '2020-05-31 00:00:00', 250, 1, 4);
INSERT INTO lot (name, image, start_price, expiration_date, bid_step, author_id, category_id) VALUES ('����� Oakley Canopy', 'img/lot-6.jpg', 5400, '2020-06-05 00:00:00', 150, 2, 6);

INSERT INTO bid (bid_amount, user_id, lot_id) VALUES (12000, 1, 1);
INSERT INTO bid (bid_amount, user_id, lot_id) VALUES (9500, 2, 3);
INSERT INTO bid (bid_amount, user_id, lot_id) VALUES (13000, 2, 1);
INSERT INTO bid (bid_amount, user_id, lot_id) VALUES (10000, 1, 5);
INSERT INTO bid (bid_amount, user_id, lot_id) VALUES (11000, 3, 5);

SELECT * FROM category ORDER BY name;
/* ������ creation_date ����� ������� */
SELECT L.name, start_price, image, creation_date, C.name FROM lot L JOIN category C ON L.category_id = C.id WHERE expiration_date >= CURRENT_TIMESTAMP ORDER BY creation_date DESC  LIMIT 3;
SELECT L.name, start_price, image, creation_date, C.name, (SELECT bid_amount FROM bid WHERE lot_id=L.id ORDER BY bid_date DESC LIMIT 1) FROM lot L JOIN category C ON L.category_id = C.id WHERE expiration_date >= CURRENT_TIMESTAMP ORDER BY creation_date DESC  LIMIT 3;
SELECT bid_amount FROM bid WHERE lot_id=1 ORDER BY bid_date DESC LIMIT 1;