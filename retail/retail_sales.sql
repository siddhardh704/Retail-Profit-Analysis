create database retail_sales;
use  retail_sales; 
CREATE TABLE retail (
order_id INT,
order_date DATE,
region VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name VARCHAR(100),
sales FLOAT,
cost FLOAT,
profit FLOAT,
quantity INT,
inventory_days INT,
season VARCHAR(20)
);
INSERT INTO retail
(order_id, order_date, region, category, sub_category, product_name, sales, cost, profit, quantity, inventory_days, season)
VALUES
(1001, '2024-01-10', 'South', 'Furniture', 'Chairs', 'Office Chair', 5000, 3500, 1500, 2, 45, 'Winter'),
(1002, '2024-02-15', 'North', 'Technology', 'Phones', 'Smartphone', 20000, 15000, 5000, 3, 20, 'Winter'),
(1003, '2024-03-05', 'East', 'Office Supplies', 'Binders', 'Ring Binder', 2000, 1200, 800, 5, 60, 'Spring'),
(1004, '2024-04-12', 'West', 'Furniture', 'Tables', 'Dining Table', 15000, 12000, 3000, 1, 70, 'Spring'),
(1005, '2024-05-20', 'South', 'Technology', 'Accessories', 'Mouse', 800, 400, 400, 10, 15, 'Summer'),
(1006, '2024-06-18', 'North', 'Office Supplies', 'Paper', 'A4 Sheets Pack', 1200, 800, 400, 20, 10, 'Summer'),
(1007, '2024-07-25', 'East', 'Furniture', 'Chairs', 'Plastic Chair', 3000, 2500, 500, 6, 90, 'Summer'),
(1008, '2024-08-30', 'West', 'Technology', 'Laptops', 'Gaming Laptop', 70000, 65000, 5000, 1, 25, 'Rainy'),
(1009, '2024-09-10', 'South', 'Office Supplies', 'Pens', 'Ball Pen Pack', 500, 300, 200, 15, 5, 'Rainy'),
(1010, '2024-10-05', 'North', 'Furniture', 'Tables', 'Study Table', 8000, 7000, 1000, 2, 50, 'Autumn'),
(1011, '2024-11-11', 'East', 'Technology', 'Phones', 'iPhone', 90000, 85000, 5000, 1, 30, 'Autumn'),
(1012, '2024-12-22', 'West', 'Office Supplies', 'Binders', 'Clip Binder', 1500, 1000, 500, 4, 40, 'Winter'),
(1013, '2024-01-18', 'South', 'Furniture', 'Tables', 'Coffee Table', 6000, 5000, 1000, 2, 65, 'Winter'),
(1014, '2024-02-25', 'North', 'Technology', 'Accessories', 'Keyboard', 1500, 900, 600, 8, 18, 'Winter'),
(1015, '2024-03-30', 'East', 'Office Supplies', 'Paper', 'Notebook', 1000, 600, 400, 10, 35, 'Spring');
select * from retail;
-- category wise profit --
SELECT category,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM retail
GROUP BY category;
-- Sub Category Loss Makers --
SELECT sub_category,
SUM(profit) AS total_profit
FROM retail
GROUP BY sub_category
ORDER BY total_profit ASC;
-- seasonal product analysis --
SELECT season,
category,
SUM(sales) AS total_sales
FROM retail
GROUP BY season, category
ORDER BY season;
