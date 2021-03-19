SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS NEW_TABLE;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS fboard;
DROP TABLE IF EXISTS mem;




/* Create Tables */

CREATE TABLE fboard
(
	board_num int NOT NULL,
	board_type varchar(40) NOT NULL,
	subject varchar(100),
	content varchar(4000),
	picture varchar(100),
	bdate datetime,
	readcnt int,
	like int,
	nick varchar(20) NOT NULL,
	PRIMARY KEY (board_num, board_type)
);


CREATE TABLE mem
(
	id varchar(20) NOT NULL,
	pass varchar(20) NOT NULL,
	name varchar(20),
	nick varchar(20) NOT NULL,
	email ,
	picture varchar(200),
	PRIMARY KEY (nick)
);


CREATE TABLE NEW_TABLE
(
	nick varchar(20) NOT NULL,
	board_num int NOT NULL,
	board_type varchar(40) NOT NULL
);


CREATE TABLE reply
(
	seq int NOT NULL,
	content varchar(1000),
	rdate ,
	nick varchar(20) NOT NULL,
	board_type varchar(40) NOT NULL,
	board_num int NOT NULL,
	PRIMARY KEY (seq)
);



/* Create Foreign Keys */

ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (board_num, board_type)
	REFERENCES fboard (board_num, board_type)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (board_type, board_num)
	REFERENCES fboard (board_type, board_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE fboard
	ADD FOREIGN KEY (nick)
	REFERENCES mem (nick)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (nick)
	REFERENCES mem (nick)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (nick)
	REFERENCES mem (nick)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



