SELECT Car_id, Company, Model, `Price ($)`, Dealer_Name, Dealer_Region
FROM sales
WHERE `Body Style` = 'SUV' 
AND Dealer_Region = 'Aurora' 
AND `Price ($)`> 20000
ORDER BY `Price ($)` DESC;

insert into dealers (Dealer_Region,Region_Manager,Region_Sales)
values ('Middletown', 'John Doe', 500000),
('Aurora', 'Jane Smith', 600000),
('Greenville', 'Alice Brown', 450000),
('Pasco', 'Bob Wilson', 700000),
('Janesville', 'Carol White', 550000),
('Scottsdale', 'Dave Green', 650000),
('Austin', 'Emma Black', 800000);

select *from dealers;

SELECT s.*, d.Region_Manager, d.Region_Sales
FROM sales s
INNER JOIN dealers d
ON s.Dealer_Region = d.Dealer_Region;


SELECT s.*, d.Region_Manager, d.Region_Sales
FROM sales s
LEFT JOIN dealers d
ON s.Dealer_Region = d.Dealer_Region;

SELECT s.*, d.Region_Manager, d.Region_Sales
FROM sales s
RIGHT JOIN dealers d
ON s.Dealer_Region = d.Dealer_Region;

SELECT Customer_Name, Model, Dealer_Region
FROM sales
WHERE Dealer_Region IN (
    SELECT Dealer_Region
    FROM dealers
    WHERE Region_Sales > 600000
);

SELECT s.Dealer_Region, 
       COUNT(*) AS Total_Sales_Count,
       SUM(s.Price) AS Total_Revenue,
       AVG(s.Price) AS Average_Price
FROM sales s
GROUP BY s.Dealer_Region;

CREATE VIEW Sales_With_Manager AS
SELECT s.Car_id, s.Customer_Name, s.Dealer_Region, d.Region_Manager, s.Price
FROM sales s
LEFT JOIN dealers d ON s.Dealer_Region = d.Dealer_Region;

CREATE INDEX idx_sales_dealer_region ON sales(Dealer_Region);
CREATE INDEX idx_dealers_dealer_region ON dealers(Dealer_Region);
