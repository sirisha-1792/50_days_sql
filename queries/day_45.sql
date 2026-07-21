use 50_days_sql_challenge;

--1. Top customers by orders: Find customers who placed the most orders
select c.customer_id, c.customer_name, count(o.order_id) as total_orders
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_orders desc;

--2. Top customers by revenue: 
select c.customer_id, c.customer_name, sum(p.payment_amount) as total_revenue
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by total_revenue desc;

--3. Customers with no orders
select c.customer_id, c.customer_name
from clean_customers c
left join clean_orders o
on c.customer_id = o.customer_id
where o.order_id is null;

--4. new customers trend
select month(signup_date) as month_no,
       monthname(signup_date) as month_name,
       count(customer_id) as new_customers
    from clean_customers
    group by month(signup_date), monthname(signup_date)
    order by month_no;

--5. repeat customers
select customer_id, count(order_id) as total_orders
from clean_orders
group by customer_id
having count(order_id) > 1;

--6. customer lifetime value
select c.customer_id, c.customer_name, sum(p.payment_amount) as lifetime_value
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by lifetime_value desc;

--7. avg spend per customer
select c.customer_id, c.customer_name, avg(p.payment_amount) as avg_spend
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_name;

--8. customers per city
select city, count(customer_id) as total_customers
from clean_customers
group by city
order by total_customers desc;