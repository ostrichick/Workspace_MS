CREATE OR REPLACE FUNCTION userFunc(VALUE1 int, value2 int)
	RETURN NUMBER
AS
BEGIN
 	RETURN value1+value2;
END;

SELECT userFunc(500,200) FROM DUAL;

VAR RETvALUE NUMBER;
EXECUTE :retValue := userFunc (100, 300);
print retValue;

--예제5 .employees 테이블에서 사번 입력시 근무연수 반환 함수

CREATE OR REPLACE FUNCTION get_workYears(
 p_empID IN EMPLOYEES.EMPLOYEE_ID%TYPE
 ) RETURN PLS_INTEGER AS
	 v_workYear NUMBER(2);
	 v_hiredYear NUMBER(4);
	 v_currentYear NUMBER(4);
 BEGIN
		SELECT extract(year FROM hire_date) INTO v_hiredYear FROM EMPLOYEES WHERE EMPLOYEE_ID = p_empID;
	 	SELECT extract(year FROM SYSDATE) INTO v_currentYear FROM dual;
	 	v_workYear := v_currentyear - v_hiredyear;
	 	RETURN v_workYear;
 END;

 SELECT first_name, get_workYears(100) 근무연수 FROM employees WHERE employee_id=100;
 select first_name, get_workYears(employee_id) 근무연수 FROM employees ORDER BY 근무연수 DESC;

 --예제6 employees 테이블에서 전화번호가 011로 시작하는 경우 13자리부터 6자리를 xxxxxx로 출력되도록 하는 함수 작성 p442

 CREATE OR REPLACE FUNCTION hide_cellphone(p_empId employees.EMPLOYEE_ID%type)
 	RETURN employees.phone_number%TYPE
 AS
 	v_result employees.phone_number%TYPE;
 	v_phoneNumber employees.phone_number%TYPE;
 BEGIN
	SELECT phone_number INTO v_phoneNumber FROM EMPLOYEES
		WHERE EMPLOYEE_ID = p_empId;
		v_result := CONCAT(substr(v_phoneNumber,1,12),'xxxxxx');
		RETURN v_result;
 END;

SELECT employee_id, hide_cellphone(EMPLOYEE_ID) 핸드폰정보 FROM EMPLOYEES
 WHERE EMPLOYEE_ID IN (
  SELECT a.employee_id FROM EMPLOYEES a
  	WHERE a.phone_number LIKE '011%');
