SELECT *
FROM SCOTT.CONTACTS;

-- ��ȭ��ȣ �����ϱ�
UPDATE SCOTT.CONTACTS
SET
    CONTACT_TEL = '010-1122-3344'
WHERE
    CONTACT_NAME = 'ȫ�浿';
    
-- �̸� �����ϱ�, ��ü���� �������� ���� ����
UPDATE SCOTT.CONTACTS
SET
    CONTACT_NAME = '������'
WHERE
    CONTACT_NAME = '������';
    
-- SCOTT_CONTACTS�� ���� ���̺��� ���Ǿ �����ϱ�
CREATE SYNONYM CONTACTS FOR SCOTT.CONTACTS;

SELECT *
FROM CONTACTS;

-- ������� ��� ���̺� ���� ��ȸ
SELECT *
FROM USER_TABLES;

-- ������� ��� �� ���� ��ȸ
SELECT *
FROM USER_VIEWS;

-- ������� ��� ������ ���� ��ȸ
SELECT *
FROM USER_SEQUENCES;

-- ��� ����� ���� ��ȸ
SELECT *
FROM USER_USERS;

-- ���� ������ ����ϱ�
-- ��� ����� ���� �� ������ �ٹ��ߴ� ������ ��ȸ�ϱ�
-- ������� �ѹ��� ǥ���ϱ�
SELECT EMPLOYEE_ID, JOB_ID -- ���� �ٹ����� ���� ��ȸ�ϱ�
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID -- ������ �ٹ��ߴ� ���� ��ȸ�ϱ�
FROM JOB_HISTORY;

-- ��� ����� ���� �μ����̵�� ���� �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, DEPARTMENT_ID
FROM JOB_HISTORY;

-- ���� �����ϴ� ������ ���� �������� �����ϰ� �ִ� ����� ���̵�� �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID, JOB_ID
FROM JOB_HISTORY;

-- ���� ����� ���� ������ ����� ����
SELECT A.EMPLOYEE_ID, A.JOB_ID
FROM EMPLOYEES A, JOB_HISTORY B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND A.JOB_ID = B.JOB_ID;

-- ������ ����� ���� ���� ����� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
FROM EMPLOYEES
MINUS
SELECT EMPLOYEE_ID
FROM JOB_HISTORY;

-- ������ ����� ���� ���� ����� ���̵�� �̸��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, B.FIRST_NAME
FROM (SELECT EMPLOYEE_ID
      FROM EMPLOYEES
      MINUS
      SELECT EMPLOYEE_ID
      FROM JOB_HISTORY) A, EMPLOYEES B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
ORDER BY 1;

-- ������ ����� ���� ���� ����� ���̵�, �̸�, ���� ����, �Ҽ� �μ����� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, B.FIRST_NAME, B.JOB_ID, C.DEPARTMENT_NAME
FROM (SELECT EMPLOYEE_ID
      FROM EMPLOYEES
      MINUS
      SELECT EMPLOYEE_ID
      FROM JOB_HISTORY) A, EMPLOYEES B, DEPARTMENTS C
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND B.DEPARTMENT_ID = C.DEPARTMENT_ID;

-- ��� ����� ���� �� ������ �ٹ��ߴ� ������ ��ȸ�ϱ�
-- ������̵�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, JOB_ID, SALARY
FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID, 0
FROM JOB_HISTORY;