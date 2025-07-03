USE lecture_db;
-- Scala-> 한개의 데이터
-- Vector -> 한줄로 이루어진 데이터

SELECT *from customers;

-- 모든 VIP의 id (c001, c005, c010, ...)
SELECT customer_id FROM customers WHERE customer_type = 'VIP';


-- 모든 vip의 주문내역

SELECT * 
from sales
where customer_id IN(
	SELECT customer_id from customers
    where customer_type = 'vip'
    )
    ORDER BY total_amout desc;
    
    
-- 전자제품을 구매한 고객들의 모든 주문

  SELECT DISTINCT customer_id
  FROM sales
  WHERE category = '전자제품';
  
  SELECT * from sales
  where customer_id in(SELECT DISTINCT customer_id
  FROM sales
  WHERE category = '전자제품') ;-- 구매했던 적인 있는
  



