/*예제 1 날짜 및 시간 함수
주어진 날짜(현재 날짜)에 대한 해당 월의 마지막 날짜를 조회하시오*/
SELECT LAST_DAY(sysdate) FROM dual;
--두 날짜 사이의 개월 수를 게산해서 반환 (소수점 단위까지)
SELECT MONTHS_BETWEEN(SYSDATE, '2000-1-1') FROM dual;
-- 소수점 2자리까지만 cast()
SELECT CAST(MONTHS_BETWEEN(SYSDATE, '2000-1-1') AS NUMBER(*, 2)) FROM dual;

/*예제 2 순위함수 rank(), 결과에 순위를 메겨 반환
employees 테이블에서 급여 순위에 따라 사번,이름,급여 조회*/
SELECT RANK() OVER (ORDER BY salary desc) 급여순위, EMPLOYEE_ID 사번, first_name 이름, salary 급여 FROM EMPLOYEES a;
-- 부서별로 급위 순위에 따라 부서번호, 사원번호, 이름, 급여를 조회
SELECT department_id 부서번호, RANK() OVER (PARTITION BY department_id ORDER BY salary desc) 급여순위, EMPLOYEE_ID 사번, first_name 이름, salary 급여 FROM EMPLOYEES a;

/*예제 3 피벗 구현 - 세로로 출력되는 결과값을 가로로 변환, 피벗 테이블 만들기
employees 테이블에서 직업번호별 사원수를 각 직업번호 값을 컬럼으로 변환해 부서번호로 정렬*/
SELECT * FROM (SELECT DEPARTMENT_ID, JOB_ID, EMPLOYEE_ID FROM EMPLOYEES a)
	pivot(COUNT(EMPLOYEE_ID)
	FOR JOB_ID IN ('AD_PRES','AD_VP','AD_ASST','FI_MGR','FI_ACCOUNT','AC_MGR','AC_ACCOUNT','SA_MAN','SA_REP','PU_MAN','PU_CLERK','ST_MAN','ST_CLERK','SH_CLERK','IT_PROG','MK_MAN','MK_REP','HR_REP','PR_REP'))
	ORDER BY DEPARTMENT_ID;

	--employees 테이블에서 부서별 사원수를 각 부서번호 값을 컬럼으로 변환해서 직업번호로 정렬
SELECT * FROM (SELECT DEPARTMENT_ID, JOB_ID, EMPLOYEE_ID FROM EMPLOYEES a)
	pivot(COUNT(EMPLOYEE_ID)
	FOR department_id IN (10,20,30,40,50,60,70,80,90,100,110))
	--('Administration','Marketing','Purchasing','Human Resources','Shipping','IT','Public Relations','Sales','Executive','Finance','Accounting','Treasury','Corporate Tax','Control And Credit','Shareholder Services','Benefits','Manufacturing','Construction','Contracting','Operations','IT Support','NOC','IT Helpdesk','Government Sales','Retail Sales','Recruiting','Payroll'))
	ORDER BY JOB_ID;


-- 예제
CREATE TABLE stdTBL (
name VARCHAR2(15) PRIMARY KEY NOT NULL,
region VARCHAR2(12) NOT NULL
);
ALTER TABLE stdTBL RENAME  COLUMN NAME TO full_name;

CREATE TABLE clubTBL(
club_name VARCHAR2(24) PRIMARY KEY NOT NULL,
club_room VARCHAR2(8) NOT NULL
);

CREATE TABLE stdclubTBL(
std_number NUMBER(4) NOT null,
full_name VARCHAR2(15) NOT NULL,
club_name VARCHAR2(24) NOT NULL,
CONSTRAINT FK_stdclub FOREIGN KEY (full_name) REFERENCES stdTBL(full_name)
);
ALTER TABLE stdclubTBL ADD PRIMARY KEY (std_number);
ALTER TABLE stdclubTBL ADD CONSTRAINT FK_stdclub_club_name FOREIGN KEY(club_name) REFERENCES clubTBL(club_name);

INSERT INTO STDTBL VALUES ('성시경', '서울');
INSERT INTO STDTBL VALUES ('조용필', '경기');
INSERT INTO STDTBL VALUES ('은지원', '경북');
INSERT INTO STDTBL VALUES ('바비킴', '서울');

INSERT INTO clubtbl VALUES ('수영','101호');
INSERT INTO clubtbl VALUES ('바둑','102호');
INSERT INTO clubtbl VALUES ('축구','103호');
INSERT INTO clubtbl VALUES ('봉사','104호');

CREATE SEQUENCE idSEQ
INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999
NOCYCLE NOCACHE NOORDER;

INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '김범수','바둑');
INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '김범수','축구');
INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '조용필','축구');
INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '은지원','축구');
INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '은지원','봉사');
INSERT INTO stdclubTBL VALUES (IDSEQ.NEXTVAL, '바비킴','봉사');

--실습6-1
SELECT S.full_name, S.region, C.club_name, c.club_room
 FROM STDTBL s
 	INNER JOIN stdclubTbl SC
 		ON s.FULL_NAME = sc.FULL_NAME
 	INNER JOIN clubtbl c
 		ON sc.club_name = c.Club_name
ORDER BY s.full_name;

--실습6-2
SELECT c.club_name, c.club_room, s.full_name, s.region
 FROM stdtbl  s
   	INNER JOIN stdclubTbl SC
   	ON s.full_name =sc.full_name
   	--USING(full_name) --안됨
   	INNER JOIN clubtbl c
   	ON sc.club_name = c.club_name
   	--USING(club_name) --안됨
   	ORDER BY c.club_name;

--실습7-1
SELECT S.full_name, S.region, C.club_name, c.club_room
 FROM STDTBL s
  left JOIN stdclubTbl SC -- 성시경은 클럽이 없고 학생목록에만 있으므로 s를 가르켜야함
 		ON s.FULL_NAME = sc.FULL_NAME
 	left JOIN clubtbl c
 		ON sc.club_name = c.Club_name
ORDER BY s.full_name;

--실습7-2
SELECT c.club_name, c.club_room, s.full_name, s.region
 FROM stdtbl  s LEFT JOIN stdclubTbl SC
   	ON s.full_name =sc.full_name
   	   	   	right JOIN clubtbl c -- 동아리를 기준한 정렬이므로 클럽쪽으로 right
   	ON sc.club_name = c.club_name
   	   	ORDER BY c.club_name;

SELECT S.full_name, S.region, C.club_name, c.club_room
 FROM STDTBL s
  left JOIN stdclubTbl SC
 		ON s.FULL_NAME = sc.FULL_NAME
 	left JOIN clubtbl c
 		ON sc.club_name = c.Club_name
union
SELECT c.club_name, c.club_room, s.full_name, s.region
 FROM stdtbl  s LEFT JOIN stdclubTbl SC
   	ON s.full_name =sc.full_name
   	   	   	right JOIN clubtbl c
   	ON sc.club_name = c.club_name;





/*join : 테이블을 연결하여 결과를 조회할 수 있도록 해주는 것
inner join : 동등조인, equi 조인, 내부 조인, 가장 많이 사용, 양쪽 테이블에 모두 있는 것에 대한 조회
outer join : 외부조인, 양쪽 테이블에 모두 있거나 한족에만 있는 것에 대한 조회
cross join : 카티션곱. 공통 컬럼에 의한 연결없이 테이블간 행의 조합, 테스트용 데이터 생성시
self join : 자체조인, 하나의 테이블에 있는 공통 컬럼을 서로 연결하여 조회 */

/*예제 4 inner join, outer join
employees 테이블의 사번과 departments 테이블의 부서명을 함께 조회하시오*/

SELECT e.employee_id, d.department_name
 FROM employees e
  INNER JOIN departments d
   ON e.department_id = d.department_id
   ORDER BY e.employee_id;
   -- 결과 : 106개의 데이터 조회됨 (두 테이블 모두에 존재하는 데이터만)
;
   --employees 테이블에서 특정 부서에 속하지 않는 사원도 포함하여 모든 사원번호와 부서명을 함게 조회
SELECT e.employee_id, d.department_name
 FROM employees e  left outer JOIN departments d -- outer는 생략 가능. 다 조회할 쪽을 left right로 가르키기
   ON e.department_id = d.department_id
   ORDER BY e.employee_id;

SELECT e.employee_id, d.department_name
 FROM departments d right outer JOIN employees e
   ON e.department_id = d.department_id
   ORDER BY e.employee_id; -- 결과: 107개의 데이터 조회 (178번 사원은 부서 없음)

SELECT e.employee_id, d.department_name
 FROM employees e  left outer JOIN departments d
   on e.department_id = d.department_id(+) -- 예전 아우터 조인에는 (+)기호가 있음
   ORDER BY e.employee_id;

   SELECT e.employee_id, d.department_name
 FROM employees e  left JOIN departments d
   USING(department_id) -- 두 테이블간의 공통 필드 이름이 같을 때 using 사용 가능
   ORDER BY e.employee_id;

   /*예제 5 3개의 테이블 inner join
   employees 테이블의 사번 150 직원의 사번, 이름, 부서명, 근무지의 모든 정보 조회
   부테이블 departments 근무지 테이블 locations*/

      SELECT e.employee_id, e.first_name, d.department_name, l.*
      FROM employees e  INNER JOIN departments d
        USING(department_id)
       INNER JOIN locations l
  ON d.location_id = l.location_id
--    USING(location_id)
    WHERE e.employee_id = 150;

    /*예제 6 self join employees 테이블에서 직원의 manager_id는 자신의 상급자 employee_id와 동일하다
    이를 이용해서 각 직원의 사번, 이름, 상급자 사번, 상급자 이름을 조회하라*/

      SELECT e1.employee_id "사 번", e1.first_name "이름" , e2.employee_id "상사 사번", e2.first_name "상사 이름"
      FROM employees e1, employees e2
      WHERE e1.manager_id = e2.employee_id;

    /*예제 7 cross join
    employees 테이블과 countries 테이블을 이용하여 테스트용 데이터를 생성하되 생성된 데이터 계수만 조회*/
    SELECT COUNT(*) "데이터 개수"  FROM employees cross JOIN countries;

    /*테이블복사 CTAS를 이용해서 employees_test 테이블을 생성*/
    CREATE TABLE employees_test AS
    	SELECT * FROM employees cross JOIN countries;

    	 /*예제 8 inner join
    	 employees 테이블에 job_id 에 CLERk이 들어간 직원의 이름, job_id, 부서이름, 부서위치(street_address)*/

    	  SELECT e.first_name, e.job_id, d.department_name, l.street_address
    	   FROM employees e
    	   INNER JOIN departments d
    	    USING(department_id)
    	   INNER JOIN locations l
    	   USING(location_id)
    	   WHERE e.job_id like '%CLERK%';