/*
* Assignment 03 for antra SEP Full Stack
* From  JiaweiZhao
* Since 2023-01-29
*/
USE Northwind;
-- Q3
SELECT P.ProductID, p.ProductName, COUNT(o.OrderID) OrderQuantity
FROM Products p 
LEFT JOIN [Order Details] o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NOT NULL
GROUP BY P.ProductID, p.ProductName

-- Q4
SELECT c.City, SUM(od.Quantity) TotalProducts
FROM Customers c 
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.City
ORDER BY c.City

-- Q5
SELECT City, COUNT(CustomerID) CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) >= 2
-- a.union
SELECT dt.City, COUNT(dt.CustomerID) [CustomerCount]
FROM (
    SELECT City, CustomerID
    FROM Customers
    UNION
    SELECT ShipCity, CustomerID
    FROM Orders
) dt
GROUP BY dt.City
HAVING COUNT(dt.CustomerID) >= 2

-- b.subquery
SELECT City,
    (SELECT COUNT(CustomerID) 
    FROM Customers c2 
    WHERE c1.City = c2.City) [CustomerCount]
FROM Customers c1
GROUP BY City
HAVING COUNT(CustomerID) >= 2

-- Q8
SELECT TOP 5 ProductID, ProductName, TotalQuantity, AveragePrice, City
FROM 
(
    SELECT ProductID, ProductName, TotalQuantity,
    DENSE_RANK() OVER (PARTITION BY ProductID ORDER BY CityProductQuantity DESC) CityRank,
    TotalPrice / TotalQuantity AveragePrice,
    CityProductQuantity, City
    FROM 
    (
        SELECT DISTINCT p.ProductID, p.ProductName, 
        SUM(od.Quantity) OVER (PARTITION BY p.ProductID) TotalQuantity, 
        SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY p.ProductID) TotalPrice,
        SUM(od.Quantity) OVER (PARTITION BY p.ProductID, c.city) CityProductQuantity, 
        --od.OrderID, od.Quantity, od.UnitPrice, 
        c.City
        FROM Products p 
        LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
        LEFT JOIN Orders o ON od.OrderID = o.OrderID
        LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
    ) o1
) o2
WHERE CityRank = 1
ORDER BY TotalQuantity DESC

-- Q9
-- Use subquery
SELECT e.City
FROM 
(
    SELECT c.City
    FROM Customers c 
    LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE o.CustomerID IS NULL
) co
LEFT JOIN Employees e ON co.City = e.City
WHERE e.City IS NOT NULL

-- Do not use subquery
SELECT c.City
FROM Customers c 
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Employees e ON c.City = e.City
WHERE o.CustomerID IS NULL AND e.City IS NOT NULL

-- Q10
SELECT coq.City
FROM 
(
    SELECT TOP 1 e.City, COUNT(o.OrderID) CityOrderQuantity
    FROM Orders o 
    LEFT JOIN Employees e ON o.EmployeeID = e.EmployeeID
    GROUP BY e.City
) coq
INNER JOIN
(
    SELECT TOP 1 s.City, SUM(od.Quantity) CityProductQuantity
    --od.OrderID, od.ProductID, od.Quantity, 
    -- p.ProductName, p.SupplierID
    FROM [Order Details] od 
    LEFT JOIN Products p ON od.ProductID = p.ProductID
    LEFT JOIN Suppliers s ON p.SupplierID = s.SupplierID
    GROUP BY s.City
    ORDER BY SUM(od.Quantity) DESC
) cpq ON coq.City = cpq.City

-- Q11
-- 1. DISTINCT
-- 2. HAVING COUNT(*) = 1
-- 3. ROW_NUMBER() OVER (ORDER BY * ), WHERE rowNumber = 1 
