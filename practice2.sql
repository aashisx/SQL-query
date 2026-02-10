
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

--Find the total number of sales records for each City.--
select  City,count(*) as no_of_records from RetailSales
GROUP BY City;

--Display total quantity sold for each ProductName.--
select  Productname,count(*) as no_of_records from RetailSales
GROUP BY Productname;

select distinct city from Retailsales
select distinct productname, customername from retailsales

select distinct category, customername from retailsales 
where customername like 's%' order by customername desc


select distinct customername,productname, unitprice from retailsales
where unitprice >= 5000 order by customername;


select category, sum(quantity) total_qty, sum(unitprice) total_sales from retailsales group by category

select category, max(quantity), max(unitprice) from retailsales group by category

select productname, sum(quantity) as unit_sold from retailsales group by productname;

select productname, sum(quantity * unitprice) as sales_amount from retailsales group by productname;

select city, count(city) as total_sales from retailsales group by city;

select customername, sum(quantity) as quantity_sold from retailsales group by customername;


select category, min(unitprice) as minprice from retailsales group by category;

select productname, count(*) as times_sold from retailsales group by productname;


select productname, count(*) as totalsales from retailsales group by productname
having count(*) >3

--difference betwn where and having--


select customername, sum(unitprice * quantity) as purchase_amt from retailsales group by customername 
having sum(unitprice * quantity) > 100000
order by purchase_amt DESC;


select customername, sum(unitprice * quantity) as purchase_amt from retailsales group by customername 
having sum(unitprice * quantity) > 100000
order by 2 DESC;


--duplicate name--
SELECT customername, COUNT(*) AS totalcount FROM retailsales
GROUP BY customername
HAVING COUNT(*) > 1;

--top 3 product based on total sales amount--
select top 3 productname , sum(quantity * unitprice) as totalsales from retailsales
group by productname
order by 2 DESC

--display customer whose total electronic spending is greater that funiture spending--

select customername, sum( case when category= 'electronics' then unitprice * quantity else 0 END) as electronic_spending,
sum( case when category= 'furniture' then unitprice * quantity else 0 END) as furniture_spending
from retailsales  group by customername
having 
sum( case when category= 'electronics' then unitprice * quantity else 0 END)  >
sum( case when category= 'furniture' then unitprice * quantity else 0 END)+11
order by customername ASC

--top2--
select top 2 customername,
sum( case when category= 'electronics' then unitprice * quantity else 0 END) as electronic_spending,
sum( case when category= 'furniture' then unitprice * quantity else 0 END) as furniture_spending
from retailsales  group by customername
having 
sum( case when category= 'electronics' then unitprice * quantity else 0 END)  >
sum( case when category= 'furniture' then unitprice * quantity else 0 END)
order by 2 DESC


--display cities whose highest single sale amount is greater than 80000--
SELECT City, max(quantity * unitprice) as highest_single_sale_amt from retailsales
group by city
having max(quantity * unitprice) > 60000.00

--display total quantity sold for each productname in each city--
select city,productname, sum(quantity) as quantity_sold from retailsales
group by city, productname;

--find the customers and categories where total spending exceeds 50000--
SELECT customername, category, sum(quantity * unitprice) as total_spending from retailsales
group by customername, category
having sum(quantity * unitprice) > 50000

--show cities and products sold on more than one diff day--
select  city, productname,
 COUNT(DISTINCT SaleDate) AS NumberOfDiffday from retailsales
group by city, productname
HAVING COUNT(DISTINCT SaleDate) > 1

--Find products that were sold in more than one city.--
SELECT ProductName,
COUNT(DISTINCT City) AS NumberOfCities,
SUM(Quantity) AS TotalQuantitySold,
SUM(Quantity * UnitPrice) AS TotalRevenue
FROM RetailSales
GROUP BY ProductName
HAVING COUNT(DISTINCT City) > 1
ORDER BY NumberOfCities DESC, TotalRevenue DESC;