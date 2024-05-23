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
    CONSTRAINT stock_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE barcode (
    barcode_ean char(13) NOT NULL PRIMARY KEY,
    item_id INT NOT NULL,
    INDEX(item_id),
    CONSTRAINT barcode_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE orderinfo (
    orderinfo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    date_placed date NOT NULL,
    date_shipped date,
    shipping decimal(7,2),
    INDEX(customer_id),
    CONSTRAINT orderinfo_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id)

);

CREATE TABLE orderline (
    orderinfo_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity TINYINT,
    PRIMARY KEY (orderinfo_id, item_id),
    CONSTRAINT orderline_orderinfo_id_fk FOREIGN KEY (orderinfo_id) REFERENCES orderinfo(orderinfo_id),
    CONSTRAINT item_item_id_fk FOREIGN KEY (item_id) REFERENCES item(item_id)
);




