use 50_days_sql_challenge;

--1. Top selling products
select p.product_id, p.product_name, sum(od.quantity) as total_quantity_sold
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc;

--2. Least selling product
select p.product_id, p.product_name, sum(od.quantity) as total_quantity_sold
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_id, p.product_name
order by total_quantity_sold asc;

--3. Revenue per product
select p.product_id, p.product_name, sum(p.price * od.quantity) as total_revenue
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_id, p.product_name
order by total_revenue desc;

--4. Category wise sales
select p.category, sum(p.price * od.quantity) as category_sales
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_id, p.product_name
order by category_sales desc;

--5. Most Expensive Product sold 
select distinct p.product_id, p.product_name, p.price
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
order by p.price desc
limit 1;

--6. Ang Price Category
select category, avg(price) as avg_price
from clean_products
group by category 
order by avg_price desc;

--7. product demand trend
select p.product_name, o.order_date, sum(od.quantity) as total_quantity
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
join clean_orders o
on o.order_id = od.order_id
group by p.product_name, o.order_date
order by o.order_date;