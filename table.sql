USE ht22_1_project_group_26;

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
    status VARCHAR(255), -- ??
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
    PRIMARY KEY (product_no),
);

CREATE TABLE Parent_department (
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(title)
);

CREATE TABLE Leaf_department (
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(title)
);

CREATE TABLE Product_tags (
    product_no INT UNSIGNED NOT NULL,
    tag_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_no), 
    FOREIGN KEY (product_no) REFERENCES Product(product_no)
);

CREATE TABLE User_reviews (
    product_no INT UNSIGNED NOT NULL,
    ssn CHAR(10) NOT NULL,
    rating TINYINT UNSIGNED NOT NULL CHECK (
        rating <=5
    ),
    review_text VARCHAR(255),
    PRIMARY KEY (product_no, ssn), 
    FOREIGN KEY (product_no) REFERENCES Product(product_no),
    FOREIGN KEY (ssn) REFERENCES Users(ssn)

    
);



INSERT INTO Parent_department
VALUES ("Electronics", "Electronic parts can be found here");