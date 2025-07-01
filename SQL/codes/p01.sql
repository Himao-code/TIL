use practice_db;
 create TABLE userinfo (
	id int AUTO_INCREMENT PRIMARY KEY,
    nikname VARCHAR(20) NOT NULL,
    phone VARBINARY(11) UNIQUE,
    reg_date DATE DEFAULT(current_date)
);

DESC userinfo;