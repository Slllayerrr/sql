/*
Создайте хранимую процедуру с именем «GetEmployeeOrders».
который принимает идентификатор сотрудника в качестве
параметра и возвращает все заказы, обработанные этим
сотрудником.
Пропишите запрос, который создаст требуемую процедуру.
*/

--CREATE PROCEDURE GetEmployeeOrders(_EmployeeID int)
--BEGIN
--SELECT 
--	EmployeeID,
--	OrderID 
--FROM Orders 
--WHERE EmployeeID = _EmployeeID
--END



/*
Создайте таблицу EmployeeRoles, как на уроке и удалите ее.
Напишите запрос, который удалит нужную таблицу.
*/

DROP TABLE IF EXISTS EmployeeRoles;

CREATE TABLE EmployeeRoles(
	EmployeeRoleID INT PRIMARY KEY,
	EmployeeID INT,
	Role VARCHAR(30)
);


/*
Удалите все заказы со статусом 'Delivered' из таблицы OrderStatus,
которую создавали на семинаре
Напишите запрос, который удалит нужные строки в таблице.
*/

DELETE FROM order_status 
WHERE status = 'Delivered';

