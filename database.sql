USE ht22_1_project_group_26;

ALTER TABLE Leaf_department
ADD PRIMARY KEY (title);


ALTER TABLE Product
ADD department VARCHAR(255) NOT NULL,
ADD FOREIGN KEY (department) REFERENCES Leaf_department(title);
