���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PLOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees);


SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees);


SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees
WHERE job_id='IT_PROG'
);


���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.

SELECT e.* 
FROM employees e
WHERE e.department_id IN (SELECT d.department_id
                        FROM departments d
                        WHERE d.manager_id='100');


���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� �ִ� ��� ����� �����͸� ����ϼ���.
    
    SELECT *
    FROM employees
    WHERE manager_id > (SELECT manager_id FROM employees WHERE first_name = 'Pat');
    
    SELECT *
    FROM employees
    WHERE manager_id IN (SELECT manager_id FROM employees WHERE first_name = 'James');
    
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
SELECT * FROM(
    SELECT ROWNUM AS ddd,first_name
    FROM (
        SELECT first_name
        FROM employees
        ORDER BY first_name DESC
    )
)
WHERE ddd > 40 AND ddd < 51;

���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
�Ի����� ����ϼ���.

SELECT *
FROM(
        SELECT ROWNUM AS wh, ddo.*
        FROM(
            SELECT first_name,employee_id,hire_date
            FROM employees
            ORDER BY hire_date ASC
        ) ddo
    )
WHERE wh > 30 AND wh <41;

���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����

SELECT e.employee_id,(e.first_name || ' ' || e.last_name) AS name,e.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;

���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

SELECT e.employee_id,(e.first_name || ' ' || e.last_name) AS name,e.department_id,
    (SELECT d.department_name
        FROM departments d
        WHERE e.department_id = d.department_id)
FROM employees e
ORDER BY e.employee_id ASC;

���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����

SELECT d.department_id , 
d.department_name, 
d.manager_id, 
d.location_id, 
loc.street_address,
loc.postal_code,
loc.city
FROM departments d LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;


���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

SELECT d.department_id , 
d.department_name, 
d.manager_id, 
d.location_id, 
(SELECT loc.street_address
FROM locations loc
WHERE d.location_id = loc.location_id) AS street_address,
(SELECT loc.postal_code
FROM locations loc
WHERE d.location_id = loc.location_id) AS postal_code,
(SELECT loc.city
FROM locations loc
WHERE d.location_id = loc.location_id) AS city
FROM departments d
ORDER BY d.department_id ASC;

���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����

SELECT
    loc.location_id ,loc.street_address ,loc.city, cou.country_id,cou.country_name
FROM locations loc LEFT JOIN countries cou
ON loc.country_id = cou.country_id
ORDER BY country_name ASC;

���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

SELECT
    loc.location_id ,loc.street_address ,loc.city,
    (SELECT cou.country_id
        FROM countries cou
        WHERE loc.country_id = cou.country_id) AS country_id,
        (SELECT  cou.country_name
        FROM countries cou
        WHERE loc.country_id = cou.country_id) AS country_name
FROM locations loc
ORDER BY country_name ASC;

--������ ��°��� �ΰ� �̻��̶� �Ұ���
--��Į�� ������ ������ ��°��� �Ѱ��� ���Ϸ� �̾ƾߵ�
--location�� �ִ� country_id�� �ߺ��̾ ����

SELECT 
    c.country_id,
    c.country_name,
    (
        SELECT loc.location_id
        FROM locations loc
        WHERE c.country_id = loc.country_id
    ) AS location_id
FROM countries c
ORDER BY country_name ASC;

���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.

SELECT *
FROM(
    SELECT ROWNUM AS al , tp.*
    FROM(
        SELECT
            e.employee_id, e.first_name, e.phone_number , e.hire_date, d.department_id, d.department_name
        FROM employees e LEFT JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY e.hire_date ASC
    ) tp
)
WHERE al > 0 AND al <11 ;

���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.

SELECT e.LAST_NAME, e.JOB_ID, 
e.DEPARTMENT_ID,d.DEPARTMENT_NAME
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE job_id = 'SA_MAN';

���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.

    SELECT COUNT(e.employee_id), tp.department_id, tp.department_name, tp.manager_id
    FROM (
  SELECT d.department_id, d.department_name, d.manager_id
  FROM departments d
        ) tp
JOIN employees e ON tp.department_id = e.department_id
GROUP BY tp.department_id, tp.department_name, tp.manager_id
ORDER BY COUNT(e.employee_id) DESC;
    


--SELECT COUNT(*), d.department_id, d.department_name, d.manager_id
--FROM employees e LEFT JOIN departments d
--ON e.department_id = d.department_id
--WHERE e.department_id IS NOT NULL
--GROUP BY d.department_id;


--WHERE e.department_id IN (
--    SELECT d.department_id, d.department_name, d.manager_id
--    FROM departments d
--)
--ORDER BY si DESC;

���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.

SELECT e.department_id , AVG(salary)
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id LEFT JOIN locations loc
ON d.location_id = loc.location_id
GROUP BY e.department_id; 

���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
����ϼ���.
SELECT *
    FROM(
    SELECT ROWNUM AS ro, toto.*
    FROM(
    SELECT e.department_id , AVG(salary)
    FROM employees e LEFT JOIN departments d
    ON e.department_id = d.department_id LEFT JOIN locations loc
    ON d.location_id = loc.location_id
    GROUP BY e.department_id
    ORDER BY e.department_id DESC
    ) toto
    )
WHERE ro > 0 AND ro <11;