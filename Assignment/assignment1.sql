USE AdventureWorks2019;

-- Q1
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product;

-- Q2
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE ListPrice != 0;

-- Q3
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NOT NULL;

-- Q4
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0;

-- Q5
SELECT Name + ' ' + Color [Name Color]
FROM Production.Product
WHERE Color IS NOT NULL;

-- Q6
SELECT 'NAME:' + Name + ' -- COLOR:' + Color [Name -- Color] 
FROM Production.Product
WHERE Name LIKE '%Crankarm%' OR Name LIKE '%Chainring%' 
ORDER BY ProductID ASC

-- Q8
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500;

-- Q9
SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color IN ('black', 'blue');

-- Q10
SELECT TOP 6 Name, ListPrice
FROM Production.Product
WHERE Name LIKE 'S%' --'Seat%' OR Name LIKE 'S%, [LM]'
ORDER BY Name;

-- Q12
SELECT TOP 5 Name, ListPrice
FROM Production.Product
WHERE Name LIKE '[AS]%'
ORDER BY Name;

-- Q13
SELECT * --Name
FROM Production.Product
WHERE Name LIKE 'SPO[^K]%'
ORDER BY Name;

-- Q14
SELECT DISTINCT Color 
FROM Production.Product
ORDER BY Color DESC;