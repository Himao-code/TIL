USE LECTURE_DB;
SELECT * FROM dt_demo;
INSERT INTO dt_demo(id, name, nikname, birth, score, salary, description, is_active, created_at)
VALUES (6, '김준호', 'choi', '1997-09-21', 70, 50000000, '박관지 남편', 1 , now());

-- 현재 날짜/시간
-- 날짜 + 시간
SELECT now() AS 지금시간;
SELECT current_timestamp();
SELECT current_date();
SELECT current_time();

SELECT 
	name,
    birth AS 원본,
    DATE_FORMAT(birth, '%y년 %m월 %d일') AS 한국식,
    DATE_FORMAT(birth, '%Y-%m') AS 년월,
    DATE_FORMAT(birth, '%M %d %Y') AS 영문식,
    DATE_FORMAT(birth, '%w') AS 요일번호,
    DATE_FORMAT(birth, '%w') AS 요일이름 
    from dt_demo;
    
    SELECT created_at AS 원본시간,
    date_format(created_at, '%y-%m-%d %h:%i') AS 분까지만,
    date_format(created_at, '%p %h:%i') AS 12시간
    FROM dt_demo;
    
    -- 날짜 계산 함수
    
    SELECT
		name,
        birth,
        datediff('2025-07-01', '2025-07-02')
	from dt_demo;
    
-- 오늘 날짜 계산 함수
SELECT
		name,
        birth,
        datediff(curdate(), birth) AS 살아온날들,
        timestampdiff(year, birth, curdate()) as 나이
	from dt_demo;
    
    -- 더하기/빼기
    
	SELECT
		name, birth,
        date_add(birth, interval 100 day) as 백일후,
        date_add(birth, interval 1 year) as 돌,
        date_sub(curdate(), interval 1 month) as 한달전
	from dt_demo;
    
    -- 계정 생성 후 경과 시간
    SELECT
		name, created_at,
        timestampdiff(hour, created_at, now()) AS 가입후시간,
        timestampdiff(day, created_at, now()) AS 가입후일수
from dt_demo;

-- 날짜 추출
SELECT
	NAME, 
    BIRTH,
    YEAR(birth),
    month(birth),
    day(birth),
    dayofweek(birth) as 요일번호,
    quarter(birth) as 분기 ,   
    dayname(birth) AS 요일
from dt_demo;

-- 월별, 연도별 카운트 하기

SELECT
	YEAR(BIRTH) AS 출생년도, 
    COUNT(*) AS 인원수
FROM DT_DEMO
GROUP BY YEAR(BIRTH)
ORDER BY 출생년도; 
    
    