-- 데이터 무결성 검사(양쪽에 비어있는 데이터 찾기)
-- mysql에는 full outer join

use lecture_db;

select 
	'left에서' as 출처,
	c.customer_name,
    s.product_name
from customers c
left join sales s on c.customer_id=s.customer_id

union

select 
	'rignt에서' as 출처,
	c.customer_name,
    s.product_name

from customers c
right join sales s on c.customer_id=s.customer_id
where c.customer_id is null;