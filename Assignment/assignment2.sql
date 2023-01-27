/*
* Assignment 02 for antra SEP Full Stack
* From  JiaweiZhao
* Since 2023-01-26
*/

USE AdventureWorks2019;

-- Q1
SELECT COUNT(ProductID) CountOfProducts
FROM Production.Product; -- 504

-- Q3
SELECT ProductSubcategoryID, COUNT(ProductSubcategoryID) CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID;

-- Q4
SELECT COUNT(ProductID) Count
FROM Production.Product
WHERE ProductSubcategoryID IS NULL; -- 209

-- Q5
SELECT ProductID, SUM(Quantity) SumQuantity
FROM Production.ProductInventory
GROUP BY ProductID;

-- Q6
SELECT ProductID, SUM(Quantity) TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100;

-- Q10
SELECT ProductID, Shelf, AVG(Quantity)TheAvg
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf
ORDER BY ProductID;

-- Q11
SELECT Color, Class, COUNT(ProductID) TheCount, AVG(ListPrice) AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class
ORDER BY Color, Class;

-- Q12
SELECT c.Name Country, p.Name Province
FROM person.CountryRegion c 
LEFT JOIN person.StateProvince p ON c.CountryRegionCode = p.CountryRegionCode;

-- Q13
SELECT c.Name Country, p.Name Province
FROM person.CountryRegion c 
LEFT JOIN person.StateProvince p ON c.CountryRegionCode = p.CountryRegionCode
WHERE c.Name IN ('Germany', 'Canada');

USE Northwind;

-- Q15
SELECT TOP 5 o.ShipPostalCode, SUM(d.Quantity) SumQuantity
FROM Orders o 
LEFT JOIN [Order Details] d ON o.OrderID = d.OrderID
GROUP BY o.ShipPostalCode
ORDER BY SUM(d.Quantity) DESC;

-- Q17
SELECT City, COUNT(CustomerID) CountOfCustomers
FROM Customers
GROUP BY City
ORDER BY City

-- Q18
SELECT City, COUNT(CustomerID) CountOfCustomers
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2
ORDER BY City

-- Q19
SELECT DISTINCT c.CompanyName
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate > '1998-01-01'
ORDER BY c.CompanyName

-- Q20
SELECT c.CompanyName CustomerName, MAX(o.OrderDate) MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY c.CompanyName

-- Q23
SELECT DISTINCT --od.ProductID, p.SupplierID, o.ShipVia, p.ProductName, 
su.CompanyName [Supplier Company Name], sh.CompanyName [Shipping Company Name]
FROM [Order Details] od 
LEFT JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Suppliers su ON p.SupplierID = su.SupplierID
LEFT JOIN Orders o ON o.OrderID = od.OrderID
LEFT JOIN Shippers sh ON sh.ShipperID = o.ShipVia
ORDER BY su.CompanyName

-- Q26
SELECT e2.EmployeeID ManagerID, e2.FirstName + ' ' + e2.LastName FullName, COUNT(e1.EmployeeID) CountOfEmployees
FROM Employees e1, Employees e2
WHERE e1.ReportsTo = e2.EmployeeID
GROUP BY e2.EmployeeID, e2.FirstName, e2.LastName
HAVING COUNT(e1.EmployeeID) > 2
ORDER BY e2.EmployeeID
