use 50_days_sql_challenge;

--1. orders per day
select order_date, count(order_id) as total_orders 
from clean_orders
group by order_date
order by order_date;

--2. orders per month
select MONTH(order_date) AS month_no, MONTHNAME(order_date) as month_name, count(order_id) as total_orders 
from clean_orders
group by MONTH(order_date), MONTHNAME(order_date)
order by month_no;

--3. Highest order value
select o.order_id, sum(p.payment_amount) as order_value
from clean_orders o
join clean_payments p
on o.order_id = p.order_id
group by o.order_id
order by order_value DESC
limit 1;

--4. Lowest order value
select o.order_id, sum(p.payment_amount) as order_value
from clean_orders o
join clean_payments p
on o.order_id = p.order_id
group by o.order_id
order by order_value ASC
limit 1;

--5. Avg order size
select avg(order_quantity) as avg_order_size
from(
    select order_id, sum(quantity) as order_quantity
    from clean_order_details
    group by order_id
) t;

--6. order distribution
select 
    CASE
        when quantity <= 2    then 'Small Order'
        when quantity <= 5    then 'Medium Order'
        else 'Large Order'
    end as order_type,
    count(*) as total_orders
from clean_order_details
group by order_type;

--7. peak ssales day
select order_date, count(order_id) as total_orders 
from clean_orders
group by order_date
order by total_orders DESC
limit 1;