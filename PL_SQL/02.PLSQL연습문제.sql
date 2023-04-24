
--1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자.(출력문 9개를 복사해서 쓰세요)

--2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
--익명블록을 만들어 보자.(변수에 담아서 출력하세요.)

--3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
--employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
--SELECT절 이후에 INSERT문 사용이 가능합니다.
-- <사원명>: steven
--<이메일>: stevenjobs
--<입사일자>: 오늘날짜
--<job_id>: CEO
SET SERVEROUTPUT ON;

DECLARE
    emp_num NUMBER;

BEGIN
    emp_num :=1;
    DBMS_OUTPUT.put_line(emp_num*3);
    DBMS_OUTPUT.put_line(emp_num*6);
    DBMS_OUTPUT.put_line(emp_num*9);
    DBMS_OUTPUT.put_line(emp_num*12);
    DBMS_OUTPUT.put_line(emp_num*15);
    DBMS_OUTPUT.put_line(emp_num*18);
    DBMS_OUTPUT.put_line(emp_num*21);
    DBMS_OUTPUT.put_line(emp_num*24);
    DBMS_OUTPUT.put_line(emp_num*27);
END;

DECLARE
    v_emp_name employees.first_name%TYPE; 
    v_dep_name employees.email%TYPE; 
BEGIN
    SELECT
        e.first_name,
        e.email
        INTO
            v_emp_name,v_dep_name --조회 결과를 변수에 대입
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 201;
    
    dbms_output.put_line(v_emp_name || '-' || v_dep_name);
END;


--3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
--employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
--SELECT절 이후에 INSERT문 사용이 가능합니다.
-- <사원명>: steven
--<이메일>: stevenjobs
--<입사일자>: 오늘날짜
--<job_id>: CEO

DECLARE
    v_employee_id employees.employee_id%TYPE;
    v_emp_name employees.last_name%TYPE; 
    v_email employees.email%TYPE;
    v_hire_date employees.hire_date%TYPE; 
    v_job_id employees.job_id%TYPE;
BEGIN
    SELECT
         MAX(e.employee_id)
         INTO
            v_employee_id
    FROM employees e;
  
    
    INSERT INTO emps
    (employee_id,last_name,email,hire_date,job_id)
    VALUES(v_employee_id+1, 'steven','stevenjobs',sysdate,'CEO');
    COMMIT;
END;