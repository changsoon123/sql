
/* Drop Triggers */

DROP TRIGGER TRI_board_bno;
DROP TRIGGER TRI_lecture_lec_no;
DROP TRIGGER TRI_reply_rno;



/* Drop Tables */

DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE lec_order CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_board_bno;
DROP SEQUENCE SEQ_lecture_lec_no;
DROP SEQUENCE SEQ_reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_board_bno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_lecture_lec_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_rno INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admin
(
	-- id
	id varchar2(30) NOT NULL,
	updatedate date DEFAULT SYSDATE,
	PRIMARY KEY (id)
);


CREATE TABLE board
(
	bno number(10,0) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(2000) DEFAULT '',
	-- writer
	writer varchar2(30) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE lecture
(
	lec_no number(10,0) NOT NULL,
	teacher varchar2(30) DEFAULT 'null',
	subject varchar2(30) DEFAULT 'null',
	PRIMARY KEY (lec_no)
);


CREATE TABLE lec_order
(
	-- stu_id
	stu_id varchar2(30) NOT NULL,
	lec_no number(10,0) NOT NULL,
	orderdate date DEFAULT SYSDATE,
	PRIMARY KEY (stu_id, lec_no)
);


CREATE TABLE members
(
	-- id
	id varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	regdate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE reply
(
	-- 댓글 번호
	rno number(10,0) NOT NULL,
	-- 댓글 내용
	reply_con varchar2(500) NOT NULL,
	relydate date DEFAULT SYSDATE,
	bno number(10,0) NOT NULL,
	-- id
	writer varchar2(30) NOT NULL,
	PRIMARY KEY (rno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
;


ALTER TABLE lec_order
	ADD FOREIGN KEY (lec_no)
	REFERENCES lecture (lec_no)
;


ALTER TABLE admin
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE board
	ADD FOREIGN KEY (writer)
	REFERENCES members (id)
;


ALTER TABLE lec_order
	ADD FOREIGN KEY (stu_id)
	REFERENCES members (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (writer)
	REFERENCES members (id)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_board_bno BEFORE INSERT ON board
FOR EACH ROW
BEGIN
	SELECT SEQ_board_bno.nextval
	INTO :new.bno
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_lecture_lec_no BEFORE INSERT ON lecture
FOR EACH ROW
BEGIN
	SELECT SEQ_lecture_lec_no.nextval
	INTO :new.lec_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reply_rno BEFORE INSERT ON reply
FOR EACH ROW
BEGIN
	SELECT SEQ_reply_rno.nextval
	INTO :new.rno
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN admin.id IS 'id';
COMMENT ON COLUMN board.writer IS 'writer';
COMMENT ON COLUMN lec_order.stu_id IS 'stu_id';
COMMENT ON COLUMN members.id IS 'id';
COMMENT ON COLUMN reply.rno IS '댓글 번호';
COMMENT ON COLUMN reply.reply_con IS '댓글 내용';
COMMENT ON COLUMN reply.writer IS 'id';



