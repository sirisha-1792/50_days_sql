use 50_days_sql_challenge;

--1. create clean tables
create table clean_customers (
    customer_id varchar(50), 
    customer_name varchar(50),
    city varchar(50), 
    signup_date varchar(50)
);
insert into clean_customers 
select * from raw_customers;

create table clean_orders 
select * from raw_orders;

create table clean_products
select * from raw_products;

create table clean_order_details
select * from raw_order_details;

create table clean_payments
select * from raw_payments;

--a. for cleaned_customers
-- Remove spaces
update clean_customers set
    customer_id = TRIM(customer_id),
    customer_name = TRIM(customer_name),
    city = TRIM (city),
    signup_date = trim (signup_date);

-- Standardize the text where the data is string
update clean_customers set
    customer_name = UPPER(customer_name),
    city = UPPER (city);

-- Replace  NULL values
update clean_customers set
    city = 'UNKNOWN'
    where city is null;
update clean_customers set
    customer_name = 'UNKNOWN'
    where customer_name is null;
update clean_customers set
    signup_date = '01-01-2024'
    where signup_date is null;

-- remove the duplicates
delete from clean_customers
where customer_id in(
    select customer_id from(
        select customer_id, 
        row_number() over (partition by customer_id order by customer_id) as rn
        from clean_customers
    ) t
    where rn > 1
); 

--b. for cleaned_orders
 -- Remove spaces
update clean_order_details set
    order_detail_id = TRIM(order_detail_id),
    order_id = TRIM(order_id),
    product_id = TRIM (product_id),
    quantity = trim (quantity);

-- Standardize the text where the data is string
--no string text

-- Replace  NULL values
update clean_order_details set
    order_detail_id = 'UNKNOWN'
    where order_detail_id is null;
update clean_order_details set
    product_id = 'UNKNOWN'
    where product_id is null;
update clean_order_details set
    quantity = 'UNKNOWN'
    where quantity is null;

-- remove the duplicates
delete from clean_order_details
where order_detail_id in(
    select order_detail_id from(
        select order_detail_id, 
        row_number() over (partition by order_detail_id order by order_detail_id) as rn
        from clean_order_details
    ) new
    where rn > 1
); 

--c. for clean_orders
 -- Remove spaces
update clean_orders set
    order_id = TRIM(order_id),
    customer_id = TRIM (customer_id),
    order_date = trim (order_date);

-- Standardize the text where the data is string
--no string text

-- Replace  NULL values
update clean_orders set
    order_id = 'UNKNOWN'
    where order_id is null;
update clean_orders set
    customer_id = 'UNKNOWN'
    where customer_id is null;
update clean_orders set
    order_date = '01-01-2-20'
    where order_date is null;

-- remove the duplicates
delete from clean_orders
where order_id in(
    select order_id from(
        select order_id, 
        row_number() over (partition by order_id order by order_id) as rn
        from clean_orders
    ) new_table
    where rn > 1
); 

--d.. for cleaned_payments
-- Remove spaces
update clean_payments set
    payment_id = TRIM(payment_id),
    order_id = TRIM(order_id),
    payment_amount = TRIM (payment_amount),
    payment_date = trim (payment_date);

-- Standardize the text where the data is string
--no string text

-- Replace  NULL values
update clean_payments set
    payment_amount = 'UNKNOWN'
    where payment_amount is null;
update clean_payments set
    order_id = 'UNKNOWN'
    where order_id is null;
update clean_payments set
    payment_date = '01-01-2024'
    where payment_date is null;

-- remove the duplicates
delete from clean_payments
where payment_id in(
    select payment_id from(
        select payment_id, 
        row_number() over (partition by payment_id order by payment_id) as rn
        from clean_payments
    ) t
    where rn > 1
); 

--e. for clean_products
-- Remove spaces
update clean_products set
    product_id = TRIM(product_id),
   product_name = TRIM(product_name),
    category = TRIM (category),
    price= trim (price);

-- Standardize the text where the data is string
update clean_products set
   product_name = UPPER(product_name),
    category = UPPER (category);

-- Replace  NULL values
update clean_products set
    category = 'UNKNOWN'
    where category is null;
update clean_products set
   product_name = 'UNKNOWN'
    where product_name is null;
update clean_products set
    price= 'unknown'
    where price is null;

-- remove the duplicates
delete from clean_products
where product_id in(
    select product_id from(
        select product_id, 
        row_number() over (partition by product_id order by product_id) as rn
        from clean_products
    ) t
    where rn > 1
); 