CREATE USER c##jsptest IDENTIFIED BY 1234;


CREATE TABLE usertb(
	uidx NUMBER PRIMARY key,
	id VARCHAR2(50) NOT NULL unique,
	PASSWORD VARCHAR2(50) NOT null,
	NAME VARCHAR2(20) NOT null,
	addr VARCHAR2(100)
);

CREATE SEQUENCE uidx_seq START WITH 1 INCREMENT BY 1;

drop TABLE usertb;


CREATE TABLE sampleTB(
	sidx NUMBER PRIMARY key,
	title VARCHAR2(100) NOT null,
	content VARCHAR2(4000) NOT null,
	writer VARCHAR2(20) NOT null,
	wdate date
);

CREATE SEQUENCE sidx_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE boardtb(
	bidx NUMBER PRIMARY KEY,
	title VARCHAR2(550) NOT null,
	content VARCHAR2(4000) NOT null,
	uidx NUMBER NOT null,
	hit NUMBER DEFAULT 0 NOT null,
	wdate DATE DEFAULT SYSDATE NOT null,
	CONSTRAINT FK_boardtb FOREIGN KEY (uidx) REFERENCES usertb(uidx)
);

CREATE SEQUENCE bidx_seq START WITH 1 INCREMENT BY 1;

TRUNCATE TABLE boardtb;

select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE bidx=162;

UPDATE BOARDTB SET TITLE=111, CONTENT=111 WHERE BIDX=162;

COMMIT; -- 항상 커밋 빼먹지 말것. 커밋 안한 상태로 놔두면 다른쪽에서 DB 수정 못 함
UPDATE BOARDTB SET HIT=2 WHERE BIDX=162;

DELETE FROM boardtb WHERE bidx=162;

--로그인 쿼리문
select * from usertb where id = 'asdf' and password = '1234';

select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE content LIKE '%?%';
select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE title LIKE '%?%';
select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE name LIKE '%?%';