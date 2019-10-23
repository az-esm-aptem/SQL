CREATE DATABASE Goods
USE Goods
--таблица категорий
CREATE TABLE Categories (
CategoryID int NOT NULL PRIMARY KEY,
Category varchar(100)
)
 --таблица продуктов
CREATE TABLE Products (
ProductID int FOREIGN KEY REFERENCES Categories(CategoryID),
Product varchar(100)
)

--заполнение категорий
DECLARE @i int
DECLARE @tmp varchar(100)
set @i=1
WHILE @i<=10
BEGIN
set @tmp = 'Category_' + CAST(@i as varchar(50))
insert into Categories values (@i, @tmp)
set @i=@i+1
END


--заполнение продуктов
DECLARE @i int
DECLARE @tmp varchar(100)
set @i=1
WHILE @i<=10
BEGIN
set @tmp = 'Product_' + CAST((ABS(CHECKSUM(NEWID()) % 10) + 1) as varchar(50))
insert into Products values (((ABS(CHECKSUM(NEWID()) % 10) + 1)), @tmp)
set @i=@i+1
END

--выборка Продукт-Категория
SELECT Product, Category
FROM Categories INNER JOIN Products
ON Categories.CategoryID = Products.ProductID
