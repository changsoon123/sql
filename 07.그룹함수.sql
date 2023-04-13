
--그룹 함수 AVG,MAX,MIN,SUM,COUNT

--그룹화를 지정하지 않으면 전체 테이블
SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary) --널 값 제외
FROM employees;

SELECT COUNT(*) FROM employees; --총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; --널 값 제외
SELECT COUNT(manager_id) FROM employees; --한명이 없음 널 값 제외

--부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

--그룹함수만 쓰면 사용 가능
--주의할 점!!그룹함수는 일반 컬럼과 동시에 그냥 출력할 수는 없다.
SELECT
    department_id,
    AVG(salary)
FROM employees; --에러

--group by절을 사용할 때 groub절에 묶이지 않으면 다른 컬럼을 조회할 수 없다.
SELECT
    job_id
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; --에러

--group by절 2개 이상 사용
SELECT
    job_id
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id,job_id
ORDER BY department_id;

--GROUB BY를 통해 그룹화를 할 때 조건을 걸 경우 HAVING을 사용.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT 
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING count(*) >= 5;

--부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 월급 평균이 5000이상만 조회
SELECT 
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id >=50
GROUP BY department_id
HAVING Avg(salary) >= 5000
ORDER BY department_id DESC;






