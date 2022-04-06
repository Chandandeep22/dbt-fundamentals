with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
),
fact_orders as (

    select order_id,
        customer_id,
        sum(amount)
    from customers left outer join orders using(customer_id)
left outer join payments using(order_id)
group by 1,2
)
select * from fact_orders