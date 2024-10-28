/*
Посчитать средний чек одного заказа.
*/
SELECT od.OrderID ,
	AVG(p.Price * od.Quantity)
FROM OrderDetails od 
JOIN Products p ON p.ProductID = od.ProductID 
GROUP BY od.OrderID
ORDER BY od.OrderID;  

/*
Посчитать сколько заказов доставляет в месяц каждая служба доставки. Определите, сколько заказов доставила United Package в декабре 2023 года
*/

SELECT s.ShipperName , COUNT(OrderID)
FROM Orders o 
JOIN Shippers s ON o.ShipperID = s.ShipperID 
WHERE OrderDate BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY s.ShipperName;


/*
Определить средний LTV покупателя (сколько денег покупатели в среднем тратят в магазине за весь период)
*/

SELECT CustomerName, SUM(p.Price * od.Quantity)
FROM Customers c 
JOIN Orders o ON o.CustomerID = c.CustomerID 
JOIN OrderDetails od ON od.OrderID = o.OrderID 
JOIN Products p ON p.ProductID = od.ProductID 
GROUP BY CustomerName;

