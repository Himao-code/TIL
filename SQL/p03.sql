use practice_db;
SELECT * from userinfo;
ALTER table members add column email int not null DEFAULT 40;
ALTER TABLE userinfo ADD COLUMN email VARCHAR(40) NOT NULL UNIQUE DEFAULT 'es@gmail.com';
ALTER TABLE userinfo 
ADD COLUMN email VARCHAR(40) DEFAULT 'es@gmail.com';
ALTER TABLE userinfo
MODIFY COLUMN nikname VARCHAR(100);
ALTER TABLE userinfo
DROP COLUMN reg_date;
SELECT * FROM userinfo WHERE name = '박관지';
UPDATE userinfo
SET email = 'now@gmail.com'
WHERE id = 2;
