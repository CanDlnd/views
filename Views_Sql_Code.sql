
-- 1. Tüm çalışanların adı, soyadı ve işe giriş tarihini bulan sql kodu
SELECT p.FirstName, p.LastName, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID;

-- 2. Satış yapan ilk 10 müşteriyi listeleyen bulan sql kodu
SELECT TOP 10 CustomerID, COUNT(*) AS SiparisSayisi
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY SiparisSayisi DESC;

-- 3. Ürünlerin adını ve stok miktarını bulan sql kodu
SELECT Name, SafetyStockLevel, ReorderPoint
FROM Production.Product;

-- 4. 2000 TL'den fazla satış yapılan siparişleri  bulan sql kodu
SELECT SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue > 2000;

-- 5. Ürün isimlerinde "Mountain" geçen ürünleri listeleyen sql kodu
SELECT ProductID, Name
FROM Production.Product
WHERE Name LIKE '%Mountain%';

-- 6. Ürünler ve renk bilgilerini getiren sql kodu
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IS NOT NULL;


-- 7. Ortalama ürün fiyatını gösteren sql kodu
SELECT AVG(ListPrice) AS OrtalamaFiyat
FROM Production.Product
WHERE ListPrice > 0;

-- 8. En pahalı 5 ürünü listeleyen sql kodu
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- 9. Şehir bazlı müşteri listesini getiren sql kodu
SELECT a.City, COUNT(c.CustomerID) AS MusteriSayisi
FROM Sales.Customer c
JOIN Person.BusinessEntityAddress bea ON c.PersonID = bea.BusinessEntityID
JOIN Person.Address a ON bea.AddressID = a.AddressID
GROUP BY a.City
ORDER BY MusteriSayisi DESC;


-- 10. Fiyatı 1000 TL üzerindeki ürünleri ve bulundukları kategori adını getiren sql kodu
SELECT p.Name AS UrunAdi, p.ListPrice, pc.Name AS Kategori
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE p.ListPrice > 1000;
