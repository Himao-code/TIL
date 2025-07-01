-- SELECT 컬럼
-- FROM 테이블
-- WHERE 조건
-- ORDER BY 정렬기준
-- LIMIT 개수
USE lecture_db;
drop TABLE students;
CREATE TABLE students (
id INT AUTO_INCREMENT PRIMARY key,
name VARCHAR(20),
age INT
);

DESC students;

insert into students (name, age) VALUES
('박관지', 28),
('김민지', 30),
('김은진', 40),
('김사랑', 50),
('김마오', 12),
('김희동', 75),
('김준호', 29);

select*from students WHERE name='박관지';
select*from students where age>=20; -- 이상
select*from students where age>20;  -- 초과
select*from students where id <>1; -- 해당 조건(id=1)이 아닌
select*from students where id !=1; -- 해당 조건(id=1)이 아닌
select*from students where AGE BETWEEN 20 AND 40; -- 나이가 20 이상 40 이하
select*from students where id IN (1 , 3, 5); -- ID 가 1, 3, 5 인
-- 문자열 패턴(%-> 있을 수도 없을수도 있다. __> 정확히 개수만큼 글자가 있다)
select*from students where NAME LIKE '김%';
select*from students where NAME LIKE '%마%'; -- "마"자가 들어가는 사람
select*from students where NAME LIKE '마%';  -- "마"로 시작하는 사람
select*from students where NAME LIKE '%마';  -- "마"로 끝나는 사람
select*from students where NAME LIKE '김__';  -- 정확하게 김00인 사람









