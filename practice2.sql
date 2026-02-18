
CREATE TABLE RetailSales (
    SaleID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE
);
INSERT INTO RetailSales VALUES
(1, 'Amit Sharma', 'Kathmandu', 'Laptop', 'Electronics', 1, 80000, '2025-01-10'),
(2, 'Amit Sharma', 'Kathmandu', 'Mobile Phone', 'Electronics', 2, 40000, '2025-01-12'),
(3, 'Rina Thapa', 'Pokhara', 'Mobile Phone', 'Electronics', 1, 40000, '2025-01-15'),
(4, 'Suman Karki', 'Kathmandu', 'Office Chair', 'Furniture', 4, 15000, '2025-01-20'),
(5, 'Suman Karki', 'Kathmandu', 'Table', 'Furniture', 1, 20000, '2025-01-22'),
(6, 'Anil Gurung', 'Butwal', 'Laptop', 'Electronics', 2, 80000, '2025-01-25'),
(7, 'Rina Thapa', 'Pokhara', 'Table', 'Furniture', 3, 20000, '2025-01-26');

INSERT INTO RetailSales VALUES
(8,  'Amit Sharma',  'Kathmandu', 'Mouse',        'Electronics', 3, 1200,  '2025-02-01'),
(9,  'Rina Thapa',   'Pokhara',   'Keyboard',     'Electronics', 2, 2500,  '2025-02-02'),
(10, 'Anil Gurung',  'Butwal',    'Office Chair', 'Furniture',   1, 15000, '2025-02-03'),
(11, 'Suman Karki',  'Kathmandu', 'Laptop',       'Electronics', 1, 80000, '2025-02-04'),
(12, 'Bikash Rana',  'Biratnagar','Mobile Phone', 'Electronics', 2, 40000, '2025-02-05'),
(13, 'Bikash Rana',  'Biratnagar','Table',        'Furniture',   1, 20000, '2025-02-06'),
(14, 'Nisha Adhikari','Kathmandu','Keyboard',     'Electronics', 3, 2500,  '2025-02-07'),
(15, 'Nisha Adhikari','Kathmandu','Mouse',        'Electronics', 5, 1200,  '2025-02-07'),
(16, 'Anil Gurung',  'Butwal',    'Table',        'Furniture',   2, 20000, '2025-02-08'),
(17, 'Rina Thapa',   'Pokhara',   'Office Chair', 'Furniture',   2, 15000, '2025-02-09'),
(18, 'Amit Sharma',  'Kathmandu', 'Table',        'Furniture',   1, 20000, '2025-02-10'),
(19, 'Bikash Rana',  'Biratnagar','Laptop',       'Electronics', 1, 80000, '2025-02-11'),
(20, 'Suman Karki',  'Kathmandu', 'Mouse',        'Electronics', 4, 1200,  '2025-02-12');

--level 1--

-- 1. Display total quantity sold for each ProductName.
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM RetailSales
GROUP BY ProductName;


-- 2. Show total sales amount (Quantity * UnitPrice) for each ProductName.
SELECT ProductName, SUM(Quantity * UnitPrice) AS TotalSalesAmount
FROM RetailSales
GROUP BY ProductName;


-- 3. Find the total number of sales records for each City.
SELECT City, COUNT(*) AS TotalSalesRecords
FROM RetailSales
GROUP BY City;


-- 4. Display the total quantity sold by each CustomerName.
SELECT CustomerName, SUM(Quantity) AS TotalQuantity
FROM RetailSales
GROUP BY CustomerName;


-- 5. Show category-wise total quantity sold.
SELECT Category, SUM(Quantity) AS TotalQuantity
FROM RetailSales
GROUP BY Category;


-- 6. Find the minimum unit price for each Category.
SELECT Category, MIN(UnitPrice) AS MinimumUnitPrice
FROM RetailSales
GROUP BY Category;


-- 7. Display the maximum unit price for each ProductName.
SELECT ProductName, MAX(UnitPrice) AS MaximumUnitPrice
FROM RetailSales
GROUP BY ProductName;


-- 8. Show the average unit price of products for each Category.
SELECT Category, AVG(UnitPrice) AS AverageUnitPrice
FROM RetailSales
GROUP BY Category;


-- 9. Display total sales amount for each City.
SELECT City, SUM(Quantity * UnitPrice) AS TotalSalesAmount
FROM RetailSales
GROUP BY City;


-- 10. Count how many times each ProductName was sold.
SELECT ProductName, COUNT(*) AS TimesSold
FROM RetailSales
GROUP BY ProductName;


--level-2--

-- 1. Display products whose total quantity sold is greater than 3.
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM RetailSales
GROUP BY ProductName
HAVING SUM(Quantity) > 3;


-- 2. Find customers whose total purchase amount exceeds 100,000.
SELECT CustomerName, SUM(Quantity * UnitPrice) AS TotalPurchaseAmount
FROM RetailSales
GROUP BY CustomerName
HAVING SUM(Quantity * UnitPrice) > 100000;


-- 3. Show cities where total sales amount is more than 150,000.
SELECT City, SUM(Quantity * UnitPrice) AS TotalSalesAmount
FROM RetailSales
GROUP BY City
HAVING SUM(Quantity * UnitPrice) > 150000;


-- 4. Display categories having more than 5 items sold in total.
SELECT Category, SUM(Quantity) AS TotalItemsSold
FROM RetailSales
GROUP BY Category
HAVING SUM(Quantity) > 5;


-- 5. Find products that were sold more than 2 times.
SELECT ProductName, COUNT(*) AS TimesSold
FROM RetailSales
GROUP BY ProductName
HAVING COUNT(*) > 2;


-- 6. Display customers who purchased more than 5 items in total.
SELECT CustomerName, SUM(Quantity) AS TotalItemsPurchased
FROM RetailSales
GROUP BY CustomerName
HAVING SUM(Quantity) > 5;


-- 7. Show categories whose average unit price is greater than 20,000.
SELECT Category, AVG(UnitPrice) AS AverageUnitPrice
FROM RetailSales
GROUP BY Category
HAVING AVG(UnitPrice) > 20000;


-- 8. Display cities having more than 3 sales records.
SELECT City, COUNT(*) AS TotalSalesRecords
FROM RetailSales
GROUP BY City
HAVING COUNT(*) > 3;


-- 9. Find products whose total sales amount exceeds 50,000.
SELECT ProductName, SUM(Quantity * UnitPrice) AS TotalSalesAmount
FROM RetailSales
GROUP BY ProductName
HAVING SUM(Quantity * UnitPrice) > 50000;


-- 10. Show customers who have made more than one purchase.
SELECT CustomerName, COUNT(*) AS PurchaseCount
FROM RetailSales
GROUP BY CustomerName
HAVING COUNT(*) > 1;


--level3--

-- 1. Display customers who purchased products from more than one category.
SELECT CustomerName, COUNT(DISTINCT Category) AS CategoryCount
FROM RetailSales
GROUP BY CustomerName
HAVING COUNT(DISTINCT Category) > 1;


-- 2. Find products that were sold in more than one city.
SELECT ProductName, COUNT(DISTINCT City) AS CityCount
FROM RetailSales
GROUP BY ProductName
HAVING COUNT(DISTINCT City) > 1;


-- 3. Display cities where more than 2 different products were sold.
SELECT City, COUNT(DISTINCT ProductName) AS ProductCount
FROM RetailSales
GROUP BY City
HAVING COUNT(DISTINCT ProductName) > 2;


-- 4. Find categories having more than 2 different products sold.
SELECT Category, COUNT(DISTINCT ProductName) AS ProductCount
FROM RetailSales
GROUP BY Category
HAVING COUNT(DISTINCT ProductName) > 2;


-- 5. Display customers whose average purchase amount per sale is greater than 30,000.
SELECT CustomerName, AVG(Quantity * UnitPrice) AS AvgPurchaseAmount
FROM RetailSales
GROUP BY CustomerName
HAVING AVG(Quantity * UnitPrice) > 30000;


-- 6. Show products where average quantity per sale is greater than 2.
SELECT ProductName, AVG(Quantity) AS AvgQuantity
FROM RetailSales
GROUP BY ProductName
HAVING AVG(Quantity) > 2;


-- 7. Find customers who made purchases on more than one date.
SELECT CustomerName, COUNT(DISTINCT SaleDate) AS PurchaseDates
FROM RetailSales
GROUP BY CustomerName
HAVING COUNT(DISTINCT SaleDate) > 1;


-- 8. Display products sold on more than 3 different days.
SELECT ProductName, COUNT(DISTINCT SaleDate) AS SaleDays
FROM RetailSales
GROUP BY ProductName
HAVING COUNT(DISTINCT SaleDate) > 3;


-- 9. Show cities where customers purchased both Electronics and Furniture.
SELECT City
FROM RetailSales
GROUP BY City
HAVING COUNT(DISTINCT Category) = 2;


-- 10. Find customers who bought the same product more than once.
SELECT CustomerName, ProductName, COUNT(*) AS PurchaseCount
FROM RetailSales
GROUP BY CustomerName, ProductName
HAVING COUNT(*) > 1;
