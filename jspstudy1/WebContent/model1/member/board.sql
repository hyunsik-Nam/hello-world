CREATE TABLE board(
	num INT PRIMARY KEY,
	NAME VARCHAR(30),
	pass VARCHAR(20),
	subject VARCHAR(100),
	content VARCHAR(4000),
	file1 VARCHAR(100),
	regdate DATETIME,
	readcnt INT(10),
	grp INT,
	grplevel INT(3),
	grpstep INT(5)
	)