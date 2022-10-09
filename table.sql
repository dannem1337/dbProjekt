USE ht22_1_project_group_26;

-- CREATING THE TABLES

CREATE TABLE Users (
    ssn CHAR(10) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone CHAR(10) NOT NULL,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    newsletter BIT(1) NOT NULL
    PRIMARY KEY(ssn)
);

CREATE TABLE Orders (
    payment_reference VARCHAR(20) NOT NULL,
    ssn CHAR(10) NOT NULL,
    date DATE NOT NULL, -- format: YYYY-MM-DD
    tracking_no VARCHAR(40) NOT NULL,
    date_last_change DATE NOT NULL, -- format: YYYY-MM-DD
    status VARCHAR(255),
    PRIMARY KEY (payment_reference, ssn),
    FOREIGN KEY (ssn) REFERENCES Users(ssn)
);


CREATE TABLE Orders_product (
    product_no INT UNSIGNED NOT NULL,
    ssn CHAR(10) NOT NULL,
    payment_reference VARCHAR(20) NOT NULL,
    PRIMARY KEY(product_no, ssn, payment_reference),
    FOREIGN KEY (payment_reference) REFERENCES Orders(payment_reference),
    FOREIGN KEY (ssn) REFERENCES Users(ssn),
    FOREIGN KEY (product_no) REFERENCES Product(product_no)
);

CREATE TABLE Product (
    product_no INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    price FLOAT,
    vat FLOAT,
    discount FLOAT,
    description VARCHAR(255),
    quantity INT,
    department VARCHAR(255) NOT NULL,
    featured VARCHAR(255), 
    PRIMARY KEY (product_no),
    ADD FOREIGN KEY (deparment) REFERENCES Leaf_department(title),
    ADD FOREIGN KEY(featured) REFERENCES Parent_department(title)
);

CREATE TABLE Parent_department (
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    parent_title VARCHAR(255),
    PRIMARY KEY(title),
    FOREIGN KEY(parent_title) REFERENCES Parent_department(title)
);

CREATE TABLE Leaf_department (
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    parent_title VARCHAR(255) NOT NULL,
    PRIMARY KEY(title),
    FOREIGN KEY(parent_title) REFERENCES Parent_department(title)
);

CREATE TABLE Product_tags (
    product_no INT UNSIGNED NOT NULL,
    tag_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_no, tag_name),
    FOREIGN KEY (product_no) REFERENCES Product(product_no)
);



CREATE TABLE User_reviews (
    product_no INT UNSIGNED NOT NULL,
    ssn CHAR(10) NOT NULL,
    rating TINYINT UNSIGNED CHECK (
        rating <=5
    ),
    review_text VARCHAR(255),
    PRIMARY KEY (product_no, ssn), 
    FOREIGN KEY (product_no) REFERENCES Product(product_no),
    FOREIGN KEY (ssn) REFERENCES Users(ssn)
);

-- POPULATING THE TABLES

INSERT INTO Parent_department
VALUES ("Homepage", "This is the homepage", NULL),
("Children", "Children toys etc can be found here", "Homepage"),
("Electronics", "Electronic parts can be found here", "Homepage");

INSERT INTO Leaf_department
VALUES ("TV", "Television", "Electronics"),
("Computer", "here you can find laptops and stationary computers", "Electronics"),
("Mobile phones", "Iphone, Samsung, Nokia :D", "Electronics"),
("Toys", "Here you can find toys", "Children"),
("Clothes", "Baby clothes and big clothes :P", "Children"),
("Food", "GOGOGGAGA FOOD", "Children");

INSERT INTO Users
VALUES ("1234567890", "Flogstavägen 1", "apa@gmail.com", "0733456789", "Niklas", "apa123", 0),
("1234567891", "Vägen 2", "lolol@gmail.com", "0733452789", "Engla", "kiwisegoda", 1);

INSERT INTO Product
VALUES (69, "Samsung smart TV", 100, 20, 0,"very smart tv", 2, "TV", "Homepage"),
(691, "Iphone TV", 100, 20, 0,"very smart tv", 3, "TV", NULL),
(1337, "Epic gamer girl computer", 200, 10, 0,"gamer", 5, "Computer", "Homepage"),
(13371, "Boring computer", 12, 20, 0,"boring", 2, "Computer", NULL),
(33, "Iphone", 1320, 20, 0,"apple", 2, "Mobile phones", "Homepage"),
(331, "Samsung", 1003, 20, 0,"samsung", 4, "Mobile phones",NULL),
(4201, "Fidget spinner", 20, 20, 90,"cool new toy", 100, "Toys", "Homepage"),
(4202, "Ball", 20, 20, 50,"Ball", 20, "Toys", NULL),
(4203, "Pants", 20, 20, 0,"Baby pants", 20, "Clothes", NULL),
(4204, "Cucumber", 20, 20, 0,"Baby cucumber", 20, "Food", NULL);

INSERT INTO User_reviews
VALUES (1337, "1234567890", "this computer kinda sucks", 2),
(1337, "1234567891", "I become gladiator frost mage with this computer", 5);

INSERT INTO Product_tags
VALUES (69, "Samsung"), 
(331, "Samsung"),
(691, "Iphone"),
(33, "Iphone"),
(69, "Entertainment"),
(691, "Entertainment"),
(1337, "Entertainment"),
(13371, "Entertainment"),
(33, "Entertainment"),
(331, "Entertainment"),
(4201, "Entertainment"),
(4202, "Entertainment")

INSERT INTO Orders
VALUES ("83920394910929", "1234567891", '2022-08-22', "BMX029039LS", '2022-08-22', "open");

INSERT INTO Orders_product
VALUES (4201, "1234567891", "83920394910929"),
(1337, "1234567891", "83920394910929");
