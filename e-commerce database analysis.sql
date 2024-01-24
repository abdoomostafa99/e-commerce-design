USE e_commerce;
-- 1- show all columns in categories

select *
from categories;

-- 2- show only categoryName & Description

select categoryname , description
from categories;

-- 3- show only customerName, city, country from customers

select CustomerName , city , country 
from customers;

-- 4- show different countries in customers table

select distinct country
from customers;

-- 5- show different countries in customers table

select distinct country
from customers;

-- 6- show number of different countries & cities

select count(distinct country) as 'Num Country', count(distinct city) as City
from customers;

-- 7- select customerName, city & counrty for customers from germany only

select Customername, City , Country
from customers
where country = 'germany';


-- 8- show nu of customers in each country order by nu of customers 'desc'

select count(customerID) as 'num of customers' , Country
from customers
group by country
order by count( customerID ) desc;

-- 9- show nu of customers in each city order by nu of customers 'desc'

select count(customerID) as 'num of customers' , city 
from customers
group by city
order by count( customerID ) desc;

-- 10- select firstName & birthDate from employees where birth date is less than 1968-12-07

select firstname , birthdate 
from employees
where birthdate < '1968-12-07'
order by birthdate desc;

-- 11- select firstName & birthDate where birthDate between 1950 to 1960

select firstname , birthdate 
from employees
where birthdate between '1950-01-01' and '1959-12-31'
order by birthdate desc;

-- 12- How many products do you have

select count(productID) as 'products number'
from products;

-- 13- show productname & price ORDER BY price DESC

select productname , price 
from products
order by price desc;

-- 14- show productname & price where price between 50 & 100

select productname , price 
from products
where price between '50' and '100'
order by price desc;

-- 15- show productname & price where name between Chais & Ikura

select productname , price 
from products
where productname between 'chais' and 'ikura';

-- 16- show productname & price where name not between Chais & Ikura

select productname , price 
from products
where productname not between 'chais' and 'ikura';

-- 17- show productname & price where price not equal 10

select productname , price 
from products
where price != 10;

-- 18- show productname & price where name starts with 'Ch'

select productname , price 
from products
where productname like 'Ch%';

-- 19- show productname & price where firstname like 'Ch_f'

select productname , price 
from products
where productname like 'Ch_f%';

-- 20- show productname & price where firstname like has a third char of a 

select productname , price 
from products
where productname like '__a%';

-- 21- show productname & price where productName IN ('Chais', 'Chang')

select productname , price 
from products
where productname IN ('Chais', 'Chang');

-- 22- show avg , min & max price

select avg(price) as avg , min(price) as min , max(price) as max
from products;

-- 23- Select customer name together with each order the customer made

select c.customername , o.orderID
from customers c join orders o
on c.customerID = o.customerID;

-- 24- Select order id together with name of employee who handled the order

select o.orderID , e.firstname , e.lastname
from orders o join employees e
on o.employeeID = e.employeeID;

-- 25- Select customers who did not placed any order yet

select c.customername as name , count(orderID) as orders_number
from customers c join orders o 
on c.customerID = o.customerID
group by (c.customername)
order by (count(orderID)) desc ;

-- 26- Select order id , product id, quantities, together with the name of products

select o.orderID , p.productID , od.quantityID , p.productname
from orders o join order_details od 
on o.orderID = od.orderID
join products p 
on p.productID = od.productID 
ORDER BY o.orderID;

-- 27- Select products that no one bought

select p.productID , p.productname , od.orderID
from products p left join order_details od
on p.productID = od.productID
left join orders o
on od.orderID = o.orderID
where od.orderID is null;

-- 28- Select customer together with the products that he bought

select c.customerID , c.customername , p.productname
from customers c join orders o on c.customerID = o.customerID
join order_details od on o.orderID = od.orderID
join products p on od.productID = od.productID
order by customerID , productname;

-- 29- Select product names together with the name of corresponding category

select p.productname , c.categoryname
from products p join categories c on c.categoryID = p.categoryID;

-- 30- Select orders together with the name of the shipping company

select o.orderID , s.shippername
from orders o join shippers s on o.shipperID = s.shipperID ;

-- 31- Select customers with id greater than 50 together with each order they made

select c.customerID , o.orderID
from customers c join orders o on c.customerID = o.customerID
where c.customerID > 50;

-- 32- Select employees together with orders with order id greater than 10400

select e.employeeID , o.orderID
from employees e join orders o on e.employeeID = o.employeeID
where o.orderID > 10400 
order by employeeID;

-- 33- display suppliers for whom none of their products have been sold

select s.supplierID , o.orderID
from suppliers s left join products p on s.supplierID = p.supplierID
left join order_details od on p.productID = od.productID
left join orders o on od.orderID = o.orderID
where o.orderID is null;

-- 34- selects all customers, and all orders

select c.customername , o.orderID
from customers c left join orders o on c.customerID = o.customerID
union
select c.customername , o.orderID
from customers c right join orders o on c.customerID = o.customerID;

-- 35- country & city have customers or suppliers in Germany

select  country , city
from customers
where country = 'Germany'
union
select  country , city
from customers
where country = 'Germany';

-- 36 show all customers and suppliers with city and country "customer & supplier in one column"

-- 37- Display the name of each shipper along with the count of orders they have made.

select shippername , count(orderID)
from shippers s join orders o on s.shipperID = o.shipperID
group by shippername;

-- 38- Display the name of each shipper along with the count of orders they have made'ONLY HAVE nu_orders more than 60'.

select shippername , count(orderID) as num_orders
from shippers s join orders o on s.shipperID = o.shipperID
group by shippername
having num_orders > 60;

-- 40- show only the most expensive product

select productname as 'most expensive product' , price
from products 
order by price desc 
limit 1 ;

-- 41- show only the second most expensive product

select productname as 'most expensive product' , price
from products 
order by price desc 
limit 1 offset 1;

-- 42- Select name of the cheapest product (only name) using subquery with where

-- select productname , price
-- from products
-- order by price
-- limit 1 ;

select productname , price
from products
where price = (select min(price) from products);

-- 43- Select employees with LastName that starts with 'D'

select lastname
from employees
where lastname like 'D%';

/* 44- Select customer name together with the number of orders made by the corresponding customer 
sort the result by number of orders in decreasing order */

select customername , count(orderID) as num_orders
from customers c join orders o on c.customerID = o.customerID
group by customername
order by num_orders desc;


/*45- Select orderID together with the total price of  that Order, order the result by total price of order in decreasing order*/

select od.orderID , sum(od.quantityID * price) as total_price
from order_details od join products p on od.productID = p.productID
group by od.orderID
order by total_price desc;

-- 46- Select customer who spend the most money

select c.customername , sum(od.quantityID * p.price) as total_price
from customers c join orders o on c.customerID = o.customerID
join order_details od on o.orderID = od.orderID
join products p on od.productID = p.productID
group by 1
order by 2 desc;
