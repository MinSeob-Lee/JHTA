-- �μ����̺��� ��� �μ� ������ ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS;
-- �μ����̺��� ��ġ���̵� 1700���� �ƴ� �μ� ���� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE LOCATION_ID != 1700;
-- 100����� �����ϴ� �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100;
-- �μ����� 'IT'�� �μ��� ���� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';
-- ��ġ���̵� 1700���� ������ �ּ�, �����ȣ, ���ø�, �����ڵ带 ��ȸ�ϱ�
SELECT STREET_ADDRESS, POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE LOCATION_ID = 1700;
-- �ּұ޿��� 2000�̻� 5000������ ������ �������̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MIN_SALARY >= 2000
AND MAX_SALARY <= 5000;
-- �ִ�޿��� 20000���� �ʰ��ϴ� ������ ���̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY > 20000;
-- 100�������� �����ϴ� ����� ���̵�, �̸�, �μ����̵��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100;
-- 80�� �μ����� �ٹ��ϰ� �޿��� 8000�� �̻� �޴� ����� ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY >= 8000;
-- ������ SA_REP�̰�, Ŀ�̼�����Ʈ�� 0.25�̻��� ����� ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REF'
AND COMMISSION_PCT >= 0.25;
-- 80�� �μ��� �ٹ��ϰ�, �޿��� 10000�� �̻��� ����� ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
    ���� = (�޿� + �޿�*Ŀ�̼�)*12��
    ������ ��Ī�� annual_salary��.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY + SALARY * COMMISSION_PCT) * 12 AS ANNUAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY >= 10000;
-- 80�� �μ��� �ٹ��ϰ�, 147�� �������� �����ϴ� ��� �߿��� Ŀ�̼��� 0.1�� ����� 
    ������̵�, �̸�, ����, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND MANAGER_ID = 147
AND COMMISSION_PCT = 0.1;
-- ������� �����ϴ� ������ �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- ������� �Ҽӵ� �μ����̵� ��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID
FROM DEPARTMENTS;
-- �޿��� 12000�� �Ѵ� ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;
-- �޿��� 5000�̻� 12000������ ����� �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000;
-- 2007�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%07';
-- 20�� 50�� �μ��� �Ҽӵ� ����� �̸��� �μ���ȣ�� ��ȸ�ϰ�, �̸��� ���ĺ������� �����ؼ�  ��ȸ�ϱ�
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20
AND DEPARTMENT_ID = 50
ORDER BY FIRST_NAME ASC;
-- �޿��� 5000�̻� 12000���ϰ�, 20���� 50�� �μ��� �Ҽӵ� ����� �̸��� �޿�, �μ���ȣ�� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000
AND DEPARTMENT_ID = 20
AND DEPARTMENT_ID = 50;
-- �����ڰ� ���� ����� �̸��� ����, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;
-- ������ 'SA_MAN'�̰ų� 'ST_MAN'�� �����߿��� �޿��� 8000�̻� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'
AND SALARY >= 8000;
? 2020 GitHub, Inc.