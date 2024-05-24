DROP DATABASE IF EXISTS db_sales2024_ns;
CREATE DATABASE db_sales2024_ns;
use db_sales2024_ns;

CREATE TABLE customer (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title char(4),
    fname varchar(32),
    lname varchar(32) NOT NULL,
    addressline TEXT,
    town varchar(32),
    zipcode char(10),
    phone varchar(16)
);

CREATE TABLE item (
    item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    description varchar(200) NOT NULL,
    cost_price decimal(7,2),
    sell_price decimal(7,2)
);

CREATE TABLE stock (
    item_id INT NOT NULL PRIMARY KEY,
    quantity INT,
    CONSTRAINT stock_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

CREATE TABLE barcode (
    barcode_ean char(13) NOT NULL PRIMARY KEY,
    item_id INT NOT NULL,
    INDEX(item_id),
    CONSTRAINT barcode_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id)  ON DELETE CASCADE
);

CREATE TABLE orderinfo (
    orderinfo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_placed date NOT NULL,
    date_shipped date,
    shipping decimal(7,2),
    INDEX(customer_id),
    CONSTRAINT orderinfo_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE

);

CREATE TABLE orderline (
    orderinfo_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity TINYINT,
    PRIMARY KEY (orderinfo_id, item_id),
    CONSTRAINT orderline_orderinfo_id_fk FOREIGN KEY (orderinfo_id) REFERENCES orderinfo(orderinfo_id) ON DELETE CASCADE,
    CONSTRAINT item_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id)  ON DELETE CASCADE
);

INSERT INTO item (description, cost_price, sell_price) VALUES('computer', 2000, 3000);
INSERT INTO stock (item_id, quantity) VALUES (last_insert_id(), 10);

INSERT INTO item (description, cost_price, sell_price) VALUES('laptop', 4000, 5000);
INSERT INTO stock (item_id, quantity) VALUES (last_insert_id(), 8);

INSERT INTO item (description, cost_price, sell_price) VALUES('computer', 2000, 3000);
INSERT INTO stock (item_id, quantity) VALUES (last_insert_id(), 10);

INSERT INTO item (description, cost_price, sell_price) VALUES('power supply', 3000, 4000);
INSERT INTO stock (item_id, quantity) VALUES (last_insert_id(), 9);

INSERT INTO customer (title, fname, lname, addressline, town, zipcode, phone) VALUES('miss', 'jane', 'doe', 'blc taguig', 'taguig city', '1890', '8998776');

INSERT INTO `customer` (`title`, `fname`, `lname`, `addressline`, `town`, `zipcode`, `phone`) VALUES
('Miss', 'Jenny', 'Stones', '27 Rowan Avenue', 'Hightown', 'NT2 1AQ', '023 9876'),
('Mr', 'Andrew', 'Stones', '52 The Willows', 'Lowtown', 'LT5 7RA', '876 3527'),
('Miss', 'Alex', 'Matthew', '4 The Street', 'Nicetown', 'NT2 2TX', '010 4567'),
('Mr', 'Adrian', 'Matthew', 'The Barn', 'Yuleville', 'YV67 2WR', '487 3871'),
('Mr', 'Simon', 'Cozens', '7 Shady Lane', 'Oakenham', 'OA3 6QW', '514 5926'),
('Mr', 'Neil', 'Matthew', '5 Pasture Lane', 'Nicetown', 'NT3 7RT', '267 1232'),
('Mr', 'Richard', 'Stones', '34 Holly Way', 'Bingham', 'BG4 2WE', '342 5982'),
('Mrs', 'Ann', 'Stones', '34 Holly Way', 'Bingham', 'BG4 2WE', '342 5982'),
('Mrs', 'Christine', 'Hickman', '36 Queen Street', 'Histon', 'HT3 5EM', '342 5432'),
('Mr', 'Mike', 'Howard', '86 Dysart Street', 'Tibsville', 'TB3 7FG', '505 5482'),
('Mr', 'Dave', 'Jones', '54 Vale Rise', 'Bingham', 'BG3 8GD', '342 8264'),
('Mr', 'Richard', 'Neill', '42 Thatched Way', 'Winnersby', 'WB3 6GQ', '505 6482'),
('Mrs', 'Laura', 'Hardy', '73 Margarita Way', 'Oxbridge', 'OX2 3HX', '821 2335'),
('Mr', 'Bill', 'O\'Neill', '2 Beamer Street', 'Welltown', 'WT3 8GM', '435 1234'),
('Mr', 'David', 'Hudson', '4 The Square', 'Milltown', 'MT2 6RT', '961 4526');

INSERT INTO `item` (`description`, `cost_price`, `sell_price`) VALUES
('Wood Puzzle', '15.23', '21.95'),
('Rubik Cube', '7.45', '11.49'),
('Linux CD', '1.99', '2.49'),
('Tissues', '2.11', '3.99'),
('Picture Frame', '7.54', '9.95'),
('Fan Small', '9.23', '15.75'),
('Fan Large', '13.36', '19.95'),
('Toothbrush', '0.75', '1.45'),
('Roman Coin', '2.34', '2.45'),
('Carrier Bag', '0.01', '0.00'),
('Speakers', '19.73', '25.32');


INSERT INTO `orderinfo` (`customer_id`, `date_placed`, `date_shipped`, `shipping`) VALUES
(3, now(), now(), '2.99'),
(8, now(), now(), '0.00'),
(15, now(), now(), '3.99'),
(13, now(), now(), '2.99'),
(8, now(), now(), '0.00');


INSERT INTO `orderline` (`orderinfo_id`, `item_id`, `quantity`) VALUES
(1, 4, 1),
(1, 7, 1),
(1, 9, 1),
(2, 1, 1),
(2, 4, 2),
(2, 7, 2),
(2, 10, 1),
(3, 1, 1),
(3, 2, 1),
(4, 5, 2),
(5, 1, 1),
(5, 3, 1);


INSERT INTO `stock` (`item_id`, `quantity`) VALUES
(5, 12),
(6, 2),
(7, 8),
(8, 3),
(9, 8),
(11, 18),
(10, 1);


INSERT INTO `barcode` (`barcode_ean`, `item_id`) VALUES
('6241527836173', 1),
('6241574635234', 2),
('6241527746363', 3),
('6264537836173', 3),
('7465743843764', 4),
('3453458677628', 5),
('6434564564544', 6),
('8476736836876', 7),
('6241234586487', 8),
('9473625532534', 8),
('9473627464543', 8),
('4587263646878', 9),
('2239872376872', 11),
('9879879837489', 11);






