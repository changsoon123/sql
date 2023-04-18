--insert
--테이블 구조 확인
DESC departments;


--INSERT의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정) (칼럼에 모든 값을 다 입력해야됨)
INSERT INTO departments
VALUES(290,'영업부', 100, 2300); 

SELECT * FROM departments;
ROLLBACK; --실행 시점을 다시 뒤로 되돌리는 키워드

-- INSERT의 두 번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 확인!!)
INSERT INTO departments
    (department_id,department_name,location_id)
    VALUES(280,'개발자',1700);

--사본 테이블 생성 (WHERE 절로 FALSE를 걸어주면 구조만 복사하고 데이터는 가져오지 않는다)
--사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
--WHERE절에 FALSE값 (1 = 2) 지정하면 -> 테이블의 구조만 복사하고 데이터는 복사 X
CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);
    
SELECT * FROM managers;
DROP TABLE managers;

--INSERT (서브쿼리)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);
    
-----------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않는다.
제약조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이
DB에 저장되는 것을 방지하는 목적으로 사용한다.
*/
