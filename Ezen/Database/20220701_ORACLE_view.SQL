/*뷰 view
정의
-가상의 테이블
-직접 데이터를 소유하지 않고 검색시 이용할 수 있도록 정보를 담고 있는 객체
-테이블 데이터의 부분 집합

장점
-보안에 도움이 된다: 보안이 필요한 데이터를 제외하고 테이블 구성 가능
-복잡한 쿼리를 단순화시켜줄 수 있다

용도
-기본적으로 읽기 전용으로 사용되지만 원본 테이블을 갱신할 수도 있다

활용
-생성 구문(기존에 같은 이름의 뷰가 있으면 덮어씀)
 create or replace view 뷰이름
 	as 쿼리문
 		[with read only];

-삭제 구문 : drop view 뷰이름;
*/

/*예제 1 조인 뷰
부서 위치가 미국country_id:'US' 인 직원의 평균 급여보다 많은 급여를 받는 직원의 이름 직책job_title 급여를 조회*/

;
-- 미국 부서 직원의 평균 급여
	SELECT AVG(e.salary) FROM EMPLOYEES e INNER JOIN DEPARTMENTS d
 	USING(department_id)
 	INNER JOIN locations l
 	ON d.location_id = l.location_id
 	AND l.country_id = 'US';

SELECT e1.first_name, j.job_title, e1.salary
 FROM employees e1 INNER JOIN jobs j
 USING(job_id)
 WHERE e1.salary > (
 SELECT AVG(e1.salary)
 FROM EMPLOYEES e1 INNER JOIN DEPARTMENTS d
 	USING(department_id)
 	INNER JOIN locations l
 	ON d.location_id = l.location_id
 	AND l.country_id = 'US');

 --위 쿼리문으로 high_salary_in_US_vw 뷰를 생성
 CREATE OR REPLACE VIEW high_salary_in_US_vw
 	AS(
 		SELECT e1.first_name, j.job_title, e1.salary
 		FROM employees e1 INNER JOIN jobs j
 		USING(job_id)
 		WHERE e1.salary > (
 		SELECT AVG(e1.salary)
 		FROM EMPLOYEES e1 INNER JOIN DEPARTMENTS d
 		USING(department_id)
 		INNER JOIN locations l
 		ON d.location_id = l.location_id
 		AND l.country_id = 'US')
 	)
 	WITH READ ONLY;
 	-- 뷰를 이용해서 미국 부서의 평균 급여보다 많이 받는 직원의 이름,직책,급여 조회
 	SELECT * FROM high_salary_in_US_vw;

 	/* 	원본 테이블을 갱신할 수 있는 뷰(updatable view) 유의사항
 	- with read only 옵션을 적용하지 않으면 updatable view로 생성됨
 	- updatable view로 생성되더라도 원본 테이블이 가지고 있는 not null 컬럼을 뷰가 모두 가지지 않으면 insert 할 수 없음
 	- view 생성 쿼리에 다음의 내용을 포함하면 갱신할 수 없음 교재p361
 			- union, union all
 			- distinct
 			- 집계함수, 분석함수
 			- group by, order by
 			- 서브쿼리
 			- 컬럼 리스트에 의사컬럼(rowid, rownum)사용
 			(대충 순서를 바꾸거나 데이터를 합치는 명령어 썼으면 아무튼 안됨)*/

/*예제 2 조인, 뷰
employees, departments 테이블에서 부서이름 부서별 최소, 최대, 평균 급여 조회 (소수점 2자리*/
;
SELECT d.department_name, MIN(e.salary), MAX(e.salary), CAST(AVG(e.salary) AS NUMBER (*,2))
 FROM employees e INNER JOIN departments d
 USING (department_id)
 GROUP BY d.department_name;

 -- 위 쿼리문으로 dept_salary_vw 뷰 생성
 CREATE OR REPLACE VIEW dept_salary_vw
 	AS
 		(SELECT d.department_name 부서명, MIN(e.salary) 최소, MAX(e.salary) 최대, CAST(AVG(e.salary) AS NUMBER (*,2)) 평균
 			FROM employees e INNER JOIN departments d
 			USING (department_id)
 			GROUP BY d.department_name
 		)
 WITH READ ONLY;
 SELECT * FROM dept_salary_vw;

