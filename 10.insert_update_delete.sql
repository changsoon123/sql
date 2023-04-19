--insert
--���̺� ���� Ȯ��
DESC departments;


--INSERT�� ù��° ��� (��� �÷� �����͸� �� ���� ����) (Į���� ��� ���� �� �Է��ؾߵ�)
INSERT INTO departments
VALUES(290,'������', 100, 2300); 

SELECT * FROM departments;
ROLLBACK; --���� ������ �ٽ� �ڷ� �ǵ����� Ű����

-- INSERT�� �� ��° ��� (���� �÷��� �����ϰ� ����, NOT NULL Ȯ��!!)
INSERT INTO departments
    (department_id,department_name,location_id)
    VALUES(280,'������',1700);

--�纻 ���̺� ���� (WHERE ���� FALSE�� �ɾ��ָ� ������ �����ϰ� �����ʹ� �������� �ʴ´�)
--�纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
--WHERE���� FALSE�� (1 = 2) �����ϸ� -> ���̺��� ������ �����ϰ� �����ʹ� ���� X
CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);
    
SELECT * FROM managers;
DROP TABLE managers;

--INSERT (��������)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);
    
-----------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS�� ����ϸ� ���� ������ NOT NULL ������ ������� �ʴ´�.
���������� ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
DB�� ����Ǵ� ���� �����ϴ� �������� ����Ѵ�.
*/

--UPDATE�� ������ ���� ������ ������ �� �� �����ؾ� �Ѵ�.
--�׷��� ������ ���� ����� ���̺� ��ü�� ����ȴ�.
UPDATE emps SET salary = 30000;

SELECT * FROM emps;
ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;

UPDATE emps SET
phone_number = '010.4742.8917' , manager_id = 102
WHERE employee_id = 100;
SELECT * FROM emps;
ROLLBACK;

-----------------------------------

--UPDATE (��������)
UPDATE emps
    SET (job_id, salary, manager_id) =
    (
    SELECT job_id, salary, manager_id
    FROM emps
    WHERE employee_id = 100
    )
WHERE employee_id = 101;
SELECT * FROM emps;
ROLLBACK;

--DELETE
DELETE FROM emps
WHERE employee_id = 103;

SELECT * FROM emps;
ROLLBACK;

--�纻 ���̺� ����
CREATE TABLE depts AS (SELECT * FROM departments);

-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM depts
                        WHERE department_name = 'IT');
SELECT * FROM depts;
ROLLBACK;
