/*
1. В каких странах проживают наши клиенты (таблица Customers)?
Сколько уникальных стран вы получили в ответе?
*/

SELECT COUNT(DISTINCT Country) FROM Customers;

-- Ответ: 21

/*
2. Сколько клиентов проживает в Argentina?
*/

SELECT COUNT(*) FROM Customers
WHERE Country = 'Argentina';

-- Ответ: 3

/*
3. Посчитайте среднюю цену и количество товаров в 8 категории (таблица Products ).
Найдите количество товаров в 8 категории
*/

SELECT AVG(Price) FROM Products
WHERE CategoryID =8;

-- Ответ: 20.6825

SELECT COUNT(*) FROM Products
WHERE CategoryID =8;

-- Ответ: 12

/*
4. Посчитайте средний возраст работников (таблица Employees)
*/

SELECT AVG('2024-10-19'-BirthDate) FROM Employees;
SELECT * FROM Employees;

SELECT AVG(STRFTIME('%Y', '2024-10-19')- STRFTIME('%Y', BirthDate)) FROM Employees;
SELECT * FROM Employees;


-- Ответ: 66,6

/*
5. Вам необходимо получить заказы, которые сделаны в течении 35 дней до даты 2023-10-10 (то есть с 5
сентября до 10 октября включительно). Использовать функцию DATEDIFF, определить переменные для
даты и диапазона. Определите CustomerID, который оказался в первой строке запроса.
*/

SELECT CustomerID FROM Orders 
WHERE OrderDate BETWEEN '2023-09-05' AND '2023-10-10';

-- Ответ: 37 (DATEDIFF не работает в sql lite)

/*
6. Вам необходимо получить количество заказов за сентябрь месяц (тремя способами, через LIKE, с
помощью YEAR и MONTH и сравнение начальной и конечной даты).
*/
SELECT * FROm Orders;
SELECT COUNT(*) FROM Orders
WHERE OrderDate LIKE '_____09___';

SELECT COUNT(*) FROM Orders
WHERE OrderDate BETWEEN '2023-09-01' AND '2023-09-30';

-- Ответ: 23