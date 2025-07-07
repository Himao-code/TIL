use practice_db;


CREATE TABLE sales AS SELECT * FROM lecture_db.sales;
CREATE TABLE products AS SELECT * FROM lecture_db.products;
CREATE TABLE customers AS SELECT * FROM lecture_db.customers;

SELECT count(*) from sales
UNION
select count(*) from customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로[고객명, 상품명, 주문금액]을 보여주자.

SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;

-- 고객 유형별 [고객유형, 주문건수, 평균주문금액]을 평균주문금액 높은순으로 정렬해서 보여주자 

SELECT
  c.customer_type AS 고객유형,
  COUNT(s.id) AS 주문건수,
  ROUND(AVG(s.total_amount)) AS 평균주문금액
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type
ORDER BY 평균주문금액 DESC;


-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객이름,
  s.product_name AS 상품명
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT *
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP';

-- 문제 4: 50만원 이상 주문한 기업 고객들
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = '기업'
  AND s.total_amount >= 500000;
  
-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.order_date AS 주문일,
  s.total_amount AS 주문금액
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
WHERE s.category = '전자제품'
  AND s.order_date BETWEEN '2024-07-01' AND '2024-12-31';
  
-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]
   
   SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  COUNT(s.id) AS 주문횟수,
  SUM(s.total_amount) AS 총구매액,
  ROUND(AVG(s.total_amount)) AS 평균구매액,
  MAX(s.order_date) AS 최근주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.customer_type
ORDER BY 총구매액 DESC;
   
-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  COUNT(s.id) AS 주문횟수,
  SUM(s.total_amount) AS 총구매액,
  ROUND(AVG(s.total_amount)) AS 평균구매액,
  MAX(s.order_date) AS 최근주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.customer_type;

-- 문제 8: 상품 카테고리별로 고객 유형 분석
SELECT
  s.category AS 상품카테고리,
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문횟수,
  SUM(s.total_amount) AS 총구매액
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY s.category, c.customer_type
ORDER BY s.category, 주문횟수 DESC;

-- 문제 9: 고객별 등급 분류
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  COUNT(s.id) AS 주문횟수,
  SUM(s.total_amount) AS 총구매액,

  -- 활동등급 (구매횟수 기준)
  CASE
    WHEN COUNT(s.id) = 0 THEN '잠재고객'
    WHEN COUNT(s.id) < 3 THEN '브론즈'
    WHEN COUNT(s.id) < 5 THEN '실버'
    WHEN COUNT(s.id) < 10 THEN '골드'
    ELSE '플래티넘'
  END AS 활동등급,

  -- 구매등급 (총구매액 기준)
  CASE
    WHEN SUM(s.total_amount) = 0 THEN '신규'
    WHEN SUM(s.total_amount) < 100000 THEN '일반'
    WHEN SUM(s.total_amount) < 200000 THEN '우수'
    WHEN SUM(s.total_amount) < 500000 THEN '최우수'
    ELSE '로얄'
  END AS 구매등급

FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.customer_type
ORDER BY 총구매액 DESC;

-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석

