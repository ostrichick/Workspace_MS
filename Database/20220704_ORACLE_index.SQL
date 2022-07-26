/*인덱스 index
데이터를 좀 더 빠르게 찾을 수 있도록 해주는 도구
책의 찾아보기 색인과 같은 역할
데이터 주소값을 갖고 있는 개체
key컬럼과 rowid 컬럼으로 이루어진 객체

생성과정
전체 테이블 스캔 - 정렬 - 블록 기록
테이블 생성시 제약조건 primary key 또는 unique를 사용하면 인덱스가 자동 생성

생성구문
create [unique] index 인덱스명
 on 테이블명(컬럼명)

 --unique 인덱스: 해당 컬럼에 입력되는 값이 유일해야 함
 (주의) 현재 중복된 값이 없다고 unique 인덱스로 생성하면 안되고
 업무 절차상 절대로 중복된 값이 없을 경우 unique 인덱스로 생성함 (예: 주민등록번호, 학번 등)

 삭제구문
 drop index 인덱스명;

 장점
 검색속도 향상시킴 (항상은 아님)
 해당 쿼리의 부하를 줄여 시스템 성능 향상

 단점
 전체 데이터베이스의 약 10%정도의 추가 공간이 필요함
 처음 인덱스를 생성하는데 많은 시간이 소요됨
 데이터의 변경작업이 많이 일어나는 인덱스는 성능을 저하시킴

 활용지침
 자주 조회되는 컬럼을 인덱스컬럼으로 선택한다
 테이블간 조인에 사용되는 컬럼을 인덱스 컬럼으로 선택하면 조인 성능이 향상된다
 데이터양이 적은 테이블의 경우 굳이 인덱스를 만들 필요가 없다
 데이터의 중복도가 높은 컬럼은 인덱스를 만들어도 별 효과가 없다
 복합 인덱스를 구성할 경우 컬럼의 순서는 select 문의 where절에서 좀 더 자주 사용되는 컬럼을 먼저 오게한다
 데이터의 추가 수정 삭제가 많이 발생하는 테이블에는 인덱스를 너무 많이 만들지 않도록 한다
 (데이터의 변경이 발생하면 그에 따른 인덱스 정보도 갱신되므로 DBMS성능에 영향을 줌)
 사용하지 않는 인덱스는 제거 (주기적으로 점검해서 사용하지 않는 인덱스는 제거하고 사용하는
 인덱스는 alter index 인덱스명 rebuild 문으로 인덱스를 재구성해서 조각화를 최소화하도록 함)
*/

/*예제 1 인덱스 생성하기
CTAS 이용해 employees_test 테이블을 복사해서 employees_test2 테이블 생성*/
CREATE TABLE employees_test2 AS (SELECT * FROM employees_test);

--employess_text 테이블에서 salary 컬럼을 인덱스로 생성
CREATE INDEX emp_test_salary_ix ON employees_test(salary);


--salary가 5000보다 많은 직원의 모든 정보를 각각의 테이블에서 조회

SELECT * FROM employees_test WHERE salary > 5000; -- 0.55초
SELECT * FROM employees_test2 WHERE salary > 5000; -- 0.56초 50%이상 조회, 중복된 값이 많음

--employees_test 테이블에 있는 emp_test_salary_ix 인덱스를 삭제

DROP INDEX emp_test_salary_ix ;

/*예제 2 인덱스 생성
개체탐색기로 employees 테이블에 생성된 인덱스를 확인하여 employees_sample 테이블에도 emp_sample_인덱스_ix로 각각 인덱스 생성*/

CREATE TABLE employees_sample3 AS (SELECT * FROM employees);

CREATE INDEX emp_sample_department_ix ON employees_sample3(department_id);
CREATE INDEX emp_sample_job_ix ON employees_sample3(job_id);
CREATE INDEX emp_sample_manager_ix ON employees_sample3(manager_id);
CREATE INDEX emp_sample_name_ix ON employees_sample3(last_name,first_name);

