use lecture_db;

SELECT
	name,
    score as 원점수,
    round(score) as 반올림,
    round(score, 1) as 소수1반올림,
    CEIL(score) as 올림, 
    floor(score) as 내림,
    truncate(score, 1) as 소수1버림
    from dt_demo;
    
    -- 사칙연산
    SELECT
		10+5 as plus,
        10-5 as minus,
        10*5 as multiply,
        10/5 as divide,
        10 div 3 as 몫,
        10%3 as 나머지,
        MOD(10, 3) as 나머지2, 
		power(10, 3) as 거듭제곱,
        SQRT(16) AS 루트,
        abs(-10) as 절댓값;
        
SELECT
	id, name,
    id % 2 as 나머지,
    case
		when id % 2 = 0 then '짝수'
        else '홀수'
	end as 홀짝
from dt_demo;

-- 조건문 IF, CASE

-- if- o x구분할때
-- case - 좀더 세분화된 조건을 구분할때

SELECT 
	name, score,
    if(score >= 80, '우수', '보통') as 평가
from dt_demo;


SELECT
	name, score,
    case 
		when score >= 90 then 'A'
        when score >= 80 then 'b'
        when score >= 70 then 'c'
        else 'd'
	end as 학점
from dt_demo;

insert into dt_demo(name) VALUES('이상한');