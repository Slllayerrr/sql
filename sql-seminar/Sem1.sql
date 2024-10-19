SELECT * FROM Clusters
WHERE family_status = 'Another' AND sex = 'female';

SELECT * FROM Clusters
WHERE (sex = 'female' AND age >= 60) OR 
(sex = 'male' AND age >= 65)
ORDER BY sex, age;

SELECT * FROM Clusters
WHERE ((sex = 'female' AND age >= 60) OR 
(sex = 'male' AND age >= 65)) AND family_status = 'Married';
 
SELECT product_type, income FROM Clusters
WHERE (sex = 'female' AND age >= 60) OR 
(sex = 'male' AND age >= 65)
ORDER BY income
LIMIT 10;

SELECT * FROM Clusters
ORDER BY income
LIMIT 10;

SELECT * FROM Clusters
ORDER BY income DESC
LIMIT 10;

SELECT *, income-credit_amount AS  difference FROM Clusters
ORDER BY income-credit_amount DESC
LIMIT 10;

SELECT * FROM Clusters
WHERE education = 'Higher education';

SELECT * FROM Clusters
WHERE cluster = 3 AND income >120000;

SELECT * FROM Clusters
WHERE (cluster = 3 OR cluster = 5) AND income >120000;
/* 
 * WHERE cluster IN (3, 5) AND income >120000;
 */

SELECT * FROM Clusters
WHERE product_type LIKE '%ces';

SELECT * FROM Clusters
WHERE product_type LIKE '%n%n%';

SELECT * FROM Clusters
WHERE product_type NOT LIKE '%_________%';

SELECT * FROM Clusters
WHERE LENGTH(product_type) < 9;

SELECT * FROM Clusters
WHERE income BETWEEN 20000 AND 30000;

SELECT CONCAT(LOWER(education), '(', LOWER(sex), ')') FROM Clusters;

SELECT COUNT(DISTINCT credit_term) FROM Clusters;

SELECT COUNT(DISTINCT product_type) FROM Clusters;

SELECT SUM(credit_amount) FROM Clusters
WHERE month = 12 AND is_client = 1;

SELECT COUNT(*) FROM Orders 
WHERE OrderDate BETWEEN '2023-09-01' AND '2023-09-15';







