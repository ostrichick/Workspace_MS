-- 테이블 생성하기
CREATE TABLE MEMBER_TBL(
	MEMBER_IDX BIGINT NOT NULL AUTO_INCREMENT,
	MEMBER_ID VARCHAR(30) NOT NULL UNIQUE,
	MEMBER_PW VARCHAR(20) NOT NULL,
	MEMBER_NAME VARCHAR(30) NOT NULL,
	NICKNAME VARCHAR(20) NOT NULL UNIQUE,
	MEMBER_PHONE CHAR(15) NOT NULL,
	REG_DATE DATETIME DEFAULT NOW(),
	DELETE_YN CHAR(2) DEFAULT 'N',
	PRIMARY KEY (MEMBER_IDX)
);

-- <<DML>> 데이터 조작어 SELECT, INSERT, UPDATE, DELETE
-- 데이터 추가하기
INSERT INTO member_tbl(MEMBER_ID, MEMBER_PW, MEMBER_NAME, NICKNAME, MEMBER_PHONE) VALUES
('HONG1@NAVER.COM','1234','홍길동1','DBHONG1','010-1234-1234'),
('HONG2@NAVER.COM','1234','홍길동2','DBHONG2','010-1234-1234'),
('HONG3@NAVER.COM','1234','홍길동3','DBHONG3','010-1234-1234'),
('HONG4@NAVER.COM','1234','홍길동4','DBHONG4','010-1234-1234'),
('HONG5@NAVER.COM','1234','홍길동5','DBHONG5','010-1234-1234');

-- 데이터 수정하기 : member_idx가 3인 회원의 전화번호를 010-222-222로

UPDATE member_tbl SET MEMBER_PHONE='010-2222-2222' WHERE MEMBER_IDX = 2;

-- 데이터 삭제하기 : NICKNAME이 DBHONG5인 회원정보 삭제

DELETE FROM MEMBER_TBL WHERE NICKNAME='DBHONG5';

-- 데이터 조회하기(select) : member_tbl에 있는 모든 회원정보 조회

SELECT * FROM member_tbl;

-- 특정 부분의 데이터 조회 (첫번째 0) - limit
-- member_tbl의 모든 데이터 중 2번재부터 3개 조회

select * from member_tbl limit 1 , 3;

-- DDL
-- MEMBER_TBL 테이블명을 MEMBER로 변경
RENAME TABLE MEMBER_TBL TO MEMBER;
select * from member;
desc member; -- 테이블 형식 확인

-- 컬럼명 변경하기 alter -change
-- member_idx 컬럼명으 member_index로

alter table member change member_idx member_index BIGINT;
alter table member change member_index member_index BIGINT not null AUTO_INCREMENT;
-- (oracle) alter table member rename column member_idx to member_index;

-- 컬럼 추가하기 alter add : member 테이블에 member_age 컬럼 추가 tinyint unsigned, 기본값 0
alter table member add member_age tinyint unsigned default 0;

-- 컬럼 데이터타입, 제약조건 변경 alter modify
-- member_index 데이터 유형을 bigint에서 int unsigned로
alter table member modify  member_index int unsigned;

-- 컬럼 삭제 drop - member_age 컬럼 삭제
alter table member drop member_age;