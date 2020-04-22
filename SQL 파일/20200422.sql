-- ������ �׷��� ����
-- group by ���� ����ϸ� ���̺��� ������ ���� �׷����� �����
-- �׷�� �����͸� ������ �� �ִ�.
-- �ҼӺμ��� �������� ��ȸ�ϱ�. ��, �ҼӺμ��� �������� ���� ������ �����Ѵ�.
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- �����ں� �ڽ��� �����ϴ� �������� ��ȸ�ϱ�. ��, �����ڰ� �������� ���� ������ ����
-- �����ھ��̵�, �������� ��ȸ�Ѵ�.
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

-- �μ��� �������� ��ȸ�ϱ�. ��, �μ��� �������� ���� ����� ����
-- �μ��̸�, �������� ��ȸ�ϱ�
SELECT B.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.MANAGER_ID IS NOT NULL
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_NAME;

-- ���ú� �������� ��ȸ�ϱ�
-- ���ø�, ������
SELECT C.CITY, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
GROUP BY C.CITY;

-- ���ú�, �μ��� �������� ��ȸ�ϱ�
-- ���ø�, �μ���, �������� ��ȸ�Ѵ�.
SELECT C.CITY, B.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
GROUP BY C.CITY, B.DEPARTMENT_NAME
ORDER BY 1, 2;

-- �޿��� ������� ��ȸ�ϱ�
-- �޿��� ������� ��ȸ���� �� , �������� 10�� �̻��� �޿��� ����� ������ ��ȸ�ϱ�
SELECT TRUNC(SALARY, -3)SALARY, COUNT(*)
FROM EMPLOYEES
GROUP BY TRUNC(SALARY, -3)
HAVING COUNT(*) >= 10
ORDER BY SALARY;

-- having �� ����ؼ� �׷��� �����ϱ�
-- �޿��� ������� ��ȸ���� �� , �������� 10�� �̻��� �޿��� ����� ������ ��ȸ�ϱ�
SELECT TRUNC(SALARY, -3)SALARY, COUNT(*)
FROM EMPLOYEES
GROUP BY TRUNC(SALARY, -3)
HAVING COUNT(*) >= 10
ORDER BY SALARY;

-- �μ��� ��ձ޿� ��ȸ�ϱ�
-- �μ���� �μ��� ��ձ޿��� ��ȸ�Ѵ�. ��ձ޿��� �Ҽ������ϴ� ������.
-- ��ձ޿��� 5000�޷� �̸��� �μ��� ��ȸ�ϱ�
SELECT B.DEPARTMENT_NAME, TRUNC(AVG(SALARY)) AVG_SALARY
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_NAME
HAVING AVG(SALARY) < 5000
ORDER BY B.DEPARTMENT_NAME;

-- �׷��Լ��� ��ø
-- �μ����� �������� ��ȸ���� �� ���� ���� ������� ����ΰ�?
SELECT MAX(COUNT(*))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- �޿� ��޺� �����, �޿� ��޺� ��ձ޿��� ��ȸ�ϱ�
-- �޿� ��ް� �����, ��ձ޿��� ǥ���Ѵ�.
SELECT B.GRA, COUNT(*), TRUNC(AVG(SALARY))
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
GROUP BY B.GRA
ORDER BY 1;

-- ��������
-- �̸��� Neena�� ����� ���� �ؿ� �Ի��� ������� �̸�, �Ի����� ��ȸ�ϱ�
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE FIRST_NAME = 'Neena');

-- Stephen�� ���� ������ ���� �ϴ� �������� ���̵�� �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Stephen');

SELECT JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Stephen';

-- Mozhe�� ���� ������ ���� �ϰ�, 
-- Mozhe�� �޿����� �޿��� ���� �޴� ������ ���̵�� �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Mozhe')
AND SALARY > (SELECT SALARY
              FROM EMPLOYEES
              WHERE FIRST_NAME = 'Mozhe');

SELECT JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Mozhe';

SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Mozhe';

-- ��ü ������ ��ձ޿����� ���� �޿��� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT TRUNC(AVG(SALARY))
                FROM EMPLOYEES);

SELECT TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- ���� ���� �޿��� �޴� �������� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEES);
                
-- �μ��� ������� ��ȸ���� �� ������� ���� ���� �μ��� ���̵�� ������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID);
         
-- WITH ���� ����ؼ� �ߺ� ����Ǵ� �����۾��� �� ���� ����ǰ� �� �� �ִ�.
-- ������ ���༺���� ����Ų��.
WITH DEPTCNT
AS (SELECT DEPARTMENT_ID, COUNT(*) CNT
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID)   
SELECT DEPARTMENT_ID, CNT
FROM DEPTCNT
WHERE CNT = (SELECT MAX(CNT)
             FROM DEPTCNT);
             
-- ������ ��������
-- 50�� �μ��� �ٹ��ߴ� ���� �ִ� ����� ���̵�, �̸�, ����, �ҼӺμ����̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID
                     FROM JOB_HISTORY
                     WHERE DEPARTMENT_ID = 50);
-- ������ �������� ��� ������ Ȱ���ؼ� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID CURRENT_ID, A.DEPARTMENT_ID CURRENT_DEPT, B.JOB_ID OLD_ID, B.DEPARTMENT_ID OLD_DEPT
FROM EMPLOYEES A, JOB_HISTORY B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND B.DEPARTMENT_ID = 50;

-- Seattle�� ��ġ�ϰ� �ִ� �μ��� ������ �������̵�, �̸��� ��ȸ�ϱ�
-- 1.Seattle�� LOCATION_ID�� ��ȸ�ϱ�
-- 2. �� LOCATION_ID�� ������ �ִ� �μ��� MANAGER_ID�� ��ȸ�ϱ�
-- 3. �� MANAGER_ID�� �ش��ϴ� �������̵�, �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID
                      FROM DEPARTMENTS
                      WHERE LOCATION_ID = (SELECT LOCATION_ID
                                           FROM LOCATIONS
                                           WHERE CITY = 'Seattle'));
                                           
SELECT A.EMPLOYEE_ID, A.FIRST_NAME
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.EMPLOYEE_ID = B.MANAGER_ID
AND B.LOCATION_ID = C.LOCATION_ID
AND C.CITY = 'Seattle';