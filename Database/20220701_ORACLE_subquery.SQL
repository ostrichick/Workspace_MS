/*서브쿼리 subquery
정의
-하나의 쿼리문 안에 있는 다른 쿼리문
-메인 쿼리 안에서 추가적인 정보를 제공하는 쿼리문

종류
-일반 서브쿼리: where절에 위치
-인라인 뷰: from절에 위치
-스칼라 서브쿼리 - select절에 위치(1회 조회시마다 1행 1컬럼식 반환)

작성방법
-where절에서 서브쿼리를 연산자 오른족에 위치하고 반드시 괄호로 묶어야 한다
-서브쿼리에는 order by절을 쓸 수 없다 (인라인 뷰 제외)
- 단일행 서브쿼리는 비교 연산자와 함께 쓰인다
- 다중행 서브쿼리는 SQL연산자+비교연산자와 함께 쓰인다
*/

/*예제 3 단일형 서브쿼리
employees 테이블에서 이름이 Bruce인 직원의 급여보다 많은 급여를 받는 직원의 이름과 급여 조회*/

SELECT first_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Bruce');

/*예제 4 다중형 서브쿼리
employees 테이블ㄹ에서 구매부서department_id:30 에 속한 모든 사람의 급여보다 높은 급여를 받는 사원의 부서명 이름 급여를 조회*/
SELECT d.department_name 부서병, e.first_name 이름, e.salary 급여
 FROM employees e INNER JOIN departments d
 USING (department_id)
 WHERE e.salary > all(SELECT e.salary FROM employees e WHERE department_id = 30); -- 결과가 여러행이므로 sql 연산자 all을 사용해서 제한함
 --WHERE e.salary > (SELECT max(SELECT e.salary FROM employees e WHERE department_id = 30)) --

/*예제 5 인라인 뷰
employees, departments 테이블에서 직번에 CLERK이 들어가는 직원들의 이름 직번 부서명 조회*/
SELECT e.first_name, e.job_id, d.department_name
	FROM employees e INNER JOIN departments d
	USING (department_id)
	WHERE job_id LIKE '%CLERK%';

SELECT e.first_name, e.job_id, d.department_name
	FROM (SELECT first_name, job_id, department_id FROM employees WHERE job_id LIKE '%CLERK%') e
	INNER JOIN departments d
	USING (department_id);

/*예제 6 스칼라 서브쿼리
employees 테이블에서 각 사원의 이름, 급여, 전 사원의 평균 급여를 조회*/
SELECT first_name, salary, (SELECT CAST(AVG(salary) AS NUMBER(*,2)) FROM employees) 평균급여 FROM employees;