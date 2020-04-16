SELECT JOB_TITLE
FROM JOBS;

-- ���̺��� ���� �����ؼ� ��ȸ�ϱ�
-- ������̵�, �����, �������̵�, �޿� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES;

-- �������̵�, ������ �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM JOBS;

-- �������̵�, ���ø�, �ּ� ��ȸ�ϱ�
SELECT LOCATION_ID, CITY, STREET_ADDRESS
FROM LOCATIONS;

-- ������̵�, �����, �Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES;

-- �����ڸ� �̿��ϱ�, ��Ī ����ϱ�
-- ������̵�, ����, �޿�, ������ ��ȸ�ϰ� ������ ��Ī �ο��ϱ�
SELECT EMPLOYEE_ID AS ID, JOB_ID AS JOB, SALARY, SALARY*4*12 AS ANN_SAL
FROM EMPLOYEES;

-- ������̵�, ����, �޿�, �ñ��� ��ȸ�ϰ� ������ ��Ī �ο��ϱ�, �ñ��� �޿�/(5*24) �̴�.
SELECT EMPLOYEE_ID ID, JOB_ID JOB, SALARY SAL, SALARY/(5*24) TIME_SAL
FROM EMPLOYEES;

-- ���� �����ؼ� ��ȸ�ϱ�
-- 60�� �μ����� �ٹ��ϴ� ����� ���̵�, �̸�, ����, �μ����̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, DEPARTMENT_ID DEPT
FROM EMPLOYEES
WHERE (DEPARTMENT_ID=60);

-- �޿��� 5000�޷� ���Ϸ� �޴� ������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, SALARY
FROM EMPLOYEES
WHERE SALARY<=5000;

-- 100�� �������� �����ϴ� ������ ���̵�, �̸� ��ȸ�ϱ�
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME
FROM EMPLOYEES
WHERE MANAGER_ID=100;

-- 100�� ������ �μ�����ڷ� ������ �μ��� ���̵�, �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID=100;

-- ���� �ִ� �޿��� 15000�޷� �̻� �Ǵ� ������ ���̵�, ��������, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY>=15000;

-- �ñ��� 100�޷� �̻� �޴� ������ ���̵�, �̸�, ����, �޿�, �ñ��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, SALARY, SALARY/(5*8) AS "SALARY/H"
FROM EMPLOYEES
WHERE SALARY/(5*8)>100;

-- �̸��� Neena�� ����� �������̵�, �̸�, �̸���, ��ȭ��ȣ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER
FROM EMPLOYEES
WHERE FIRST_NAME = 'Neena';

-- Ŀ�̼��� null�� ������ �������̵�, �̸�, �ҼӺμ����̵� Ȯ���ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- Ŀ�̼��� null�� �ƴ� ������ �������̵�, �̸�, �������̵�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- �ҼӺμ��� �������� ���� ������ ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- �μ�����ڰ� �������� ���� �μ��� ���̵�, �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- �μ�����ڰ� ������ �μ��� �μ����̵�, �μ���, ����� �������̵� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

-- between a and b ����ϱ�
-- �޿��� 2000�̻� 3000���Ϸ� �޴� ����� ���̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 3000;

-- In(��1, ��2, ��3...) ����ϱ�
-- 10�� �μ��� 20�� �μ��� �Ҽӵ� ����� ���̵�, �̸�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20);

-- 50, 60, 70, 80�� �μ��� �Ҽӵ��� ���� ����� ���̵�, �̸�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (50, 60, 70, 80);

-- �������̵� JP, US�� ������ ��ġ���̵�, �ּ�, �������̵� ��ȸ�ϱ�
SELECT LOCATION_ID, STREET_ADDRESS, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN ('JP', 'US');

-- ������ �������̵� AD_PRES�̰ų� AD_VP�� ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN('AD_PRES', 'AD_VP');

-- 50�� Ȥ�� 60�� �μ��� �ٹ��� ���� �ִ� ����� ���̵�, �ٹ�������, �ٹ��������� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, START_DATE, END_DATE
FROM JOB_HISTORY
WHERE DEPARTMENT_ID IN (50, 60);

-- 101���̳� 102�� ������ ���� ������ ����� ���̵�, �̸�, �Ŵ������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN(101,102);

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_________%' AND FIRST_NAME LIKE '%er';

-- �������̵� **_MAN�� ������ ���̵�, �̸�, �������̵�, �޿� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

-- �̸��� 'A'�� �����ϰ� �̸��� �� ������ ������ �̸��� ���� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A___';

-- �̸��� 'e'�� ���Ե� ������ �̸��� ���� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'E%' 
OR FIRST_NAME LIKE '%e%';

-- �� �����ڸ� ����ؼ� 2�� �̻��� ������ �����ϴ� ���� ��ȸ�ϱ�
-- 80�� �μ����� ���ϴ� ���� �� �޿��� 3000�޷� �̸��� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=80 
AND SALARY<3000;

-- 50�� �μ����� ���ϴ� ���� �� ������ �Ŵ����� ������ �������̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50 
AND JOB_ID LIKE '%MAN';

-- 50�� �μ����� ���ϰ� �޿��� 2500�� ���Ϸ� �ް�, �ڽ��� �Ŵ����� ���̵� 121���� ������ ���̵�, �̸�, �Ի���, �޿�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50 
AND SALARY<=2500 
AND MANAGER_ID=121;

-- 50���̳� 60�� �μ��� �Ҽӵ� ���� �߿��� �̸��� 'A'�� �����ϴ� ������ ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50,60) 
AND FIRST_NAME LIKE 'A%';

-- Ŀ�̼��� �޴� ���� �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, ����, �Ի���, �޿�, ������ ��ȸ�ϱ�
-- ���� = �޿�*4*12 + �޿�*Ŀ�̼�*4*12
SELECT 
    EMPLOYEE_ID
    , FIRST_NAME
    , JOB_ID
    , HIRE_DATE, SALARY
    , (SALARY*(1+COMMISSION_PCT)*4*12) AS "ANN SAL"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
AND SALARY>=10000;

-- �����ϱ�
-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME ASC;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
-- �̸������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME DESC;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ� (ASC�� ��������)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY SALARY*48;         -- ������� ����ؼ� ����

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY 4 ASC;            -- �÷��� ������ ����ؼ� �����ϱ�(select���� 4��° �÷� : salary*48, db������ �÷������� �ƴ�)

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY ANNUAL_SALARY ASC;    -- �÷��� ��Ī�� ����ؼ� �����ϱ�(���� ��� / ��õ ���)

-- 50�� �μ��� �Ҽӵ� ���� �߿��� ������ 250000�޷� �̻���
-- �������� ���̵�, �̸�, �޿�, ����, �Ի����� ��ȸ�ϱ�
-- ���������� �������� �����ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 4 * 12 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND SALARY * 4 * 12 >= 250000
ORDER BY ANNUAL_SALARY ASC;

-- ���� ����
-- SELECT������ ������ ��Ī�� WHERE������ ����� �� ����.
-- SELECT������ ������ ��Ī�� ORDER BY�������� ����� �� �ִ�.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 4 * 12 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND ANNUAL_SALARY >= 250000
ORDER BY ANNUAL_SALARY ASC;

-- 50�� �μ����� �ٹ��ϴ� �������� �̸�, �޿��� ��ȸ�ϰ�
-- �޿������� �������� �����ϰ�, ���� �޿��� �����ϸ� �̸������� �������� �����ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY DESC, FIRST_NAME ASC;

-- ������ �Լ� �� �����Լ� ����ϱ�
-- ����� ���̵�, �̸��� ��ȸ�ϱ�(�̸��� �빮�ڷ� ǥ��)
SELECT EMPLOYEE_ID
, UPPER(FIRST_NAME)
, LOWER(FIRST_NAME)
, LENGTH(FIRST_NAME)
, CONCAT(FIRST_NAME, LAST_NAME)
, LPAD(FIRST_NAME, 10, '#')
, RPAD(FIRST_NAME, 10, '@')
FROM EMPLOYEES;