# DDL - Create
CREATE DATABASE store;
CREATE TABLE countries(
    code INT PRIMARY KEY,
    nname VARCHAR(20) UNIQUE,
    continent_name VARCHAR(20) not NULL
);

CREATE TABLE users(
    id INT PRIMARY KEY,
    full_name VARCHAR(20),
    email VARCHAR(20) UNIQUE,
    gender CHAR(1),
    data_of_birth VARCHAR(15),
    created_at DATETIME default (CURRENT_TIMESTAMP()),
    country_code INT,
    CHECK(gender in ('m','f')),
    FOREIGN KEY (country_code) REFERENCES countries(code)
);

CREATE TABLE products(
    id int PRIMARY KEY,
    nname VARCHAR(10) NOT NULL ,
    price INT DEFAULT 0,
    sstatus VARCHAR(10),
    created_at DATETIME default (CURRENT_TIMESTAMP()),
    check(sstatus in('valid','expired'))

);

CREATE TABLE orders(
    id int PRIMARY KEY,
    user_idd int,
    FOREIGN KEY (user_idd) REFERENCES users(id),
    status VARCHAR(6),
    created_at DATETIME default (CURRENT_TIMESTAMP()),
    check(status in ('start','finish'))
    
);

CREATE TABLE order_products(
    order_id int ,
    product_id int ,
    quanitity int default 0 ,
    PRIMARY KEY(order_id,product_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

# DML - Insert
INSERT INTO countries VALUES(966,"saudi","test");
INSERT INTO users(id,full_name,email,gender,data_of_birth,country_code) VALUES(1,"rayan ahmed","sdjnh@gmail.com","m","1997-9-12",966);
INSERT INTO orders(id,user_idd,status) VALUES(782,1,"finish");
INSERT INTO products(id,nname,price,sstatus) VALUES(87897,"iphone",5000,"valid");
INSERT INTO order_products VALUES(782,87897,1);

# DML - Update
UPDATE countries
set nname="Saudi Arabia"
WHERE code=966;

# DQL - Select
select * FROM countries;
select * FROM users;
select * FROM orders;
select * FROM products;
select * FROM order_products;

# DML - Delete
DELETE FROM products
where id=87897
