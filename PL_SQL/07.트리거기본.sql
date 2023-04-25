
/*
trigger�� ���̺� ������ ���·ν�, INSERT, UPDATE, DELETE �۾��� ����� ��
Ư�� �ڵ尡 �۵��ǵ��� �ϴ� �����̴�.
VIEW���� ������ �Ұ����ϴ�.

Ʈ���Ÿ� ���� �� ���� �����ϰ� F5��ư���� �κ� �����ؾ� �Ѵ�.
�׷��� ������ �ϳ��� �������� �νĵǾ� ���� �������� �ʴ´�.
*/

CREATE TABLE tb1_test(
    id NUMBER(10),
    text VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE --Ʈ������ �߻� ����. (���� or ���� ���Ŀ� ����)
    ON tb1_test --Ʈ���Ÿ� ������ ���̺�
    FOR EACH ROW  --�� �࿡ ��� ����.(���� ����. ���� �� �� ���� ����)
--DECLARE�� ���� ����
BEGIN
    dbms_output.put_line('Ʈ���Ű� ������!'); --�����ϰ��� �ϴ� �ڵ带 begin ~ end�� ����.
END;

INSERT INTO tb1_test VALUES(1, '��ö��'); --���� X

UPDATE tb1_test SET text = '��ǻ�' WHERE id = 1;
DELETE FROM tb1_test WHERE id = 1;

