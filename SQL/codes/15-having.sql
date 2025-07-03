use lecture_db;

select
	CATEGORY,
    COUNT(*) AS 주문건수,
    SUM(TOTAL_AMOUNT) AS 총매출액
FROM SALES
WHERE TOTAL_AMOUNT >= 100000
GROUP BY CATEGORY;

SELECT
	category,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출액
FROM sales
GROUP BY category
HAVING 총매출액 >= POWER(10, 7);

-- 활성 지역 찾기(주문건수>= 10, 고객수>= 5)
SELECT
	region AS 지역,
    COUNT(*) AS 주문건수,
    COUNT(DISTINCT customer_id) AS 고객수,
    SUM(total_amount) AS 총매출액,
    ROUND(AVG(total_amount)) AS 평균주문액
FROM sales
GROUP BY region
HAVING 주문건수 >= 20 AND 고객수 >= 15;

