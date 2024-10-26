/*
Реализуем пример запроса VALUE_COUNTS, который возвращает количество для каждого элемента. Давайте посмотрим сколько среди наших клиентов мужчин и женщин. А затем посмотрим как люди разбиты по образованию.
Не забываем, что в таком запросе нам важно получить отсортированный список, чтобы сверху были самые популярные экземпляры.
*/

SELECT sex, COUNT(*) AS cnt FROM  Clusters 
GROUP BY sex 
ORDER BY cnt DESC;

SELECT education, COUNT(*) AS cnt FROM  Clusters 
GROUP BY education 
ORDER BY cnt DESC;


/*
 Теперь необходимо сравнить распределение по полу и образованию (отдельно) для клиентов и не клиентов банка.
Продумать, какая сортировка будет оптимальной.
 */

SELECT sex, is_client, COUNT(*) AS cnt FROM Clusters 
GROUP BY sex , is_client 
ORDER BY sex, is_client;

SELECT education , is_client, COUNT(*) AS cnt FROM Clusters 
GROUP BY education , is_client 
ORDER BY education , is_client;

/*
 Давайте посмотрим образование клиентов с разбивкой по полу и определим, какое образование самое непопулярное у них (меньше всего ).
То есть отфильтруем по количеству меньше 40
*/

SELECT sex, education, COUNT(*) AS cnt FROM Clusters 
GROUP BY education, sex
HAVING cnt < 40
ORDER BY cnt;

/*
 Давайте посмотрим тоже самое, но только среди клиентов банка.
 */

SELECT sex, education, COUNT(*) AS cnt FROM Clusters 
WHERE is_client =1
GROUP BY education, sex
HAVING cnt < 40
ORDER BY cnt;

/*
 Получить среднюю величину запрашиваемого кредита и дохода клиентов для клиентов банка в разрезе образования и пола клиентов
 */

SELECT sex, education, ROUND(AVG(credit_amount), 1) AS 'средняя величина кредита', AVG(income) AS 'средний доход' FROM Clusters 
WHERE is_client = 1
GROUP BY sex, education 
ORDER BY sex, education;

/*
 Получить максимальную и минимальную сумму кредита в разрезе пола и Хороших клиентов для клиентов с высшим/неполным высшим образованием.
В чем особенность плохих и хороших клиентов?
 */

SELECT sex, bad_client_target, MIN(credit_amount) AS 'минимальная сумма кредита', MAX(credit_amount) AS 'максимальная сумма кредита' FROM Clusters
WHERE education LIKE '%higher%'
GROUP BY sex, bad_client_target 
ORDER BY sex, bad_client_target;

/*
 Получить распределение (min, max, avg) возрастов клиентов в зависимости от пола и оператора связи.
Есть ли какие-нибудь здесь инсайды.
 */

SELECT sex, phone_operator, MIN(age), MAX(age), AVG(age) FROM  Clusters 
GROUP BY phone_operator, sex 
ORDER BY phone_operator, sex;

/*
 Давайте поработаем с колонкой cluster. Для начала посмотрим сколько кластеров у нас есть и сколько людей попало в каждый кластер
 */
SELECT cluster, COUNT(*) AS cnt FROM Clusters
GROUP BY cluster 
ORDER BY cnt DESC;

/*
 Видим, что есть большие кластеры 0, 4, 3. Остальные маленькие.
Давайте маленькие кластеры объединим в большой и посмотрим средний возраст, доход, кредит и пол в больших кластерах(с помощью функции CASE). 
 */

SELECT (CASE WHEN cluster IN (1, 5, 6, 2) THEN -1 ELSE cluster END) AS 'new_cluster',
COUNT(*) AS cnt,
AVG(age), AVG(income), AVG(credit_amount), sex 
FROM Clusters
GROUP BY new_cluster
ORDER BY cnt;

/*
 Давайте сейчас проверим гипотезу, что доход клиентов связан с регионом проживания.
 */

SELECT region, AVG(income) AS avg_income FROM Clusters
GROUP BY region 
ORDER BY avg_income DESC;

/*
 С помощью подзапроса получите заказы товаров из 4 и 6 категории (подзапрос в подзапросе). Таблицы OrderDetails, Products 
 */

SELECT * FROM Orders
WHERE OrderID IN (SELECT OrderID FROM OrderDetails
WHERE ProductID IN (SELECT productID FROM Products
WHERE categoryID IN (4, 6)));

/*
 В какие страны доставляет товары компания Speedy_Express
 */

SELECT DISTINCT country FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders
WHERE ShipperID in(SELECT ShipperID FROM Shippers
WHERE ShipperName = 'Speedy_Express'));

/*
 Получите 3 страны, где больше всего клиентов (таблица Customers).
 */

SELECT Country, COUNT(*) AS cnt FROM Customers
GROUP BY Country 
ORDER BY cnt DESC
LIMIT 3;

/*
 Назовите три самых популярных города и название страны среди трех популярных стран (где больше всего клиентов)
 */

SELECT city, Country, COUNT(*) AS cnt FROM Customers 
WHERE Country IN (SELECT Country FROM Customers
GROUP BY Country 
ORDER BY COUNT(*) DESC
LIMIT 3)
GROUP BY City, Country 
ORDER BY cnt DESC 
LIMIT 3;































