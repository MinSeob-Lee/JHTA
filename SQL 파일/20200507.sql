-- ���߿� �������� ����ϱ�
-- 'Karen'�� ���� ������ �����ϰ�, ���� �μ��� �ҼӵǾ� �ִ� ����� ���̵�, �̸�, ����, �μ����̵� ��ȸ�ϱ�
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Karen';

SELECT *
FROM EMPLOYEES
WHERE (JOB_ID, DEPARTMENT_ID) IN (SELECT JOB_ID, DEPARTMENT_ID
                                  FROM EMPLOYEES
                                  WHERE FIRST_NAME = 'Karen');

-- �μ��� �ְ� �޿��� �޴� ����� ���̵�, �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                  FROM EMPLOYEES
                                  WHERE DEPARTMENT_ID IS NOT NULL
                                  GROUP BY DEPARTMENT_ID)
ORDER BY EMPLOYEE_ID;

-- ��Į�� �������� ����ϱ�
-- ��ü ��պ��� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿�, ��ձ޿�, ��ձ޿����� ���̸� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       TRUNC((SELECT AVG(SALARY) FROM EMPLOYEES) - SALARY) AS SALARY_GAP
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES)
ORDER BY SALARY_GAP;

-- �μ����̵�, �μ���, �ش� �μ��� ������� ��ȸ�ϱ�
SELECT OUTTER.DEPARTMENT_ID, OUTTER.DEPARTMENT_NAME,
       (SELECT COUNT(*)
        FROM EMPLOYEES INNER
        WHERE INNER.DEPARTMENT_ID = OUTTER.DEPARTMENT_ID) CNT
FROM DEPARTMENTS OUTTER;

-- 20000�޷� �̻��� ��ü ��ձ޿��� 10%�� ���ʽ���, 10000�޷� �̻��� 15%, �� �ܴ� 20% ���ʽ��� �����Ϸ��� �Ѵ�.
-- ���̵�, �̸�, �޿�, ���ʽ� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
CASE
    WHEN SALARY >= 20000 THEN TRUNC((SELECT AVG(SALARY) FROM EMPLOYEES) * 0.1)
    WHEN SALARY >= 10000 THEN TRUNC((SELECT AVG(SALARY) FROM EMPLOYEES) * 0.15)
    ELSE TRUNC((SELECT AVG(SALARY) FROM EMPLOYEES) * 0.2)
    END BONUS
    FROM EMPLOYEES;
    
    -- ��ü ��ձ޿����� �޿��� ���� �޴� ����� �̸�, �޿��� ��ȸ�ϱ�
    SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES
    WHERE SALARY > (SELECT AVG(SALARY)
                    FROM EMPLOYEES);
                    
-- �ڽ��� �Ҽӵ� �ҼӺμ��� ��ձ޿����� ���� �޿��� �޴� ����� �̸�, �޿��� ��ȸ�ϱ�
SELECT OUTTER.FIRST_NAME, OUTTER.SALARY
FROM EMPLOYEES OUTTER
WHERE OUTTER.SALARY > (SELECT AVG(INNER.SALARY)
                       FROM EMPLOYEES INNER
                       WHERE INNER.DEPARTMENT_ID = OUTTER.DEPARTMENT_ID);
-- �ܺ� SQL���� ����Ǿ ���� �����´�.(�ĺ���)
-- �ĺ����� �ึ�� DEPARTMENT_ID���� �����ͼ� ���������� �����Ѵ�.
-- ���������� ������� ����ؼ� �ĺ����� �����Ѵ�.
-- �ĺ����� ���� ���� ������ �ݺ��Ѵ�.

SELECT TO_DATE('20200101', 'YYYYMMDD') + LEVEL - 1
FROM DUAL
CONNECT BY LEVEL <= 31;

-- EXISTS ������ ����ϱ�
-- ���������� ������ �ִ� ������ ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES ���
WHERE (SELECT COUNT(*)
       FROM EMPLOYEES ����
       WHERE ����.MANAGER_ID = ���.EMPLOYEE_ID) > 0; -- COUNT() ��� ����õ
       
SELECT *
FROM EMPLOYEES ���
WHERE EXISTS (SELECT 1
              FROM EMPLOYEES ����
              WHERE ����.MANAGER_ID = ���.EMPLOYEE_ID); -- EXISTS ��� ��õ
              
-- WITH ��
WITH DEPT_COSTS AS  -- �μ��̸�, �μ��ѱ޿�
(SELECT B.DEPARTMENT_NAME, SUM(A.SALARY) AS DEPT_TOTAL
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_NAME),
AVG_COST AS  -- �μ��� �� �޿��� ���� ��ձ޿�
(SELECT SUM(DEPT_TOTAL)/COUNT(*) AS DEPT_AVG
FROM DEPT_COST)
SELECT *
FROM DEPT_COSTS
WHERE DEPT_TOTAL > (SELECT DEPT_AVG    -- �μ��ѱ޿��� ��ձ޿�
                    FROM AVG_COST)
ORDER BY DEPARTMENT_NAME;

-- 118�� ����� ��縦 ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 118
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;

-- 101�� ������ ��� ���� ��ȸ�ϱ�
SELECT LPAD(EMPLOYEE_ID, LEVEL * 4, ' '), FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 101
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- 100(����)�� ��� �������� ��ȸ
SELECT LPAD(FIRST_NAME, LENGTH(FIRST_NAME) + LEVEL * 4 - 4, ' ')
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- 100�� ��� �������� ��ȸ, Neena�� ����(Neena�� ���ϵ� ����)
SELECT LPAD(FIRST_NAME, LENGTH(FIRST_NAME) + LEVEL * 5 - 5, ' ')
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID AND FIRST_NAME != 'Neena';

-- 100�� �������� ��ȸ�ϱ�
SELECT LPAD(FIRST_NAME, LENGTH(FIRST_NAME) + LEVEL * 5 - 5, ' ')
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 100
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID AND LEVEL <= 2;

-- 2020/01/01 ~ 2020/12/31 ��¥ �����
SELECT TO_DATE('2020/01/01', 'YYYY/MM/DD') + LEVEL - 1
FROM DUAL
CONNECT BY LEVEL <= 366;

-- 2005�⵵ ���� �Ի��ڼ� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM'), COUNT(*)
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY-MM')
ORDER BY 1;

WITH MONTHS AS
(SELECT '2003-' ||
    CASE
        WHEN LEVEL < 10 THEN '0' || LEVEL
        ELSE TO_CHAR(LEVEL)
    END MON
FROM DUAL
CONNECT BY LEVEL <= 12),
MONTH_EMP_COUNT AS
(SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM') MON, COUNT(*) CNT
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY-MM'))
SELECT A.MON, NVL(B.CNT, 0) CNT
FROM MONTHS A, MONTH_EMP_COUNT B
WHERE A.MON = B.MON(+)
ORDER BY A.MON ASC;