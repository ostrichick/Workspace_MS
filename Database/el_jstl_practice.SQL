create table member_tbl(
member_idx number not null primary key,
member_id varchar2(50) not null unique,
member_pw varchar2(20) not null,
member_name varchar2(30) not null,
member_handphone char(20),
member_gender char(2),
member_grade number(1) default 0,
reg_date date default sysdate, del_yn char(2) default 'N'
);

DROP SEQUENCE member_sq;
CREATE SEQUENCE member_sq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999 NOCYCLE NOCACHE NOORDER;

-- 회원가입 쿼리문
INSERT INTO member_tbl VALUES (member_sq.NEXTVAL, ?, ?, ?, ?, ?, ?, DEFAULT, default);
-- 정보수정 쿼리문
UPDATE member_tbl SET member_id = ?, member_name = ?, member_handphone = ? WHERE member_idx = ?;
-- 회원 탈퇴 쿼리문
UPDATE member_tbl SET del_yn = 'Y' WHERE member_idx = ?;

-- 관리자의 회원등급 변경 쿼리문
UPDATE member_tbl SET member_grade = ? WHERE member_idx = ?;
-- 관리자의 회원삭제 쿼리문
DELETE FROM member_tbl WHERE member_idx = ?;