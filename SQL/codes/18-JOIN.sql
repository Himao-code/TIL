-- 18-JOIN.sql
-- 고객정보 + 주문정보
USE lecture_db;

SELECT
  *,
  (
    SELECT customer_name FROM customers c
    WHERE c.customer_id=s.customer_id
  ) AS 주문고객이름,
  (
    SELECT customer_type FROM customers c
    WHERE c.customer_id=s.customer_id
  ) AS 고객등급
FROM sales s;

-- JOIN
SELECT
  COUNT(*)
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id;

-- 모든 고객의 구매 현황 분석(구매를 하지 않았어도 분석)
-- LEFT JOIN -> 왼쪽 테이블(c) 의 모든 데이터와 + 매칭되는 오른쪽 데이터 | 매칭되는 오른쪽 데이터 (없어도 등장)
SELECT
  c.customer_id,
  count(*) as 주문횟수,
  sum(total_amount)
FROM customers c 
LEFT JOIN sales s ON c.customer_id = s.customer_id
group by c.customer_id, c.customer_name, c.customer_type; 

SELECT
	c.customer_id,
    c.customer_name,
    c.customer_type,
    count(*) as 구매건수,
    -- coalesce()=if 같은 경우 coalesce(첫번째 값, 10)-> 첫번째 값이 null 인경우, 10을 쓴다.
    coalesce(avg(s.total_amount), 0) as 총구매액,
    avg(s.total_amount) as 평균구매액,
    case 
		when count(*) = 0 then '잠재고객'
        when count(*) >= 10 then '충성고객'
        when count(*) = 3 then '일반고객'
        else '신규고객'
        end as 활성도
from customers c
left join sales s on c.customer_id = s.customer_id
GROUP BY  c.customer_id;

-- INNER JOIN
SELECT 
    '1. INNER JOIN' AS 구분,
    COUNT(*) AS 줄수,
    COUNT(DISTINCT c.customer_id) AS 고객수
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id

union
-- LEFT JOIN 왼쪽(FROM 뒤에 온)테이블은 무조건 다나옴
SELECT
	'2. LEFT JOIN' AS 구분,
    COUNT(*) as 줄수,
    count(DISTINCT c.customer_id) as 고객수
from customers c
left join sales s on c.customer_id = s.customer_id

UNION 

SELECT
  '3. 전체 고객수' AS 구분,
  COUNT(*) AS 행수,
  COUNT(*) AS 고객수
FROM customers;
