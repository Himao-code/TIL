create table sample (name varchar(30), age int);

drop TABLE members;
show tables;
CREATE TABLE members (
	id int AUTO_INCREMENT PRIMARY KEY, --  회원 고유번호(정수, 자동증가)
    name VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE DEFAULT(current_date) 
);
SHOW TABLES;
DESC MAMBERS;
DESC members;