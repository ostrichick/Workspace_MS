--예제1 employees테이블에서 이름이 Jose Manuel인 직원의 사번에 100을 더해서

SELECT * FROM EMPLOYEES WHERE FIRST_NAME='Jose Manuel';

EXECUTE make_newID('Jose Manuel');

CREATE OR REPLACE PROCEDURE make_newID(
 p_first_name IN EMPLOYEES.first_name%TYPE
) AS v_newID employees.EMPLOYEE_ID%TYPE; -- 일반변수
BEGIN SELECT EMPLOYEE_ID INTO v_newID FROM EMPLOYEES
	WHERE FIRST_NAME=p_first_name;
	v_newID:=v_newID+100;
DBMS_OUTPUT.PUT_LINE(p_first_name||'의 새로운 사번: '||v_newID);
END make_newID;

--예제2 employees 테이블에서 사번 입력하면 이름 출력

CREATE OR REPLACE PROCEDURE print_name(
p_employee_id IN EMPLOYEES.EMPLOYEE_ID%TYPE
) AS v_first_name EMPLOYEES.FIRST_NAME%TYPE;
BEGIN SELECT FIRST_NAME INTO v_first_name FROM EMPLOYEES
 WHERE EMPLOYEE_ID = p_employee_id;
 DBMS_OUTPUT.PUT_LINE('사번이 '||p_employee_id||'인 사원의 이름 '||v_first_name);
 END print_name;

EXECUTE print_name(112);

--예제3 employees 테이블에서 성과 이름 입력시 사번,부서코드,직책코드 출력

CREATE OR REPLACE PROCEDURE get_empInfo(
p_fname IN EMPLOYEES.FIRST_NAME%TYPE, -- 괄호 안은 ,로 연결
p_lname IN EMPLOYEES.last_name%TYPE
) AS v_empID EMPLOYEES.EMPLOYEE_ID%TYPE;
v_deptID EMPLOYEES.department_id%TYPE; -- 변수에 하나씩 ;
v_jobID EMPLOYEES.job_id%TYPE;
BEGIN SELECT EMPLOYEE_ID, department_id, job_id
INTO v_empID, v_deptID, v_jobID FROM EMPLOYEES -- ; x
 WHERE first_name=p_fname AND last_name=p_lname;
 DBMS_OUTPUT.PUT_LINE('이름이 '||p_fname||p_lname||'인 사람의 사번'||v_empID||' 부서코드'||v_deptID||' 직책코드'||v_jobID);
 END get_empInfo;

 EXECUTE get_empInfo('John','Chen');

 --예제5 employees 테이블에 사번 입력시 근무연수 출력

 CREATE OR REPLACE PROCEDURE check_work_years(
 p_empID IN EMPLOYEES.EMPLOYEE_ID%TYPE
 ) AS
 v_workYear NUMBER(2);
 v_hiredYear NUMBER(4);
 v_currentYear NUMBER(4);
 BEGIN SELECT extract(year FROM hire_date) INTO v_hiredYear FROM EMPLOYEES WHERE EMPLOYEE_ID = p_empID;
 SELECT extract(year FROM SYSDATE) INTO v_currentYear FROM dual;
 v_workYear := v_currentyear - v_hiredyear;
 DBMS_OUTPUT.PUT_LINE('사번 '||p_empID||' 의 근무연수: '||v_workYear);
 END;

 EXECUTE check_work_years(107);

 --예제6 근무연수가 20년 이상이면 장기근속 금상, 15년 이상이면 은상 출력
CREATE OR REPLACE PROCEDURE check_years_award(
 p_empID IN EMPLOYEES.EMPLOYEE_ID%TYPE
 ) AS
 v_workYear NUMBER(2);
 v_hiredYear NUMBER(4);
 v_currentYear NUMBER(4);
 v_award_type VARCHAR2(30);
		BEGIN
 	SELECT extract(year FROM hire_date) INTO v_hiredYear FROM EMPLOYEES WHERE EMPLOYEE_ID = p_empID;
 	SELECT extract(year FROM SYSDATE) INTO v_currentYear FROM dual;
 v_workYear := v_currentyear - v_hiredyear;
		IF v_workYear >= 20 THEN
				award_type := '금상';
		ELSE v_workYear >= 15 THEN
				award_type := '은상';
-- 		ELSE award_type := '없음';
 		END IF;
 DBMS_OUTPUT.PUT_LINE('사번 '||p_empID||' 은 장기근속 상 '||award_type);
 END;

