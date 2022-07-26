-- 단순변수
	-- 스칼라 변수 - 직접 데이터 지정
	-- 참조 변수 - 다른 컬럼을 참조 : %TYPE, %ROWTYPE
-- 복합변수
	-- 레코드 타입
	-- 테이블 타입 - VARRAY, 중첩테이블, 연관배열

--예제1. %ROWTYPE
-- employees테이블에서 사번 입력시 이름, 전화번호, 직책, 급여, 입사연도를 출력

	CREATE OR REPLACE PROCEDURE get_empInfo(
	p_empID IN employees.employee_id%TYPE
	) AS

	-- 일반 변수로 각각의 값을 저장할 수 있는 변수 선언
	/*	v_empName employees.first_name%TYPE;
		v_phoneNumber employees.phone_number%TYPE;
		v_jobID employees.job_id%TYPE;
		v_hireDate employees.hire_date%TYPE;
		*/

	-- %ROWTYPE을 이용한 변수 선언 (위의 일반변수로 인한 선언과 동일 효과)
		v_empInfo employees%ROWTYPE;
	BEGIN
	-- 쿼리문을 사용한 변수 초기화
	/*	SELECT first_name, phone_number, job_id, hire_date
			INTO v_empName, v_phoneNumber, v_jobID, v_hireDate
			FROM employees WHERE employee_id = p_empID; 	*/

	-- %ROWTYPE을 이용한 변수를 v에 집어넣기
			SELECT * INTO v_empInfo FROM employees
				WHERE employee_id = e_empID;
	--DBMS_OUTPUT.PUT_LINE('이름:'||v_empInfo.first_name||', 전화번호: '||v_empInfo.phone_number||', 직책번호: '||v_empInfo.job_id||', 입사연도: '||v_empInfo.hire_date);
	END;

EXEC get_empInfo(100);

--예제2. RECORD TYPE
--employees, departments, jobs 테이블에서 직번을 입력하면 직원이름, 부서이름, 직책 이름을 출력하는 저장 프로시저

CREATE OR REPLACE PROCEDURE get_empInfo2(
	e_empId IN employees.employee_id%TYPE
	) AS
	--RECORD TYPE 정의
	TYPE emp_recType IS RECORD (emp_name employees.first_name%TYPE,
	dept_name departments.department_name%TYPE,
	job_name jobs.job_title%type);
	--변수선언
	v_empInfo emp_recType;
BEGIN
	SELECT e.first_name, d.department_name, j.job_title INTO v_empInfo
 		FROM departments d INNER join employees e
  	USING(department_id)
  	INNER JOIN jobs j
  	ON e.job_id = j.job_id
  	WHERE e.employee_id = p.empId;
DBMS_OUTPUT.PUT_LINE('이름:'||v_empInfo.emp_name||', 부서이름:'||v_empInfo.dept_name||', 직책이름:'||v_empInfo.job_name);
END;

EXEC get_empInfo2(100);


-- 예제3. 연관배열 TYPE
--employees 테이블에 있는 직원 이름을 연관배열형 변수 v_namrArr에 저장한 후 출력

CREATE OR REPLACE PROCEDURE print_empNames
--연관배열 데이터형 정의
	TYPE empName_tblType IS TABLE OF employees.first_name%TYPE
		INDEX BY BINARY_INTEGER; -- 4byte크기 정수
	--연관배열형 변수 선언
	v_nameArr empName_tblType;
	-- for문에서 사용할 마지막 값을 저장하는 변수 선언
	j BINARY_INTEGER := 0;

BEGIN
	FOR i IN (SELECT first_name FROM employees) LOOP
		j := j+1;
		v_nameArr(j) := i.first_name; -- 변수 i에 대입된 first_name 값
	END LOOP;

	FOR i IN 1 .. j LOOP
		DBMS_OUTPUT.PUT_LINE(v_nameArr(i));
	END LOOP;
END;

EXEC print_empNames();