ALTER TABLE C##DEV.BUYTBL
ADD CONSTRAINT fk_
  FOREIGN KEY (USERNAME)
  REFERENCES
    C##DEV.USERTBL(USERNAME);
  SELECT * FROM BUYTBL;
  SELECT * FROM usertbl u, buytbl b;

  CREATE USER c##jsptest IDENTIFIED BY 1234;
grant connect, resource, dba to c##jsptest;



DROP TABLE member_tbl;

create table member_tbl(
member_idx number not null primary key,
member_id varchar2(50) not null unique,
member_pw varchar2(20) not null,
member_name varchar2(30) not null,
member_handphone char(20),
member_gender char(3),
member_grade number(1) default 0,
reg_date date default sysdate,
del_yn char(2) default 'N'
);

DROP SEQUENCE member_sq;
CREATE SEQUENCE member_sq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999 NOCYCLE NOCACHE NOORDER;

-- 회원가입 쿼리문
INSERT INTO member_tbl VALUES (member_sq.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, default);
-- 로그인 쿼리문
select * from member_tbl where member_id=? and member_pw=?;
-- 내 정보 조회 쿼리
select * from member_tbl where member_idx=?;
-- 정보수정 쿼리문
UPDATE member_tbl SET member_pw = ?, member_pw = ?, member_handphone = ? WHERE member_id = ?;
-- 회원 탈퇴 쿼리문
UPDATE member_tbl SET del_yn = 'Y' WHERE member_idx = ?;
UPDATE member_tbl SET del_yn = 'Y' WHERE member_id = 'asdf';

-- 관리자의 회원등급 변경 쿼리문
UPDATE member_tbl SET member_grade = ? WHERE member_idx = ?;
UPDATE member_tbl SET member_grade = 1 WHERE member_idx = 32;

-- 관리자의 회원삭제 쿼리문
DELETE FROM member_tbl WHERE member_idx = ?;

INSERT INTO member_tbl VALUES (member_sq.NEXTVAL, member_sq.NEXTVAL, 12, '스미스', 010, '남', DEFAULT, DEFAULT, default);

select * from member_tbl where member_id='asdf' AND member_pw='1234' AND del_yn='N';
COMMIT;

SELECT * FROM member_tbl;
DELETE FROM member_tbl WHERE member_idx = 21;