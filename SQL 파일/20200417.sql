SELECT FIRST_NAME || LAST_NAME
FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES;

SELECT SUBSTR('940625', 3, 2)
FROM EMPLOYEES;

SELECT *
FROM DUAL;

SELECT INSTR('010-4899-0653', '-')
FROM DUAL;

SELECT STREET_ADDRESS, SUBSTR(STREET_ADDRESS, 1, INSTR(STREET_ADDRESS, ' ')-1)
FROM LOCATIONS;

SELECT REPLACE(FIRST_NAME, 'a', 'A')
FROM EMPLOYEES;

-- �����Լ�
-- �ݿø��ϱ�
SELECT
ROUND(1265.737, 2) "2",     -- �Ҽ��� 2�ڸ��� �ݿø�
ROUND(1265.737, 1) "1",     -- �Ҽ��� 1�ڸ��� �ݿø�
ROUND(1265.737, 0) "0",     -- ���� �ڸ��� �ݿø�
ROUND(1265.737) " ",        -- ���� �ڸ��� �ݿø�
ROUND(1265.737, -1) "-1",   -- ���� �ڸ��� �ݿø�
ROUND(1265.737, -2) "-2"    -- ���� �ڸ��� �ݿø�
FROM DUAL;

-- ���ڰ� ������
SELECT
TRUNC(1265.737, 2) "2",     -- �Ҽ��� 2�ڸ������� ����� ������
TRUNC(1265.737, 1) "1",     -- �Ҽ��� 1�ڸ������� ����� ������
TRUNC(1265.737, 0) "0",     -- ���� �ڸ������� ����� ������
TRUNC(1265.737) " ",        -- ���� �ڸ������� ����� ������
TRUNC(1265.737, -1) "-1",   -- ���� �ڸ������� ����� ������
TRUNC(1265.737, -2) "-2"    -- ���� �ڸ������� ����� ������
FROM DUAL;

-- �������� �ñ��� ��ȸ�ϱ�
-- �������̵�, �̸�, �������̵�, �޿�, �ñ�
-- �ñ� = �޿� * ȯ�� / (5 * 8) �ñ��� ������������ ǥ���Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, TRUNC(SALARY * 1220.40 / (5 * 8)) AS PAY_FOR_HOUR
FROM EMPLOYEES
ORDER BY PAY_FOR_HOUR DESC;

-- �������� ���ϱ�
SELECT MOD(32, 5)
FROM DUAL;

-- ��¥ �Լ�
-- ���� ��¥�� �ð����� ��ȣ�ϱ�
SELECT SYSDATE
FROM DUAL;

-- �������̵�, ������, �Ի���, ���ñ��� �ٹ��� ��¥ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE - HIRE_DATE)
FROM EMPLOYEES;

-- ����, 3����, 1������, 1������, 3������
SELECT SYSDATE "����", SYSDATE - 3 "3�� ��", SYSDATE - 7 "1���� ��", SYSDATE - 30 "1�� ��"
FROM DUAL;

-- 60�� �μ��� �Ҽӵ� ������� ���̵�, �̸�, �Ի���, �ٹ��� �������� ��ȸ�ϱ�
-- �������� �Ҽ����κ��� ������.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- ���ú��� 3���� ���� ��¥, 3���� ������ ��¥��?
SELECT ADD_MONTHS(SYSDATE, 3), ADD_MONTHS(SYSDATE, -3)
FROM DUAL;

-- ��¥ �ݿø��ϱ�, ������
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- �� ��¥���� �� �� ����ϱ�
-- ���� ��¥�� ���� TRUNC() �Լ��� �ú��ʸ� ���� 0���� ���� �� ��¥ ����
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SYSDATE - HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE
FROM EMPLOYEES;

-- �̹� ���� ������ �� ��ȸ�ϱ�
SELECT LAST_DAY(TRUNC(SYSDATE))
FROM DUAL;

-- ������ �������� ���� �� �����
SELECT NEXT_DAY(TRUNC(SYSDATE), 7)
FROM DUAL;

-- ������ �������� ���� �� �ݿ���
SELECT NEXT_DAY(TRUNC(SYSDATE), 6)
FROM DUAL;

-- ������ �������� ���� �� �Ͽ���
SELECT NEXT_DAY(TRUNC(SYSDATE), 1)
FROM DUAL;

-- ��ȯ �Լ�
-- ��¥�� ���ڷ� ��ȯ�ϱ�
SELECT TO_CHAR(SYSDATE, 'YYYY') ��
, TO_CHAR(SYSDATE, 'MM') ��
, TO_CHAR(SYSDATE, 'DD') ��
, TO_CHAR(SYSDATE, 'DAY') ����
, TO_CHAR(SYSDATE, 'AM') "����/����"
, TO_CHAR(SYSDATE, 'HH') �ð�
, TO_CHAR(SYSDATE, 'HH24') �ð�
, TO_CHAR(SYSDATE, 'MI') ��
, TO_CHAR(SYSDATE, 'SS') ��
FROM DUAL;

-- 2003�⵵�� �Ի��� ����� ���̵�, �̸�, �Ի��� ���� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, TO_CHAR(HIRE_DATE, 'MM')
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003';

-- �Ի����� ���� ��¥�� ���� ��¥�� �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MMDD') = TO_CHAR(SYSDATE, 'MMDD');

-- Ư�� ��¥�� ��Ÿ���� ���ڸ� ��¥(DATE Ÿ��)�� ��ȯ�ϱ�
SELECT TO_DATE('2018-12-31', 'YYYY-MM-DD') + 1000
FROM DUAL;

-- Ư�� ��¥�� ��Ÿ���� ���ڸ� ��¥�� ��ȯ�ؼ� ���ñ����� �ϼ�, �������� ��ȸ�ϱ�
SELECT TRUNC(SYSDATE - TO_DATE('2016-04-17', 'YYYY-MM-DD')),
MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('1994-06-25', 'YYYY-MM-DD'))
FROM DUAL;

-- 2005-01-01 ~ 2005-03-31 ���̿� �Ի��� ����� ���̵�, �̸�, �Ի���, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND HIRE_DATE <= TO_DATE('2005-03-31', 'YYYY-MM-DD')
ORDER BY HIRE_DATE;

-- 2003�⿡ �Ի��� ������ ���̵�, �̸�, �Ի��� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('20030101', 'YYYYMMDD')
AND HIRE_DATE <= TO_DATE('20040101', 'YYYYMMDD')
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '20030101'
AND HIRE_DATE <= '20040101'
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2003/01/01'
AND HIRE_DATE <= '2004/01/01'
ORDER BY HIRE_DATE;

-- ���ڸ� õ�������� �����ڰ� ���Ե� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
SELECT TO_CHAR(10000, '999,999')
FROM DUAL;

-- ���ڸ� �Ҽ��� 2�ڸ����� �ݿø��� �� �ؽ�Ʈ�� ��ȯ�ؼ� ��ȸ�ϱ�
SELECT TO_CHAR(123.4567, '000.00')
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ�ؼ� ����ϱ�
-- �޿��� 15000�޷� �̻��� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= '15000';

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= TO_NUMBER('15000');

-- TO_NUMBER() �Լ��� �ݵ�� ����ؾ� �ϴ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= TO_NUMBER('15,000', '99,999');

-- NVL() �Լ�
SELECT NVL(10, 1)   -- 10�� �������̴�.
    , NVL(NULL, 1)  -- 1�� �������̴�.
FROM DUAL;

-- �������̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
-- Ŀ�̼ǰ��� NULL�� ��� 0���� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- �������̵�, �̸�, �Ǳ޿��� ��ȸ�ϱ�
-- �Ǳ޿� = �޿� + �޿� * Ŀ�̼��̴�.
SELECT EMPLOYEE_ID, FIRST_NAME
, SALARY + SALARY * COMMISSION_PCT SAL1
, SALARY + SALARY * NVL(COMMISSION_PCT, 0) SAL2
FROM EMPLOYEES;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� NULL�� ��� '������ ������ ����'���� ��ȸ�ϱ�
SELECT DEPARTMENT_ID
, DEPARTMENT_NAME
, NVL(TO_CHAR(MANAGER_ID), '������ ������ ����')
FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID;

-- �μ����̵�, �μ���, �ش�μ� ������ ���̵� ��ȸ�ϱ�
-- ������ ���̵� NULL�� ��� 100������ �����ڷ� �����Ѵ�.
SELECT DEPARTMENT_ID
, DEPARTMENT_NAME
, NVL(MANAGER_ID, 100)
FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID;

-- NVL2() �Լ� ����ϱ�
SELECT NVL2(10, 1, 0)       -- �������� 1�̴�.
,NVL2(NULL, 1, 0)           -- �������� 0�̴�.
FROM DUAL;

-- �������̵�, �̸�, Ŀ�̼� ���ɿ��θ� 'YES', 'NO'�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, NVL2(COMMISSION_PCT, 'YES', 'NO') ���ɿ���
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~ WHEN
-- �������̵�, �̸�, �޿�, �޿���� ��ȸ�ϱ�
-- �޿������
-- 20000�޷� �̻�   A���
-- 10000�޷� �̻�   B���
-- 5000�޷� �̻�    C���
-- �� �� 
SELECT
EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
WHEN SALARY >= 20000 THEN 'A'
WHEN SALARY >= 10000 THEN 'B'
WHEN SALARY >= 5000 THEN 'C'
ELSE 'D'
END SALARY_GRADE
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~ WHEN
-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �޿������
-- 20000�޷� �̻�   10%�λ�
-- 10000�޷� �̻�   15%�λ�
-- 5000�޷� �̻�    20%�λ�
-- �׿�            25% �λ�
SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
WHEN SALARY >= 20000 THEN SALARY * 1.1
WHEN SALARY >= 10000 THEN SALARY * 1.15
WHEN SALARY >= 5000 THEN SALARY * 1.2
ELSE SALARY * 1.25
END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- �������̵�, �̸�, �޿�, �λ�� �޿��� ��ȸ�ϱ�
-- �λ����
-- �ҼӺμ��� 50�� �μ��� 10% �λ�
-- �ҼӺμ��� 80�� �μ��� 15% �λ�
-- �� �� �μ��� 5% �λ�
SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
    WHEN DEPARTMENT_ID = 50 THEN SALARY * 1.1
    WHEN DEPARTMENT_ID = 80 THEN SALARY * 1.15
    ELSE SALARY * 1.05
    END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE DEPARTMENT_ID
    WHEN 50 THEN SALARY * 1.1
    WHEN 80 THEN SALARY * 1.15
    ELSE SALARY * 1.05
    END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID
    , FIRST_NAME
    , SALARY
    , DECODE(DEPARTMENT_ID, 50, SALARY * 1.1,
                            80, SALARY * 1.15,
                            SALARY * 1.05) INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- DECODE() �Լ��� ����ؼ� ��ȸ�ϱ�
-- �������̵�, �̸�, �޿�, �λ�� �޿� ��ȸ�ϱ�
-- �޿������
-- 20000�޷� �̻�   A
-- 10000�޷� �̻�   B
-- 5000�޷� �̻�    C
-- �׿�             D
SELECT EMPLOYEE_ID
    , FIRST_NAME
    , SALARY
    , DECODE(TRUNC(SALARY, -4), 20000, 'A'
                              , 10000, 'B'
                              , DECODE(TRUNC(SALARY/5000) * 5000, 5000, 'C'
                                                                , 'D')) SALARY_GRADE
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;