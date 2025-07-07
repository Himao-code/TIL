
-- ANY 여러 값들 중에 하나라도 조건을 만족하면 TRUE (OR)

-- 1. VIP 고객들의 최소 주문액 보다 높은 모든 주문

select
	customer_id,
    product_name,
    total_amount,
    '일반 고객이지만 vip 최소보다 높음' as 구분
from sales
where total_amount> (
	select min(s.total_amount) from sales s
    inner join customers c on s.customer_id=c.customer_id
    where c.customer_type='vip'
    ) and
customer_id not in (select customer_id from customers where customer_type = 'vip')
order by total_amount desc;

-- 어떤지역 평균 매출액 보다라도 높은 주문들
SELECT
	region,
    product_name,
    total_amount
FROM sales s
where total_amount > any(
	SELECT AVG(TOTAL_AMOUNT)
    FROM SALES
    GROUP BY REGION
)
ORDER BY TOTAL_AMOUNT DESC;

-- all 벡터의 모든 값들이 조건을 만족해야 통과


