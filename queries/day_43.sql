use 50_days_sql_challenge;

--1. date formatting
update clean_payments set payment_date = 
case
    when cast(substring(payment_date,1,2) as unsigned) > 12 then
    date_format(
        str_to_date(payment_date, '%d-%m-%Y'), '%Y-%m-%d'
    )
    when cast(substring(payment_date,4,2) as unsigned) > 12 then
    date_format(
        str_to_date(payment_date, '%d-%m-%Y'), '%Y-%m-%d'
    )
    else payment_date
end;

update clean_payments set
    payment_date = date_format(
        str_to_date(payment_date, '%d-%m-%Y'), '%Y-%m-%d'
    );

--modify the data types
alter table clean_customers
    modify customer_id int primary key,
    modify customer_name varchar(100),
    modify city varchar(100),
    modify signup_date date;

alter table clean_products
    modify product_id int primary key,
    modify product_name varchar(100),
    modify category varchar(100),
    modify price decimal(10,2);

alter table clean_orders
    modify order_id int primary key,
    modify customer_id int,
    modify order_date date;
alter table clean_orders 
    add constraint fk_customer
    foreign key (customer_id)
    references clean_customers(customer_id);

alter table clean_order_details
    modify order_detail_id int primary key,
    modify order_id int,
    modify product_id int,
    modify quantity int;
alter table clean_order_details 
    add constraint fk_order
    foreign key (order_id)
    references clean_orders(order_id);

alter table clean_payments
    modify payment_id int primary key,
    modify order_id int,
    modify payment_amount decimal(10,2),
    modify payment_date date;
alter table clean_payments 
    add constraint fk_payment_order
    foreign key (order_id)
    references clean_orders(order_id);