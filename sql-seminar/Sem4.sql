/*
Рассчитайте среднее количество товаров, заказанных каждым покупателем (используя оконную функцию).
*/

-- через оконную функцию
SELECT DISTINCT 
	AVG(Quantity) OVER(PARTITION BY o.CustomerID),
	o.CustomerID 
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID;

-- через группировку
SELECT 
	AVG(Quantity),
	o.CustomerID
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID;



/*
Определите первую и последнюю даты заказа для каждого клиента
*/

-- через оконную функцию
SELECT DISTINCT 
	MIN(OrderDate) OVER(PARTITION BY CustomerID) AS min_date,
	MAX(OrderDate) OVER(PARTITION BY CustomerID) AS max_date,
	COUNT(*) OVER(PARTITION BY CustomerID) AS cnt,
	CustomerID
FROM Orders;

-- через группировку
SELECT 
	MIN(OrderDate),
	MAX(OrderDate),
	COUNT(*),
	CustomerID 
FROM Orders
GROUP BY CustomerID;





/*
Получите общее количество заказов для каждого клиента, а также имя и город клиента.
*/

-- через оконную функцию
SELECT 
	c.CustomerID ,
	City ,
	COUNT(*) OVER (PARTITION BY c.CustomerID) AS cnt
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID;


-- через группировку
SELECT 
	c.CustomerID ,
	City ,
	COUNT(*)
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID 
GROUP BY c.CustomerID;





/*
Ранжируйте сотрудников на основе общего количества обработанных ими заказов.
*/

SELECT 
	EmployeeID ,
	RANK() OVER (ORDER BY COUNT(OrderID))
FROM Orders 
GROUP BY EmployeeID;



/*
 Определите среднюю цену товаров внутри каждой категории, рассматривая только категории, в которых более трех товаров
 */

WITH product_price AS (
	SELECT DISTINCT 
		CategoryID,
		AVG(Price) OVER (PARTITION BY CategoryID),
		COUNT(ProductID) OVER (PARTITION BY CategoryID)  AS cnt
	FROM Products 
)
SELECT *
FROM product_price
WHERE cnt > 9;




/*
 Рассчитайте процент от общего объема (выручки) продаж каждого продукта в своей категории
 */

SELECT 
	ProductName,
	sum(Price * Quantity) / sum(sum(Price * Quantity)) OVER (PARTITION BY CategoryID) * 100 AS cash
FROM OrderDetails od 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductID , CategoryID;


/*
 Для каждого заказа сделайте новую колонку в которой определите общий объем продаж за каждый месяц, учитывая все годы.
 */

-- в мс 



















  
