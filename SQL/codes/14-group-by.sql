-- 카테고리별 매출 (피벗테이블 행=카테고리, 값=매출액)

SELECT 
	category as 카테고리,
    count(*) as 주문건수,
    sum(total_amount) as 월매출액
from sales
group by category;

-- 지역별 매출 분석
SELECT
	region as 지역,
	count(*) as 주문건수,
    sum(total_amount) as 매출액,
    -- 지역별 고객수
    count(distinct customer_id) as 고객수,
    count(*) / count(distinct customer_id) as 고객당주문수,
    round(
		sum(total_amount)/count(distinct customer_id)
	) as 고객당평균매출 
from sales
GROUP BY region;

-- 다중 그룹핑

SELECT
	region as 지역,
    category as 카테고리,
	count(*) as 주문건수,
    sum(total_amount) as 총매출액,
    round(avg(total_amount)) as 평균매출액
from sales
group by region, category
order by 지역, 총매출액 desc;

-- 영업사원(sales_rep) 별 성과

select
	sales_rep as 사원,
    date_format(order_date,'%Y-%m') as 월,
	COUNT(*) AS 주문건수,
    SUM(total_amount) AS 월매출액,
    round(avg(total_amount)) as 평균매출액
from sales
group by sales_rep, date_format(order_date, '%Y-%m')
order by 월, 월매출액;


-- 요일별 매출 패턴

select
	DAYNAME(ORDER_DATE) AS 요일,
    DAYOFWEEK(ORDER_DATE) AS 요일번호,
    COUNT(*) AS 주문건수,
    SUM(TOTAL_AMOUNT) AS 총매출액,
    ROUND(AVG(TOTAL_AMOUNT)) AS 평균매출액
FROM sales
GROUP BY DAYNAME(ORDER_DATE), DAYOFWEEK(ORDER_DATE)
ORDER BY 총매출액 DESC;

