 --예제1. after트리거 p463~464
 --employees 테이블을 CTAS로 복사해서 emp_tbl을 생성하고 변겨오디기전에 데이터를 저장할 백업 테이블로
 --변경된 타입modift_type, char(6), 변경된 날짜modify_date,date 변경된 사용자 modify_user carchar2(30)을 추가한 emp_tvl_bak 테이블 생성

 CREATE TABLE emp_tbl AS
 	SELECT * FROM employees;
 	--기본키추가
 	ALTER TABLE emp_tbl ADD CONSTRAINT pk_emp_tbl PRIMARY KEY (employee_id);
	--백업테이블 생성

	CREATE TABLE EMP_TBL_bak (
  EMPLOYEE_ID       NUMBER(6)             NOT NULL,
  FIRST_NAME        VARCHAR2(20 BYTE)         NULL,
  LAST_NAME         VARCHAR2(25 BYTE)     NOT NULL,
  EMAIL             VARCHAR2(25 BYTE)     NOT NULL,
  PHONE_NUMBER      VARCHAR2(20 BYTE)         NULL,
  HIRE_DATE         DATE                  NOT NULL,
  JOB_ID            VARCHAR2(10 BYTE)     NOT NULL,
  SALARY            NUMBER(8, 2)              NULL,
  COMMISSION_PCT    NUMBER(2, 2)              NULL,
  MANAGER_ID        NUMBER(6)                 NULL,
  DEPARTMENT_ID     NUMBER(4)                 NULL,
  modify_type 			CHAR(6),
 	modify_date 			DATE,
 	modify_user 		 	VARCHAR2(30),
 	PRIMARY KEY (employee_id)
);

--emp_tbl에 update나 delete 시도하면 수정, 삭제된 데이터를
--emp_tbl_bak 테이블에 보관하고 수정타입(수정,삭제),변경일자,변경한 사용자 계정을 기록하는
-- 트리거 t_backup_empTBL을 작성
CREATE OR REPLACE
TRIGGER t_backup_empTBL
	AFTER UPDATE OR DELETE
 	ON emp_tbl
	FOR EACH row
DECLARE
	v_modifyType emp_tbl_bak.modify_Type%TYPE;
BEGIN
	IF updating THEN
		v_modifyType := '수정';
	elsif updating THEN
		v_modifyType := '삭제';
	END IF;
INSERT INTO emp_tbl_bak VALUES(
		:OLD.EMPLOYEE_ID,
		:OLD.FIRST_NAME,
		:OLD.LAST_NAME,
		:OLD.EMAIL,
		:OLD.PHONE_NUMBER,
		:OLD.HIRE_DATE,
		:OLD.JOB_ID,
		:OLD.SALARY,
		:OLD.COMMISSION_PCT,
		:OLD.MANAGER_ID,
		:OLD.DEPARTMENT_ID,
		v_modifyType,
		SYSdate,
		USER()
	);
END;

DELETE FROM emp_tbl WHERE employee_id=100;

UPDATE emp_tbl SET salary=10000 WHERE employee_id=112;

--예제2 before 트리거
--사원번호emp_id 외출유무out_business char(1), 등록시간reg_time
--저장하는 emp_work_tbl을 생성하고 오전10시-오후5시에만 입력을 허용

CREATE TABLE emp_work_tbl(
	emp_id number(6) not NULL PRIMARY KEY,
	out_business CHAR(1) DEFAULT 'N',
	reg_time DATE DEFAULT sysdate
);

CREATE OR REPLACE TRIGGER t_insert_workTime
	BEFORE INSERT
	ON emp_work_tbl
	FOR EACH ROW
BEGIN
	IF(to_char(SYSDATE,'HH24:MI') NOT BETWEEN '10:00' AND '19:00') THEN
		RAISE_APPLICATION_ERROR(-20000, '외출 등록 허용시간이 아닙니다');
	END IF;
END;

INSERT INTO emp_work_tbl VALUES(101, 'Y', sysdate);
COMMIT;