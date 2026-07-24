use 50_days_sql_challenge;

--1. Total revenue
select sum(payment_amount) as total_revenue
from clean_payments;

--2. Revenue per date
select payment_date, sum(payment_amount) as total_revenue
from clean_payments
group by payment_date
order by payment_date;

--3. revenue by month
select month(payment_date) as month_no,
       monthname(payment_date) as month_name,
       sum(payment_amount) as total_revenue
from clean_payments
group by month(payment_date), monthname(payment_date) 
order by month_no;

--4. revenue by product 
select p.product_id, p.product_name, sum(p.price * od.quantity) as total_revenue
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_id, p.product_name
order by total_revenue desc;

--5. Revenue by customer
select c.customer_id, c.customer_name, sum(p.payment_amount) as customer_revenue
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by customer_revenue desc;

--6. Revenue by customer
select pr.category, sum(pr.price * od.quantity) as total_revenue
from clean_products pr
join clean_order_details od
on pr.product_id = od.product_id
group by pr.category
order by total_revenue desc;

--7. High Revenue Days
select payment_date, sum(payment_date) as total_revenue
from clean_payments
group by payment_date
order by total_revenue desc;