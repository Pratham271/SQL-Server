--Select
select 
order_id, 
customer_id 
from sales.orders;

--Order By
select 
first_name , 
last_name 
from sales.customers 
order by first_name;

--Offset Fetch
SELECT product_name , list_price 
FROM production.products 
ORDER BY list_price,product_name OFFSET 10 
ROWS FETCH NEXT 10 
ROWS ONLY;

--Select Top
SELECT 
TOP 10 product_name, 
list_price 
FROM production.products 
ORDER BY list_price DESC;

--Select Distinct
SELECT DISTINCT 
city FROM 
sales.customers 
ORDER BY city;

--Where
SELECT product_id,product_name,category_id,model_year,list_price 
FROM production.products 
WHERE category_id = 1 
ORDER BY list_price DESC;

--Null
SELECT 
customer_id,first_name,last_name,phone 
FROM sales.customers 
WHERE phone = NULL ORDER BY first_name,last_name;

--And
SELECT 
product_name,category_id,model_year,list_price 
FROM production.products 
WHERE category_id = 1 
AND model_year = 2018 
ORDER BY list_price DESC;

--OR
SELECT 
product_name,list_price 
FROM production.products 
WHERE list_price < 200 OR list_price > 6000 
ORDER BY list_price;

--IN
SELECT product_name, list_price 
FROM production.products 
WHERE list_price IN (89.99, 109.99, 159.99) 
ORDER BY list_price;

--BETWEEN
SELECT order_id, customer_id, order_date, order_status 
FROM sales.orders 
WHERE order_date BETWEEN '20170115' AND '20170117' 
ORDER BY order_date;

--LIKE
SELECT customer_id, first_name, last_name 
FROM sales.customers 
WHERE last_name LIKE '%er' 
ORDER BY first_name;

--Column and table Alias
SELECT first_name + ' ' + last_name 
AS 'Full Name' 
FROM sales.customers 
ORDER BY first_name;

--INNER JOIN
SELECT product_name, category_name, list_price 
FROM production.products p INNER JOIN production.categories c 
ON c.category_id = p.category_id 
ORDER BY product_name DESC;

--LEFT JOIN
SELECT product_name, order_id 
FROM production.products p LEFT JOIN sales.order_items o 
ON o.product_id = p.product_id 
ORDER BY order_id;

--RIGHT JOIN
SELECT product_name, order_id 
FROM sales.order_items o RIGHT JOIN production.products p 
ON o.product_id = p.product_id 
WHERE order_id IS NULL 
ORDER BY product_name;

--Group By
SELECT 
city, COUNT (customer_id) customer_count 
FROM sales.customers 
GROUP BY city 
ORDER BY city;

--Having
SELECT customer_id, 
YEAR (order_date), COUNT (order_id) order_count 
FROM sales.orders 
GROUP BY customer_id, YEAR (order_date) 
HAVING COUNT (order_id) >= 2 
ORDER BY customer_id;