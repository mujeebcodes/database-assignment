create database inventory;
use inventory;

-- a. creation of all the entities
CREATE TABLE user (
    id INT PRIMARY KEY,
    username VARCHAR(255),
    user_type VARCHAR(255)
);


CREATE TABLE category (
    id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE item (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    size ENUM('Small', 'Medium', 'Large'),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    item_id INT,
    order_status VARCHAR(255),
    order_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

-- b. Show commands for inserting records into the entities

INSERT INTO user (id, username, user_type) VALUES (1, 'Mujeeb', 'Admin');
INSERT INTO user (id, username, user_type) VALUES (2, 'Daniel', 'Regular User');
INSERT INTO user (id, username, user_type) VALUES (3, 'Jonas', 'Regular User');

INSERT INTO category (id, category_name) VALUES (1, 'Electronics');
INSERT INTO category (id, category_name) VALUES (2, 'Clothing');

INSERT INTO item (id, name, price, size, category_id) VALUES (1, 'Laptop', 999.99, 'Medium', 1);
INSERT INTO item (id, name, price, size, category_id) VALUES (2, 'T-shirt', 19.99, 'Large', 2);

INSERT INTO orders (id, user_id, item_id, order_status, order_date) VALUES (1, 2, 1, 'Pending', '2023-08-01 14:30:15');
INSERT INTO orders (id, user_id, item_id, order_status, order_date) VALUES (2, 2, 2, 'Approved', '2023-09-01 19:30:35');
INSERT INTO orders (id, user_id, item_id, order_status, order_date) VALUES (3, 2, 2, 'Rejected', '2023-09-02 19:37:18');

-- c. Show commands for getting records from two or more entities

SELECT user.username, item.name FROM user JOIN orders ON user.id = orders.user_id JOIN item ON orders.item_id = item.id;

-- d. Show commands for updating records from two or more entities

UPDATE orders SET order_status = 'Approved' WHERE user_id = 2 AND item_id = 1;
UPDATE user SET username= 'Adesoji' WHERE id = 2;

-- e. Show commands for deleting records from two or more entities

DELETE FROM orders WHERE order_status = 'Rejected';
DELETE FROM user WHERE id = 3;