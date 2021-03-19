SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS fboard;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE fboard
(
	num int NOT NULL,
	subject varchar(100),
	content varchar(4000),
	picture varchar(100),
	bdate datetime,
	readcnt int,
	nick varchar(20) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE member
(
	id varchar(20) NOT NULL,
	pass varchar(20) NOT NULL,
	name varchar(20),
	nick varchar(20) NOT NULL,
	email varchar(50),
	check int,
	location varchar(50),
	PRIMARY KEY (nick)
);


CREATE TABLE reply
(
	no int NOT NULL,
	content varchar(1000),
	rdate ,
	num int NOT NULL,
	nick varchar(20) NOT NULL,
	PRIMARY KEY (no)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (num)
	REFERENCES fboard (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE fboard
	ADD FOREIGN KEY (nick)
	REFERENCES member (nick)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (nick)
	REFERENCES member (nick)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



