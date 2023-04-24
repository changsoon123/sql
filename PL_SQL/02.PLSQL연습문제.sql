
--1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����.(��¹� 9���� �����ؼ� ������)

--2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
--�͸����� ����� ����.(������ ��Ƽ� ����ϼ���.)

--3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
--employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
--SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
-- <�����>: steven
--<�̸���>: stevenjobs
--<�Ի�����>: ���ó�¥
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
            v_emp_name,v_dep_name --��ȸ ����� ������ ����
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 201;
    
    dbms_output.put_line(v_emp_name || '-' || v_dep_name);
END;


--3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
--employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
--SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
-- <�����>: steven
--<�̸���>: stevenjobs
--<�Ի�����>: ���ó�¥
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