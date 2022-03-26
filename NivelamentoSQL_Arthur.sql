--Arthur de Figueiredo Gusmão

--1) Qual o número de clientes por país? Ordene do maior para o menor

--Resposta 1:

SELECT COUNT(CustomerID), Country 
  FROM Customers
 GROUP BY Country
 ORDER BY COUNT(CustomerID) DESC

--2) Quantas compras cada cliente fez? Ordene do maior para o menor.

--Resposta 2:

SELECT COUNT(OrderID), CustomerID 
  FROM Orders
 GROUP BY CustomerID
 ORDER BY COUNT(OrderID) DESC

--3) Qual o número médio de produtos por ordem de cada cliente?

--Resposta 3:

SELECT AVG(OrderDetails.Quantity), OrderDetails.OrderID, Orders.CustomerID, Orders.OrderID 
  FROM OrderDetails
INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
GROUP BY Orders.OrderID, Orders.CustomerID
ORDER BY Orders.CustomerID DESC

--4) Qual o valor médio das ordens por cliente? Ordene do maior para o menor.

--Resposta 4:

SELECT AVG(Products.Price * OrderDetails.Quantity) AS ValorMedio, Orders.CustomerID, Orders.OrderID
FROM ((Products
INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID)
INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID)
GROUP BY Orders.OrderID
ORDER BY ValorMedio DESC
;