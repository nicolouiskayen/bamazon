-- Drops the programming_db if it already exists --
DROP DATABASE IF EXISTS bamazon_db;

-- Created the DB "wizard_schools_db" (only works on local connections)
CREATE DATABASE bamazon_db;

-- Use the DB wizard_schools_db for all the rest of the script
USE bamazon_db;

-- Created the table "schools"
CREATE TABLE products (
  id int AUTO_INCREMENT NOT NULL,
  product_name varchar(30) NOT NULL,
  department_name varchar(30) NOT NULL,
  price DECIMAL(10,4) NOT NULL,
  stock_quantity DECIMAL(10,4) NOT NULL,
  PRIMARY KEY(id)
);

-- Inserted a set of records into the table
INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Strawberries", "Produce", 4, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Crackers", "Snacks", 3, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Artichoke", "Produce", 5, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Peaches", "Produce", 1, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sandwiches", "Deli", 7, 20);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Muffins", "Snacks", 2, 15);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Cheddar", "Deli", 1, 30);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Cookies", "Snacks", 1, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Apples", "Produce", 2, 10);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Ham", "Deli", 4, 8);
