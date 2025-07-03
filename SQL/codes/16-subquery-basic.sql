use lecture_db;

-- 매출평균의 평균보다 더 높은 금액을 주문한 판매데이터(*) 보여줘 
SELECT avg(total_amount) from sales;

SELECT * from sales where total_amount > 612862;

SELECT * from sales
where total_amount > (SELECT avg(total_amount) from sales);

-- 평균을 따로 구해야 하는건 같은데, 평균을 외워서 써야하니까 그냥 식을 () 써브퀄 안에 넣은거임


SELECT
	product_name as 이름,
    total_amount as 판매액,
	total_amount -(SELECT avg(total_amount) from sales) as 평균차이
from sales;

-- 데이터가 여러개 나오는 경우
SELECT * from sales;
-- 데이터가 하나 나오는 경우
SELECT avg(quantity) from sales;

-- sales에서 가장 비싼 걸 시킨 주문
SELECT * FROM sales
where total_amount=(SELECT
-- 가장 최근 주문일의 주문데이터

SELECT * FROM sales
ORDER BY order_date asc
LIMIT 1;

-- 가장 평균과 유사한 주문데이터 5개

SELECT *,
       ABS(total_amount - (SELECT AVG(total_amount) FROM sales)) AS 편차
FROM sales
ORDER BY 편차 desc
LIMIT 5;

