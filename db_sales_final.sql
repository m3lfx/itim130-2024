DROP DATABASE IF EXISTS db_sales_final2024_s;
CREATE DATABASE db_sales_final2024_s;
USE db_sales_final2024_s;

CREATE TABLE customer (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title char(4),
    fname varchar(32),
    lname varchar(32) NOT NULL,
    addressline TINYTEXT,
    town varchar(32),
    zipcode char(10),
    phone varchar(16)
);

CREATE TABLE item (
    item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description varchar(64) NOT NULL,
    cost_price decimal(7,2),
    sell_price decimal(5,2)
);

CREATE TABLE orderinfo (
    orderinfo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_placed DATE NOT NULL,
    date_shipped DATE,
    shipping numeric(7,2),
    INDEX(customer_id),
    CONSTRAINT orderinfo_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE orderline (
    orderinfo_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity TINYINT,
    PRIMARY KEY(orderinfo_id, item_id),
    CONSTRAINT orderline_orderinfo_id_fk FOREIGN KEY (orderinfo_id) REFERENCES orderinfo(orderinfo_id) ON DELETE CASCADE,
    CONSTRAINT item_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

CREATE TABLE stock (
    item_id INT NOT NULL PRIMARY KEY,
    quantity TINYINT,
    CONSTRAINT stock_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

CREATE TABLE barcode (
    barcode_ean char(13) NOT NULL PRIMARY KEY,
    item_id INT NOT NULL,
    INDEX(item_id),
    CONSTRAINT barcode_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

INSERT INTO item (description, cost_price, sell_price) VALUES('watch', 100, 200);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 10);
INSERT INTO item (description, cost_price, sell_price) VALUES('panyo', 10, 40);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 5);

INSERT INTO item (description, cost_price, sell_price) VALUES('computer', 1000, 2000);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 20);
INSERT INTO item (description, cost_price, sell_price) VALUES('monitor', 10, 40);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 50);

INSERT INTO item (description, cost_price, sell_price) VALUES('mouse', 50, 70);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 60);

INSERT INTO item (description, cost_price, sell_price) VALUES('keyboard', 70, 80);
INSERT INTO stock(item_id, quantity) VALUES(last_insert_id(), 80);

--transaction SQL statements
INSERT INTO customer(title, fname, lname, addressline, town, zipcode, phone) VALUES ('mr', 'kirk', 'land', 'blc taguig', 'taguig', '4196', '8389889');
INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping) VALUES (last_insert_id(), now(), now(), 100);

INSERT INTO orderline(orderinfo_id, item_id, quantity) VALUES(last_insert_id(), 1, 1), (last_insert_id(), 2, 1);

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone) VALUES ('mr', 'mustaine', 'dave', 'blc', 'taguig', '4196', '838-9889');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone) VALUES ('mr', 'santos', 'jenniy', 'champaca', 'taguig', '4196', '838-9889');

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone) VALUES ('mr', 'kirk', 'hammett', 'washington', 'taguig', '4196', NULL);

INSERT INTO orderinfo (customer_id, date_placed, date_shipped, shipping) VALUES (1, now(), date_add(now(), INTERVAL 7 DAY), 100);









