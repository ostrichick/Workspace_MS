/*Cursor
SQL문을 실행할 때마다 SQL처리르 루이해 사용하는 메모리 공간 (private sql area)
sql 실행시 오라클 서버는 사용자가 요청하는 데이터베이스 버퍼 캐시에서 커서로 복사해온 후
커서에서 원하는 데이터를 추출하여(fetch) 다음 작업을 한다

종류 묵시적 커서, 명시적 커서
1. 묵시적 거서
필요한 경우 오라클 서버가 자동으로 선언하여 사용한 후 자동으로 정리하는 커서
PL/SQL블록 내에서 DML문(SELECT문 포함)이 실행될 때마다 커서가 선언됨
SQL블록내에 한개만 선언되어 사용되다가 SQL문이 종료됨과 동시에 정리됨
데이터는 1행만 저장 가능

2. 명시적 커서
사용자가 선언하여 생성 후 사용하는 커서로 사용 후에는 정리작업을 해주어야함
여러행의 데이터 저장 가능
PLSQL 블록 내에 여러개를 선언해서 사용할 수 있음

<커서의 속성> 커서 내 실행 결과를 알 수 있는 값 반환 접두어: 묵시적 커서는 SQL, 명시적 커서는 커서이름
접두어%ROWCOUNT 커서 실행한 행의 수 반환
접두어%FOUND 아직 수행해야할 데이터가 있으면 TRUE 반환
접두어%NOTFOUND '' 없는 경우 TRUE 반환
접두어%ISOPEN 커서가 메모리에 OPEN 되어있는 경우 TRUE

1. 커서 선언
	cursor 커서이름 is (커서에 담고싶은 데이터를 가져오는 서브쿼리);
해당 커서를 사용하겠다고 서버에 알림(메모리 할당은 이루어지지 않음)

2.	커서열기: open 커서이름;
서브쿼리를 실행해서 데이터를 커서로 가져옴
메모리에 실제 커서가 사용할 공간이 할당
커서에 저장된 데이터 첫번재 행에 커서 포인터 설정

3. 커서로부터 데이터를 읽어서 변수로할당 fetch
	fetch 커서이름 into 변수(들);

 커서에 접근해서 저장된 데이터를 하나씩 가지고와서 변수에 할당
데이터행은 커서 포인터에 의해 자동 지정
한행이 fetch되면 자동으로 포인터는 다음 행으로 이동함
여러행의 데이터를 처리하기 위해 주로 반	복문과 함께 쓰임

4. 커서닫기:	close 커서이름;
작업이 끝난 메모리 공간을 반환하고 정리
*/

--예제1. 명시적 커서 사용
--employees 테이블에서 커서를 이용해서 직원들의 급여 평균을 구하는 프로시저 작성 p449

CREATE OR REPLACE PROCEDURE avg_salary AS
	v_salary employees.salary%TYPE;
	v_cnt NUMBER(3) := 0;
	v_total NUMBER := 0;
-- 커서 선언
	CURSOR cur_salary IS
		SELECT salary FROM employees;
BEGIN
-- 커서 열기
	OPEN cur_salary;
-- 데이터 fetch
	LOOP
		FETCH cur_salary INTO v_salary;
		EXIT WHEN cur_salary%NOTFOUND;

		v_total := v_total + v_salary;
		v_cnt := v_cnt + 1;
	END LOOP;
--커서 닫기
	CLOSE cur_salary;
-- 평균 급여 출력 trunc(숫자,소수점자리)
DBMS_OUTPUT.PUT_LINE('ㅈㅇㅇ ㅍㄱㄱㅇ'|| TRUNC(v_total/v_cnt, 2));
END;

EXEC avg_salary();

--예제2 cursor for loop
--employees 테이블에서 직업코드가 CLERK이 들어가는 직원의 이름과 직업코드를 조회하되
--관리자번호가 120보다 큰 이름 오름차순 정렬

BEGIN -- 커서 선언시 들어가는 서브쿼리를 반복문에 직접 정의시
-- declare부분 커서 선언 필요 x
-- for문 실행되면 in 다음에 기술된 커서가 작동open
-- 한건씩 fetch 수행, 커서 영역 데이터 처리 완료되면 반복문 종료, 커서 close
-- for반복문 횟수는 명시적 커서 내늬 전체 행수
--
	FOR item IN (
	 	SELECT first_name, job_id FROM employees
	  WHERE job_id LIKE '%CLERK%'
		AND manager_id > 120
		ORDER BY first_name
		)
	LOOP
		DBMS_OUTPUT.PUT_LINE('이름:'||item.first_name||', 직업코드:'||item.job_id);
	END LOOP;
END;
