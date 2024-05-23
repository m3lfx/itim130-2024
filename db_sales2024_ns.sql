CREATE DATABASE db_sales2024_ns;
use db_sales2024_ns;

CREATE TABLE customer (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title char(4),
    fname varchar(32),
    lname varchar(32), NOT NULL,
    addressline TEXT,
    town varchar(32),
    zipcode char(10),
    phone varchar(16),
);


