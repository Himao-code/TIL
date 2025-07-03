use practice_db;

create table dt_demo2 as select *from lecture_db.dt_demo;

SELECT * FROM dt_demo2;


SELECT
	id,
    name,
	ifnull(nikname, '미설정') as 닉네임,
    CONCAT(YEAR(birth), '년생') AS 출생년도,
	TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS 나이,
    ROUND(IFNULL(score, 0), 1) AS 점수,
CASE
    WHEN score >= 90 THEN 'A'
    WHEN score >= 80 THEN 'B'
    WHEN score >= 70 THEN 'C'
    ELSE 'D'
  END AS 등급,
CASE
    WHEN is_active = 1 THEN '활성'
    ELSE '비활성'
  END AS 상태,
 CASE
    WHEN TIMESTAMPDIFF(YEAR, birth, CURDATE()) < 30 THEN '청년'
    WHEN TIMESTAMPDIFF(YEAR, birth, CURDATE()) < 50 THEN '청장년'
    ELSE '장년'
  END AS 연령대
FROM dt_demo2;














