{% set import_customer = select_tbl(source('optical-psyche-371410','Input_customer'), ref('in_customer')) %}
{% set import_orders = select_tbl(source('optical-psyche-371410','src_orders'), ref('in_orders')) %}


with customer as (
    select * from {{import_customer}}
),
orders as (
    select * from {{import_orders}}
),
final as (
     select  c_name as customer,
            count(o_orderkey) as Total_no_of_orders,
            max(o_orderdate) as Most_recent_order,
            sum(o_totalprice) as Total_price_of_orders 
     from customer cust
     inner join orders ord on cust.c_custkey = ord.o_custkey
     group by c_name
)
select *
from final