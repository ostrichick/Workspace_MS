/*트랜잭션 transaction
분리되어서는 안되는 논리적 작업단위
여러개의 DML 작업을 하나로 묶어둔 것
TCL트랜잭션 제어어 : DML문이 실행되어 DB에 저장되거나 되돌려지기 위해서 실ㅇ행햐아하는 작은 SQL문

TCL종류
commit : SQL문의 결과를 영구적으로 DB에 반영
rollback SQL문의 결과를 이전 트랜잭션의 마지막부분까지 취소
savepoint : 트랜잭션의 한지점을 임시저장
*/

/*예제 3 아래의 조건을 만족하는 dept 테이블 생성*/
	CREATE TABLE dept (
 dept_number NUMBER NOT NULL PRIMARY key,
 dept_name VARCHAR2(10) NOT null,
 dept_address VARCHAR2(20) null
);
SELECT * FROM dept;
ALTER TABLE dept RENAME COLUMN dept_number TO dept_id;
/*예제 4 아래의 조건에 따른 데이터를 dept 테이블에 입력
*/
INSERT INTO dept VALUES (10, '영업부', '서울 강남구');
SAVEPOINT a;
INSERT INTO dept VALUES (20, '총무부', '전주 덕진구');
SAVEPOINT b;
INSERT INTO dept VALUES (30, '개발부', '대전 유성구');
COMMIT;
DELETE FROM dept;

--savepoint 적용시킨 후 rollback commit 실행
INSERT INTO dept VALUES (40, '생산부', '전주 완산구');
SAVEPOINT a;
INSERT INTO dept VALUES (50, '구매부', '인천 연수구');
SAVEPOINT b;
INSERT INTO dept VALUES (60, '홍보부', '서울 마포구');
ROLLBACK TO a;
COMMIT;
SELECT * FROM dept;