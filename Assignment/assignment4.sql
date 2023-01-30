/*
* Assignment 04 for antra SEP Full Stack
* From  JiaweiZhao
* Since 2023-01-30
*/
-- USE Northwind;

----------------------- Q1 -----------------------
/*
CREATE VIEW view_product_order_zhao
AS (
    SELECT p.ProductID, p.ProductName, SUM(o.Quantity) TotalQuantity
    FROM Products p 
    LEFT JOIN [Order Details] o ON p.ProductID = o.ProductID
    GROUP BY p.ProductID, p.ProductName
);
*/
-- SELECT * FROM dbo.view_product_order_zhao
-- DROP VIEW dbo.view_product_order_zhao

----------------------- Q2 -----------------------
CREATE PROC sp_product_order_quantity_zhao
@ProductID INT,
@TotalQuantity INT OUT
AS
BEGIN
    SELECT @TotalQuantity = SUM(o.Quantity)
    FROM Products p 
    LEFT JOIN [Order Details] o ON p.ProductID = o.ProductID
    WHERE p.ProductID = @ProductID
    GROUP BY p.ProductID, p.ProductName
END

-- DECLARE @TotalQuantity INT;
-- DECLARE @ProductID INT = 1;
-- EXEC sp_product_order_quantity_zhao @ProductID, @TotalQuantity OUT;
-- PRINT @TotalQuantity;

-- DROP PROC sp_product_order_quantity_zhao

----------------------- Q3 -----------------------
/*
CREATE PROC sp_product_order_city_zhao
@ProductName VARCHAR(30)
AS
BEGIN
    SELECT TOP 5 c.City, SUM(od.Quantity) CityOrderQuantity
        -- p.ProductName
    FROM Products p 
    LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
    LEFT JOIN Orders o ON od.OrderID = o.OrderID
    LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE p.ProductName = @ProductName
    GROUP BY p.ProductName, c.City
    ORDER BY p.ProductName, SUM(od.Quantity) DESC
END
*/
-- DECLARE @ProductName VARCHAR(30) = 'Alice Mutton';
-- EXEC sp_product_order_city_zhao @ProductName

-- DROP PROC sp_product_order_city_zhao

----------------------- Q4 -----------------------

-- Create 2 new tables
CREATE TABLE city_zhao (
    Id INT PRIMARY KEY,
    City VARCHAR(30) NOT NULL
)

INSERT city_zhao VALUES
(1, 'Seattle'),
(2, 'Green Bay');

SELECT * FROM city_zhao

CREATE TABLE people_zhao (
    Id INT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL,
    City INT
);

INSERT people_zhao VALUES
(1, 'Aaron Rodgers', 2),
(2, 'Russell Wilson', 1),
(3, 'Jody Nelson', 2);

SELECT * FROM people_zhao

-- Remove city of Seattle and put them into a new city “Madison”
DELETE city_zhao WHERE City = 'Seattle'
INSERT city_zhao VALUES (1, 'Madison')

-- Create a view
/*
CREATE VIEW Packers_jiawei_zhao
AS (
    SELECT Name 
    FROM people_zhao p 
    LEFT JOIN city_zhao c ON p.City = c.Id
    WHERE c.City = 'Green Bay'
)
*/
-- SELECT * FROM dbo.Packers_jiawei_zhao

-- Drop both tables and view
-- DROP TABLE city_zhao
-- DROP TABLE people_zhao
-- DROP VIEW dbo.Packers_jiawei_zhao

----------------------- Q5 -----------------------
/*
CREATE PROC sp_birthday_employees_zhao
AS
BEGIN
    CREATE TABLE birthday_employees_zhao (
        EmployeeID INT PRIMARY KEY,
        FirstName VARCHAR(30),
        LastName VARCHAR(30)
    )

    INSERT birthday_employees_zhao 
    SELECT EmployeeID, FirstName, LastName
    FROM Employees
    WHERE MONTH(BirthDate) = 2
END
*/
-- EXEC sp_birthday_employees_zhao
-- SELECT * FROM birthday_employees_zhao
-- DROP TABLE birthday_employees_zhao
-- DROP PROC sp_birthday_employees_zhao

----------------------- Q6 -----------------------
-- use: insert table1 select * from table2



