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

--
COMMIT; -- 항상 커밋 빼먹지 말것. 커밋 안한 상태로 놔두면 다른쪽에서 DB 수정 못 함
--로그인 쿼리문
select * from usertb where id = ? and password = ?;
--게시판 view 조인 쿼리문
select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx = ?;
--검색 쿼리문
select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE content LIKE '%?%';
select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE title LIKE '%?%';
select * from boardtb b inner join usertb u on b.uidx = u.uidx WHERE name LIKE '%?%';
--조회수+1 쿼리문
UPDATE BOARDTB SET HIT=HIT+1 WHERE BIDX=?;

--게시물 수정 쿼리
UPDATE BOARDTB SET TITLE=?, CONTENT=? WHERE BIDX=?;
--게시물 삭제 쿼리
DELETE FROM boardtb WHERE bidx=?;
-- 페이징용 쿼리
SELECT a.*, ROWNUM r from (SELECT * FROM BOARDTB) a WHERE ROWNUM <= 10;
-- where절로 범위 지정
SELECT b.* FROM (SELECT a.*, ROWNUM r from (SELECT * FROM BOARDTB) a WHERE ROWNUM <= 10) b WHERE b.r >= 6;
--rownum은 가상의 컬럼이기때문에 범위지정 못하므로 다시 서브쿼리로 감쌈
SELECT c.*
	FROM (SELECT a.*, ROWNUM r
		from (select *
					from boardtb b
					inner join usertb u
					on b.uidx = u.uidx
					ORDER BY b.bidx desc) a
				WHERE ROWNUM <= 10) c
	WHERE c.r >= 6;

	SELECT c.*	FROM (SELECT a.*, ROWNUM r	from (select *	from boardtb b	inner join usertb u	on b.uidx = u.uidx ORDER BY b.bidx desc) a WHERE ROWNUM <= 10) c WHERE c.r >= 6;

	-- 전체 게시물 갯수 조회 쿼리
select count(*) from boardtb


insert into boardtb(bidx, title, content, uidx) VALUES (bidx_seq.nextval, bidx_seq.nextval, bidx_seq.nextval, 41);
