-- ��������(��ü����)
-- 101�� ����� �̸�, ����, �ڽ��� ����̸��� ��ȸ�ϱ�
SELECT EMP.FIRST_NAME, EMP.JOB_ID "������ ����", MGR.FIRST_NAME "����� �̸�"
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.EMPLOYEE_ID = 101
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- 60�� �μ��� �ٹ����� ����� ���̵�, �̸�, ����� ����, ����� �̸�, ����� ����,
-- ������ �ҼӺμ����̵�, ������ �ҼӺμ���, �μ������� ���̵�, �μ������� �̸��� ��ȸ�ϱ�
SELECT ����.EMPLOYEE_ID, 
����.FIRST_NAME, 
����.JOB_ID "������ ����", 
���.FIRST_NAME "����� �̸�",
���.JOB_ID "����� ����",
�μ�.DEPARTMENT_ID "�ҼӺμ� ���̵�",
�μ�.DEPARTMENT_NAME "�ҼӺμ� �̸�",
�μ�.MANAGER_ID "������ ���̵�",
�μ�������.FIRST_NAME "�μ��� ������ �̸�"
FROM EMPLOYEES ����, EMPLOYEES ���, DEPARTMENTS �μ�, EMPLOYEES �μ�������
WHERE ����.DEPARTMENT_ID = 60
AND ����.MANAGER_ID = ���.EMPLOYEE_ID         -- ������ ��簣�� ��������
AND ����.DEPARTMENT_ID = �μ�.DEPARTMENT_ID   -- ������ �ҼӺμ����� ��������
AND �μ�.MANAGER_ID = �μ�������.EMPLOYEE_ID;  -- �μ��� �μ������ڰ��� ��������

-- ��������
-- �μ����̵�, �μ���, �μ������ھ��̵�, �μ������� �̸� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+)
ORDER BY A.DEPARTMENT_ID;

-- ��� ������ �̸�, �޿�, �������̵�, �ҼӺμ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
ORDER BY A.EMPLOYEE_ID;

-- ������ �Լ� ����ϱ�
-- EMPLOYEES�� ��� ���� ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES;

-- 50�� �μ����� ���ϴ� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
SELECT COUNT(COMMISSION_PCT)    -- �÷��� �����ϸ� �ش� �÷��� ���� NULL�� �ƴ� �͸� ī��Ʈ�Ѵ�.
FROM EMPLOYEES;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- ������ �߿��� ���� ���� �޿��� �޴� ������ �޿��� ��ȸ�ϱ�
SELECT MAX(SALARY)
FROM EMPLOYEES;

-- �ְ�޿��� �޴� ����� �̸��� �ְ�޿��� ��ȸ�ϱ�(����)
SELECT FIRST_NAME, MAX(SALARY)  -- ���� : �׷��Լ��� �׷��Լ��� �ƴ� ǥ������ ���� ����� �� ����.
FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);
                
-- ��ȸ�� ���� ������ ���ϱ�
-- COUNT(*) : ��ȸ�� ��� ���� ������ ��ȯ�Ѵ�.
-- COUNT(�÷���) : �ش� �÷��� ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
-- COUNT(DISTINCT �÷���) : �ش� �÷��� ���� ���� �ߺ��� ���� 1���� ī��Ʈ�ؼ� ���� ������ ��ȯ�Ѵ�.
SELECT COUNT(*)
FROM EMPLOYEES;     -- 107

SELECT COUNT(JOB_ID)
FROM EMPLOYEES;     -- 107

SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;     -- 19

SELECT COUNT(DISTINCT TO_CHAR(HIRE_DATE, 'YYYY'))
FROM EMPLOYEES;

SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEES;

-- ��ȸ�� ���� Ư�� �÷��� ���� �հ踦 ���ϱ�
-- SUM(�÷���) : �ش� �÷��� �� �߿��� NULL�� ������ ������ �հ踦 ��ȯ�Ѵ�.
SELECT SUM(SALARY)      -- ��ü ������� �޿� �Ѿ�
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT)      -- ��ü ������� Ŀ�̼ǿ� ���� �հ�
FROM EMPLOYEES;                 -- Ŀ�̼� ���� NULL�� ���� ��꿡 ���Ե��� ����

-- ��ȸ�� ���� Ư�� �÷��� ���� ����� ���ϱ�
-- AVG(�÷���) : �ش� �÷��� �� �߿��� NULL�� ������ ���� ���� ��鿡 ���� ��հ��� ��ȯ�Ѵ�.
SELECT TRUNC(AVG(SALARY))       -- ��ü �������� �޿� ���
FROM EMPLOYEES;

SELECT TRUNC(AVG(COMMISSION_PCT), 2)
FROM EMPLOYEES;

-- ��ȸ�� ���� Ư�� �÷��� ���� �ִ밪, �ּҰ� ���ϱ�
-- MIN(�÷���) : �ش� �÷��� �� �߿��� NULL�� ������ ���� ���� ���� ��ȯ�Ѵ�.
-- MAX(�÷���) : �ش� �÷��� �� �߿��� NULL�� ������ ���� ū ���� ��ȯ�Ѵ�.
SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES;

SELECT MIN(COMMISSION_PCT), MAX(COMMISSION_PCT)
FROM EMPLOYEES;

-- GROUP BY�� �׷��Լ��� ����ؼ� ������ �����ϱ�
-- ������ �������� ��ȸ�ϱ�
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- �Ի�⵵�� �����
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1;