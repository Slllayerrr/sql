/*
проверить влияние семейного положения (family_status) на средний	доход
клиентов (income) и запрашиваемый кредит (credit_amount).
*/

SELECT family_status ,AVG(income), AVG(credit_amount) FROM Clusters 
GROUP BY family_status 
ORDER BY family_status ;

/*
Сколько товаров в категории Meat/Poultry.
*/

SELECT COUNT(*) AS 'кол-во товаров в категории Meat/Poultry' FROM Products
WHERE CategoryID IN (SELECT CategoryID  FROM Categories  
WHERE CategoryName = 'Meat/Poultry');

/*
Какой товар (название) заказывали в сумме в самом большом количестве (sum(Quantity) в таблице OrderDetails)
*/

SELECT ProductName FROM Products 
WHERE ProductID IN (SELECT ProductID FROM OrderDetails
GROUP BY ProductID 
ORDER BY SUM(Quantity) DESC
LIMIT 1);