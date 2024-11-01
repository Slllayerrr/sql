/*
1.Ранжируйте продукты (по ProductRank) в каждой категории на основе их общего объема продаж (TotalSales).
*/
SELECT 
	p.ProductName,
	CategoryID,
	SUM(p.Price * od.Quantity),
RANK() OVER (ORDER BY SUM(p.Price * od.Quantity))
FROM Products p 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
GROUP BY p.ProductName, CategoryID




/*
Обратимся к таблице Clusters
Рассчитайте среднюю сумму кредита (AvgCreditAmount) для каждого кластера и месяца, учитывая общую среднюю сумму
кредита за соответствующий месяц (OverallAvgCreditAmount). Определите OverallAvgCreditAmount в первой строке результатов запроса.
*/

SELECT DISTINCT 
cluster ,
"month" ,
	AVG(credit_amount) OVER (PARTITION BY cluster, "month") AS OverallAvgCreditAmount
FROM Clusters 





/*
Сопоставьте совокупную сумму сумм кредита (CumulativeSum) для каждого кластера, упорядоченную по
месяцам, и сумму кредита в порядке возрастания.
Определите CumulativeSum в первой строке результатов запроса
*/
WITH amout_sort AS (
SELECT  
cluster ,
"month" ,
	SUM(credit_amount) OVER (PARTITION BY cluster, "month") AS CumulativeSum,
	credit_amount 
FROM Clusters 
)
SELECT *
FROM amout_sort
ORDER BY cluster , "month" ,credit_amount;

