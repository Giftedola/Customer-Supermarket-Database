--Select Statement

select * from customer

select customer_id, first_name, last_name, email from customer;

--Select distinction statement

--If we want to know the types of ratings movies can get e.g PG, PG-13, R, etc

select distinct rating from film

--where statement
--If we want to get all customers whose names are Jamie.

select first_name, last_name from customer;
where first_name = 'Jamie';

--If we want to get customers whose  first name are Jamie and last name is Rice

select first_name, last_name from customer
where first_name = 'Jamie' AND last_name = 'Rice';

--If we want to get all the records of customers whose first name are Jamie and lasr name is Rice

select * from customer
where first_name = 'Jamie' AND last_name = 'Rice';

--If you want to know who paid the rental rate which amount is either less than 1USD or greater than 8USD.

select customer_id, amount from payment
where amount <1 or amount >8;

--A customer forgets their wallet at our store! we need to track down their email to reach out to him/her.
--Fortunately, we located an ID card in the wallet. Her name is name is Nancy Thomas

select first_name, last_name, email from customer
where first_name = 'Nancy' AND last_name = 'Thomas';

--Count statement

--couunt all film that we have

select count(*) from film

--Limit statements
--we want to limit the number of film_id to about 100

select film_id, title from film
limit 5;


--Order by
--the asc or desc
--asc

select first_name, last_name from customer
order by first_name asc

--desc
select first_name, last_name from customer
order by last_name desc;

--We want to get the top 10 highest paying customers

select customer_id, amount from payment
order by amount desc
limit 10;

--Between statement
--Get the customer_id and rental_id for payment that are between 8 and 9USD

select customer_id, rental_id, amount from payment
where amount >=8 AND amount <=9;

select customer_id, rental_id, amount from payment
where amount between 8 AND 9;

select customer_id, rental_id, amount from payment
where amount not between 8 AND 9;

--IN Statement
select customer_id, first_name, last_name from customer
where customer_id IN (120, 123, 125);

--NOT IN STATEMENT
select customer_id, first_name, last_name from customer
where customer_id NOT IN (120, 123, 125);


--LIKE
--It works with 2 symbols
-- % and -
-- "%" (all charcaters or everything)
-- "-" (single character)

--Your boss isn't sure of the name of a customer but just know that the name starts with jen

select first_name, last_name from customer
where first_name like 'Jen%';

--Your boss isn't sure of the name of a customer but just know that the name ends with er

select first_name, last_name from customer
where first_name like '%er';

--single characters '-'

select first_name, last_name from customer
where first_name like 'Jen__';

select first_name, last_name from customer
where first_name like 'J%er';

--aggregate function (works with group by)
--sum
--max
--min
--avg
--count

select sum(amount) from payment

select min(amount) from payment

select max(amount) from payment

--aggregate function and group by

select  customer_id, sum(amount) from payment
group by customer_id;

select  customer_id, count(amount) from payment
group by customer_id
order by count desc;

select  customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc;

select customer_id, sum(amount), count(amount), min(amount), max(amount) from payment
group by customer_id
order by sum(amount) desc;

--AS Statement
Select customer_id, sum(amount) AS total from Payment
group by customer_id;

--Having Statement
--Having is used to filter what we have grouped

--Customers spent above 200 dollars, how much have they spent actually


select customer_id, sum(amount) as total from payment
group by customer_id
having sum(amount) >200;

--We want to know the store that service 300 customers

select store_id, count(customer_id) from customer
group by store_id
having count(customer_id) >300;


--My boss wants to know the average rental rate of the ratings R, PG, G

select rating, avg(rental_rate) from film
group by rating
having rating IN ('R', 'PG', 'G');

--Joins
--Inner Join
--Left Join
--Right Join
--Full Join

--Inner Join

Select customer.customer_id, first_name, last_name, payment_id, payment.customer_id, amount
from customer INNER JOIN payment
ON customer.customer_id = payment.customer_id;

--Left join

Select customer.customer_id, first_name, last_name, payment_id, payment.customer_id, amount
from customer LEFT JOIN payment
ON customer.customer_id = payment.customer_id;

--Combine inventory and film table

select film.film_id, title, inventory_id, Inventory.film_id
from film LEFt JOIN Inventory
On film.film_id = Inventory.film_id;


--Creating tables

create table sales101(
    sales_id INT primary key,
    sales_name Varchar (50),
    amount float Not Null
    );
    
Insert into sales101 (sales_id, sales_name, amount)
values
('001', 'Lovelyn', '13000.25'),
('002', 'Toyosi',  '13000'),
('003', 'Dara', '10500.25');

select * from sales101

--Creating table 2

create table sales102(
    sales_id INT primary key,
    sales_name Varchar (50),
    amount float Not Null
    );
    
Insert into sales102 (sales_id, sales_name, amount)
values
('001', 'Lovelyn', '13000.25'),
('002', 'Toyosi',  '13000'),
('003', 'Dara', '10500.25'),
('004', 'Dami', '9000'),
('005', 'Helen', '10000.5');

select * from sales102

--Union
select * from sales101
Union
select * from sales102

select * from sales101
Union ALL
select * from sales102
