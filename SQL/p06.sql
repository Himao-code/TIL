-- p06.sql

USE practice_db;

SELECT * FROM userinfo;

-- 별명 길이 확인
SELECT nikname, length(nikname) from userinfo;
-- 별명 과 email 을 '-' 로 합쳐서 info (가상)컬럼으로 확인해 보기
SELECT nikname, email, CONCAT(nikname, '-', email) AS info FROM userinfo;
-- 별명 은 모두 대문자로, email은 모두 소문자로 확인
SELECT upper(nikname) as 대문자, LOWER(email) AS 소문자 FROM userinfo;
-- email 에서 gmail.com 을 naver.com 으로 모두 new_email 컬럼으로 추출
SELECT email, replace(email, 'gmail.com','naver.com') as new_email FROM userinfo;
-- email 앞에 붙은 단어만 username 컬럼 으로 확인

select email, locate('@', email) from userinfo;
select substring(email, 1, locate('@', email)) from userinfo;

SELECT email, SUBSTRING(email, 1, LOCATE('@', email) - 1) AS username FROM userinfo;
-- (추가 과제 -> email 이 NULL 인 경우 'No Mail' 이라고 표시




'hi@a.com'




