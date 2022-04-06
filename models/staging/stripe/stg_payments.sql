select 
    id as payment_id,
    orderid as order_id,
    amount/100   
from raw.stripe.payment
where status='success'