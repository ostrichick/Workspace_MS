/*
PL/SQL
1. (익명) 프로시저 - 1회용, 재사용불가
형식
if <부울 표현식> then
	처리문;
ELSE
	처리문;
END IF;
*/



DECLARE
	VAR1 NUMBER(5); --변수선언 (자바 INT VAR1;)
BEGIN
	VAR1:=10; --변수초기화. 대입연산자 :=  (자바 VAR1=100;)
	IF VAR1=100 THEN -- =은 비교연산자 (자바 ==)
		DBMS_OUTPUT.PUT_LINE('100입니다'); -- (자바 System.out.println();)
	ELSE
		DBMS_OUTPUT.PUT_LINE('100이아닙니다');
	END IF; -- 조건식이 끝날때 END IF;
END;


-- 예제1. employees 테이블에서 사번100번의 근무연수를 확인하는 프로시저를 작성

DECLARE
	hiredate DATE;
	currdate DATE;
	worK_DAYs NUMBER(5);
BEGIN
	SELECT HIRE_DATE INTO HIREDATE FROM eMPLOYEES
		WHERE EMPLOYEE_ID=100; -- SELECT문을 통해 변수 초기화
	currdate := CURRENT_DATE();
	WORK_DAYS := CURRDATE - HIREDATE;

	IF (WORK_DAYS/365) >= 5 THEN -- 근무연수 5년 지남
		DBMS_OUTPUT.PUT_LINE('입사한지'||WORK_DAYS||'일이 지났습니다. ㅊㅋ');
	ELSE
		DBMS_OUTPUT.PUT_LINE('입사한지'||WORK_DAYS||'일이 지났습니다. ㅇㅅㅇ');
	END IF;
END;

-- 예제2. 다중 IF-ELSE문을 이용, 성적처리 프로시저 작성
-- 변수 SCORE값이 90이상이면 a,

DECLARE
	SCORE NUMBER;
	GRADE CHAR;
BEGIN
	SCORE := 89;
		IF SCORE >= 90 THEN GRADE:='A';
			ELSIF SCORE >= 80 THEN GRADE:='B';
			ELSIF SCORE >= 70 THEN GRADE:='C';
			ELSIF SCORE >= 60 THEN GRADE:='D';
			ELSE GRADE:='F';
		END IF;
		DBMS_OUTPUT.PUT_LINE('성적은'||GRADE||'입니다');
END;

-- 예제3
DECLARE
	SCORE NUMBER;
	GRADE CHAR;
BEGIN
	SCORE := 79;
		CASE WHEN SCORE >= 90 THEN GRADE:='A';
			WHEN SCORE >= 80 THEN GRADE:='B';
			WHEN SCORE >= 70 THEN GRADE:='C';
			WHEN SCORE >= 60 THEN GRADE:='D';
			ELSE GRADE:='F';
		END CASE;
		DBMS_OUTPUT.PUT_LINE('성적은'||GRADE||'입니다');
END;