-- • Welcome text for the homepage
SELECT description FROM Parent_department WHERE title = 'Homepage';

-- • List of the top level departments with fields needed for the homepage
SELECT title, description FROM Parent_department WHERE parent_title = 'Homepage';

-- • List of the featured products with fields needed for the homepage
SELECT name, price, description, discount FROM Product WHERE featured = 'Homepage';

-- • Given a product, list all keyword-related products

SELECT DISTINCT name 
FROM Product_tags, Product 
WHERE  Product_tags.tag_name 
IN 
(SELECT tag_name 
FROM Product_tags, Product 
WHERE Product.name = "Iphone" AND Product.product_no = Product_tags.product_no) AND Product.product_no = Product_tags.product_no; 


-- • Given an department, list of all its products (title, short description, current retail price) with their average rating

SELECT  name, Product.price, Product.description, Product.product_no,  AVG( User_reviews.rating),  User_reviews.rating
FROM Leaf_department, Product 
LEFT JOIN User_reviews on Product.product_no = User_reviews.product_no
WHERE parent_title = 'Electronics' AND Product.department = Leaf_department.title
GROUP BY Product.product_no;


-- • List of all products on sale sorted by the discount percentage (starting with the biggest discount)
SELECT name FROM Product WHERE Discount >= 1 ORDER BY discount DESC; 


-- OPTIMIZATION THINGY
EXPLAIN SELECT name FROM Product, Product_tags WHERE tag_name = 'Samsung' AND Product.product_no = Product_tags.product_no; 

CREATE INDEX tag_name on Product_tags(tag_name);

EXPLAIN SELECT name FROM Product, Product_tags WHERE tag_name = 'Samsung' AND Product.product_no = Product_tags.product_no; 
