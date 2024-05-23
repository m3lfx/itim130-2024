CREATE DATABASE db_sales_final2024-s;
USE db_sales_final2024;

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
    cost_price decimal(5,2)
);

