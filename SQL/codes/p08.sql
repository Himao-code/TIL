use practice_db;

create table sales as SELECT * from lecture_db.sales;
create TABLE products as SELECT * from lecture_db.products;
create TABLE products as SELECT * from lecture_db.customers;

SELECT * FROM products;
SELECT * FROM sales;

-- 단일값 서브쿼리

-- 1. 평균 이상 매출 주문들(성과가 좋은 주문들)

SELECT AVG(total_amount) AS 평균매출
FROM sales;

SELECT *
FROM sales
WHERE total_amount >= (
  SELECT AVG(total_amount)
  FROM sales
);
-- 2. 최고 매출 지역의 모든 주문들

SELECT * FROM sales
WHERE region = (
  SELECT region FROM sales
  GROUP BY region
  ORDER BY SUM(total_amount) DESC
  LIMIT 1
);
-- 3. 각 카테고리에서 [카테고리별 평균] 보다 높은 주문들

-- 여러데이터 서브쿼리
-- 1. 기업 고객들의 모든 주문 내역

-- 2. 재고 부족(50개 미만) 제품의 매출 내역
SELECT * FROM sales
WHERE product_name IN (
  SELECT product_name
  FROM products
  WHERE stock_quantity < 50
);

SELECT product_id
FROM products
WHERE stock_quantity < 50;
-- 3. 상위 3개 매출 지역의 주문들

SELECT *
FROM sales
WHERE region IN (
  SELECT region
  FROM sales
  GROUP BY region
  ORDER BY SUM(total_amount) DESC
  LIMIT 3
);
-- 4. 상반기(24-01-01 ~ 24-06-30) 에 주문한 고객들의 하반기(0701~1231) 주문 내역