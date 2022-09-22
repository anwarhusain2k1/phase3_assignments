use Northwind

select count(customerid)'no of customers' from Customers;


 select customerid,ContactName  from customers where contactname = 'b%';

 select customerid,ContactName  from customers where contactname = '%s%';

 select city,count(CustomerID) from Customers group by City

 select city,count(customerid) 'customer_count' from customers group by City 
 order by count(customerid) desc offset 0 rows fetch first 3 rows only; 

 select * from customers where customerid =
 (select distinct  Customerid from orders where customerid = 
 (select CustomerID from orders group by CustomerID order by count(customerid) desc offset 0 rows fetch first 1 rows only))


 select shipcountry,count(shipcountry) from orders group by shipcountry order by count(shipcountry) desc  offset 0 rows fetch first 1 rows only

select lastname from employees where month(birthdate)=11 