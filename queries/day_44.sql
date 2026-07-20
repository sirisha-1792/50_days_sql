use 50_days_sql_challenge;

--1. total customers
select count(*) as total_customers
from clean_customers;
--count(*) : counts all row including the null values

--2. total number of orders
select count(*) as total_orders
from clean_orders;

--3. total revenue
select sum(payment_amount) as revenue
from clean_payments;

--4. avg order value
select avg(payment_amount) as avg_order_value
from clean_payments;

--5. total products sold
select sum(quantity) as total_prod_sold
from clean_order_details;

--6. orders per customer
select customer_id, count(order_id) as order_per_customer
from clean_orders
group by customer_id;