use 50_days_sql_challenge;

--1. Top 5 customers using cte
with customer_revenue as (
    select c.customer_id, c.customer_name, sum(p.payment_amount) as total_revenue
    from clean_customers c 
    join clean_orders o
    on c.customer_id = o.customer_id
    join clean_payments p
    on o.order_id = p.order_id
    group by c.customer_id, c.customer_name
)
select * from customer_revenue
order by total_revenue
limit 5;

--2. top 5 products using cte
with product_sales as(
    select p.product_id, p.product_name, sum(od.quantity) as total_sold
    from clean_products p
    join clean_order_details od
    on p.product_id = od.product_id
    group by p.product_id, p.product_name
)
select * from product_sales
order by total_sold desc 
limit 5;

---3. Rank customer by revenue
select 
    c.customer_id, c.customer_name, 
    sum(p.payment_amount) as total_revenue,
    dense_rank() over(order by sum(p.payment_amount) desc) as customer_rank
from clean_customers c
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id, c.customer_name;

--4. rank products by quantity sold
select p.product_name, sum(od.quantity) as total_quantity,
    rank() over(order by sum(od.quantity) desc) as product_rank
from clean_products p
join clean_order_details od
on p.product_id = od.product_id
group by p.product_name;

--5. Revenue per category
with category_revenue as(
    select p.category, sum(p.price * od.quantity) as revenue
    from clean_products p
    join clean_order_details od
    on p.product_id = od.product_id
    group by p.category
)
select * from category_revenue
order by revenue desc;

--6. revenue comparison using case
select c.customer_id, sum(p.payment_amount) as total_spent,
    case
        when sum(p.payment_amount) > 5000 then "High Revenue"
        when sum(p.payment_amount) between 2000 and 5000 then "Medium Revenue"
        else "Low Revenue"
    end as revenue_category
from clean_customers c 
join clean_orders o
on c.customer_id = o.customer_id
join clean_payments p
on o.order_id = p.order_id
group by c.customer_id

--7. Stored Procedure
create procedure customer_revenue_report()
begin
    select c.customer_id, c.customer_name, sum(p.payment_amount) as total_revenue
    from clean_customers c 
    join clean_orders o
    on c.customer_id = o.customer_id
    join clean_payments p
    on o.order_id = p.order_id
    group by c.customer_id, c.customer_name
    order by total_revenue desc;
end;

call customer_revenue_report();