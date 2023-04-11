SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

--ROWNUM, ROWID
--(**로우넘: 쿼리에 의해 반환되는 행 번호를 출력)
--(로우아이디: 데이터베이스 내의 행의 주소를 반환)
SELECT ROWNUM, ROWID, employee_id

FROM employees;
