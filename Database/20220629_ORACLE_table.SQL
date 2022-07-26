DESC departments;
/*예제 1 EMPLOYEES 테이블에 있는 모든 데이터를 조회*/
SELECT * FROM EMPLOYEES ;
SELECT * FROM HR.EMPLOYEES ;
/*예제 2 EMPLOYEES 테이블에 있는 직원 이름, 전화번호, 급여를 조회*/
SELECT FIRST_NAME,PHONE_NUMBER,SALARY FROM EMPLOYEES;
SELECT FIRST_NAME AS 이름,PHONE_NUMBER AS "전화 번호" ,SALARY AS 급여 FROM EMPLOYEES; -- '전화 번호'는 작동 안함
/*예제 3 시퀀스*/
CREATE SEQUENCE HR
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE NOCACHE NOORDER;

DELETE SEQUENCE HR;

CREATE SEQUENCE SEC02 -- 그냥 쓰면 이름만. 아니면 스키마.시퀀스명
INCREMENT BY 1 START WITH 1
--MINVALUE 1 -- NOCYCLE과 동시에 사용할 필요 없음
MAXVALUE 9999999
NOCYCLE NOCACHE NOORDER;

/* 급여가 5000이상이고 10000이하인 직원의 사원번호, 이름, 급여 조회*/
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
-- WHERE SALARY BETWEEN 5000 AND 10000;
 WHERE SALARY >=5000 AND SALARY <= 10000;
 -- 5000 <= SALARY >= 10000 같은 형태는 지원하지 않음

 /*예제 4 EMPLOYEES 테이블에서 부서번호가 10, 20, 100에 속하는 직원의 부서번호, 이름 조회*/
 SELECT DEPARTMENT_ID, FIRST_NAME FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (10, 20, 100);
 -- WHERE DEPARTMENT_ID = ANY (10, 20, 100); -- 같은 의미

  /*예제 5 EMPLOYEES 테이블에서 이름이 A로 시작하는 직원의 사번 이름 조회*/
  SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';

   /*예제 6 EMPLOYEES에서 사번, 이름, 급여를 급여가 높은 순 조회*/
   SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
   ORDER BY SALARY DESC;
   -- ASC 오름차순(기본값,작은거부터), DESC 내림차순(큰거부터)

/*예제 7 EMPLOYEES에서 급여가 높은 상위 5명의 사번, 이름, 급여 조회*/
SELECT * FROM (
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
   ORDER BY SALARY DESC
   ) WHERE ROWNUM <= 5;

/*예제 8 결합연산자 || - EMPLOYEES에서 직원이름의 급여는 얼마입니다는 컬럼명은 직원급여로 조회*/
SELECT FIRST_NAME || '의 급여는' || SALARY || '입니다' AS "직원 급여" FROM EMPLOYEES;
-- 문자열끼리 더함

/*예제 9 DISTINCT - EMPLOYEES에서 중복된 값 없이 급여 목록을 조회*/
   SELECT DISTINCT SALARY "직 원 급 여" FROM EMPLOYEES ORDER BY SALARY DESC;

   /*예제 10 테이블복사 CTAS : EMPLOYEES 테이블을 EMPLOYEES_COPY 로 복사*/
   CREATE TABLE EMPLOYEES_COPY AS(SELECT * FROM EMPLOYEES);
   DROP TABLE EMPLOYEES_COPY;

   /*예제 11 집계함수 sum() avg() max() min()
   employees 테이블에서 부서번호가 100인 직원들의 급여 합계과 평균 급여, 가장 높은 급여를 조회*/
   SELECT SUM(SALARY), CAST(AVG(SALARY) AS NUMBER (7,2)), MAX(SALARY), MIN(SALARY) FROM EMPLOYEES
   GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID = 100;
   -- 그룹바이의 조건절로는 해빙을 씀

	/* 예제  12 집계함수 rollup()
employees 테이블에서 부서별 사원수와 총 사원수를 조회*/
SELECT DEPARTMENT_ID 부서번호, COUNT(DEPARTMENT_ID) 사원수 FROM EMPLOYEES a
GROUP BY ROLLUP (DEPARTMENT_ID);

/*예제 13 집계함수 cube()
EMPLOYEES에서 각 부서별 사원수와 부서의 직업번호별 사원수, 총 사원수를 조회*/
SELECT DEPARTMENT_ID 부서번호, JOB_ID 직업번호, COUNT(EMPLOYEE_ID) 사원수 FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID), JOB_ID
ORDER BY DEPARTMENT_ID, JOB_ID;

/*예제 14 샘플데이터 생성 - emplyees에서 사번, 이름, 급여를 저장할 수 있는 explyees_sample 테이블 생성, 데이터 입력*/
   CREATE TABLE EMPLOYEES_sample (
EMPLOYEE_ID NUMBER(6) NOT NULL PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
salary NUMBER(8,2) NOT NULL
);
ALTER TABLE HR.EMPLOYEES_sample ADD
(
    CONSTRAINT EMP_sample_SALARY_MIN
    CHECK ( salary > 0 )
);
/*
INSERT INTO EMPLOYEES_sample(first_name,EMPLOYEE_ID,SALARY) SELECT first_name,EMPLOYEE_ID,SALARY FROM EMPLOYEES;
*/
INSERT INTO EMPLOYEES_SAMPLE
	SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES ;
COMMIT;
--CTAS를 이용해서 employees_sample2 테이블을 생성
CREATE TABLE EMPLOYEES_sample2 AS (SELECT EMPLOYEE_id, first_name, salary FROM EMPLOYEES );

/*예제 15 데이터 수정 update - employees_sample 테이블에 bonus 컬럼(데이터형:number(7), null)을 추가하고
이름이 A로 시작하는 직원에게 보너스로 5000씩 지급, 보너스가 지급된 사원의 사번, 이름을 조회*/
ALTER TABLE EMPLOYEES_sample ADD bonus NUMBER(7);
UPDATE EMPLOYEES_SAMPLE SET bonus=5000
WHERE  FIRST_NAME LIKE 'A%';
SELECT EMPLOYEE_ID, first_name FROM EMPLOYEES_sample
WHERE  bonus=5000;

--UPDATE EMPLOYEES_SAMPLE SET salary=salary+bonus, bonus=bonus-bonus WHERE first_name='Adam';

/*예제 15 데이터 삭제 delete from
employees_sample 데이터에서 이름이 A로 시작하는 직원을 삭제, 그 후 총 직원 수 조회*/
DELETE FROM EMPLOYEES_sample WHERE FIRST_NAME LIKE 'A%';
SELECT COUNT(*) 총직원수 FROM EMPLOYEES_SAMPLE;

--employees_sample 테이블에서 급여가 10000 초과하는 직원을 삭제하고

DELETE FROM EMPLOYEES_sample WHERE salary>10000;
SELECT COUNT(*) 총직원수 FROM EMPLOYEES_SAMPLE;
SELECT * FROM dual;

/*예제 16 문자열 함수
p252~255 예제*/
SELECT ASCII('A'),ASCII('a'),ASCII('0'),ASCII('9'), CHR('108'), asciistr('궯'), unistr('\d55b')FROM dual;

--문자열의 길이: 한글, 영어, lengthb(문자열): 문자열에 할당된 byte 수
SELECT LENGTH('ㅁㄴㅇㄻ'), LENGTH('QWEr'), LENGTHB('ㅁㄴㅇㄻ'),LENGTHB('QWEr') FROM dual;

--대상 문자열에서 해당 문자열에 대한 순서값을 반환, instrb(): byte 단위로 계산하여 반환
SELECT INSTR('이것이 oracle이다. 이것도 오라클이다', '이것') FROM dual;
SELECT INSTR('이것이 oracle이다. 이것도 오라클이다', '이것' , 2) FROM dual;
SELECT INSTRB('이것이 oracle이다. 이것도 오라클이다', '이것' , 2) FROM dual;

--소문자로 대문자로 단어의 첫글자만 변환
SELECT LOWER('aDfdFGd'), upper('aDfdFGd'), INITCAP('aDfdFGd') FROM dual ;

--문자열 바꾸기 replace translate
SELECT REPLACE ('우에엥', '에' , '이') FROM dual;
SELECT TRANSLATE('이것이 오라클이다', '이것','AB') FROM dual;

--순서값에서 부터 지정한 개수만큼 문자열 추출 반환
SELECT SUBSTR('ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎ', 7,5) FROM dual;

--문자열 순서 거꾸로 변환
SELECT REVERSE('1234dㅇ') FROM dual; -- 한글은 안됨?

--지정한 길이 만큼 지정한 문자로 왼쪽이나 오른쪽을 채워서 반환. 길이는 byte 단위
SELECT LPAD('이것이', 11, '#'), RPAD('이것이', 11, 'ㅇ') FROM dual;

--지정한 문자를 제거하되 중간의 문자는 제거되지 않음, 지정한 문자가 없을시 공백 제거
SELECT LTRIM('                       이것이        '), RTRIM('$$$ 이것 $ 이 $ 오라클이다$$$$$ $$$$$$$$', '$') FROM dual;

--앞뒤 공백 제거
SELECT TRIM('            이것이              ') 결과 FROM dual;

-- 대상 문자열에서 지정된 문자 개수를 반환
SELECT regexp_count('이것이 오라클이다','이') FROM dual;

