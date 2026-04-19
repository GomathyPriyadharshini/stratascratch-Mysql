-- Problem:
-- Find order details made by Jill and Eva.
-- Output order date, order details, cost, and first name.
-- Order results by customer id in ascending order.

-- Pattern: JOIN + Filtering
-- Technique: INNER JOIN + WHERE IN + ORDER BY
-- Time complexity idea: O(n) with join

select c.first_name,
       o.order_date,
       o.order_details,
       o.total_order_cost
from customers c
inner join orders o
    on c.id = o.cust_id
where c.first_name in ('Jill', 'Eva')
order by c.id asc;
