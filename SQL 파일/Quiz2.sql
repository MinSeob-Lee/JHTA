-- 1.  �ý����� ���� ��¥�� �ð� ��ȸ�ϱ� (dual ���)
SELECT SYSDATE
FROM DUAL;
-- 2.  �޿��� 5000�޷� �̻�ް�, 2005�⿡ �Ի��� ������ ���̵�, �̸�, �޿�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2005'
AND SALARY >= 5000;
-- 3.  �̸��� e�� E�� ���Ե� ���� �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000
AND FIRST_NAME LIKE '%E%'
OR FIRST_NAME LIKE '%e%';
-- 4.  �Ի�⵵�� ������� 4���� �Ի��� �������� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MM') = '04'
-- 5.  2006�� ��ݱ�(1/1 ~ 6/30)�� �Ի��� �������� ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01'
AND HIRE_DATE <= '2006/06/30'
ORDER BY HIRE_DATE ASC;
-- 6.  50�� �μ��� �Ҽӵ� �������� �޿��� 13%�λ��Ű���� �Ѵ�.
--     �������̵�, �̸�, ���� �޿�, �λ�� �޿��� ��ȸ�ϱ�
--     �λ�� �޿��� �Ҽ��� ���ϴ� ������.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, TRUNC(SALARY * 1.13) AS INCREASED_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;
-- 7.  50�� �μ��� �Ҽӵ� �������� �޿��� ��ȸ�Ϸ��� �Ѵ�.
--     ���� ���̵�, �̸�, �޿� �׸���, �޿� 1000�޷��� *�� �ϳ��� ǥ���϶�.
--     120 Matthew 8000 ********
--     122 Shanta  6500 ******
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, LPAD('*', TRUNC(SALARY / 1000), '*')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;
-- 8.  �����ڰ� �����Ǿ� ���� �ʴ� �μ��� 
--     �μ����̵�, �μ���, ��ġ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.LOCATION_ID, B.CITY, B.STREET_ADDRESS
FROM DEPARTMENTS A, LOCATIONS B
WHERE A.MANAGER_ID IS NULL
AND A.LOCATION_ID = B.LOCATION_ID
ORDER BY DEPARTMENT_ID ASC;
-- 9.  90�� �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;
-- 10. 100�� ������ �μ������ڷ� ������ �μ��� �Ҽӵ� ������ �������̵�, �̸�, ����, �޿��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID, A.SALARY
FROM EMPLOYEES A, DEPARTMENTS B
WHERE B.MANAGER_ID = 100
and A.DEPARTMENT_ID = B.DEPARTMENT_ID;
-- 11. 10, 20, 30�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.DEPARTMENT_ID IN (10, 20, 30)
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY EMPLOYEE_ID ASC;
-- 12. �������� ���������� �������� �� �ڽ��� �����ϰ� �ִ� ������ �����޿��� �ް� �ִ�
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���������޿��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.JOB_ID, B.MIN_SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID
AND A.SALARY = B.MIN_SALARY;
-- 13. Ŀ�̼��� �޴� �������� �������̵�, �̸�, Ŀ�̼�, �޿�, �������̵�, ��������, �޿�, �ҼӺμ� ���̵�, �μ����� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.COMMISSION_PCT, A.SALARY, B.JOB_ID, B.JOB_TITLE, C.DEPARTMENT_ID, C.DEPARTMENT_NAME
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C
WHERE A.COMMISSION_PCT IS NOT NULL
AND A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID
ORDER BY A.EMPLOYEE_ID ASC;
-- 14. 'Canada'���� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �ҼӺμ� ���̵�, �ҼӺμ���, ��ġ ���̵�, ���ø�, �ּҸ� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME, C.LOCATION_ID, C.CITY, C.STREET_ADDRESS
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C, COUNTRIES D
WHERE D.COUNTRY_NAME = 'Canada'
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
AND C.COUNTRY_ID = D.COUNTRY_ID
ORDER BY A.EMPLOYEE_ID ASC;
-- 15. ��� ������ �������̵�, �̸�, �������̵�, ��������, �޿�, �޿����, �ҼӺμ� ���̵�, �ҼӺμ���, ���ø��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.JOB_ID, B.JOB_TITLE, A.SALARY, D.GRA, C.DEPARTMENT_ID, C.DEPARTMENT_NAME, E.CITY
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C, JOB_GRADES D, LOCATIONS E
WHERE A.DEPARTMENT_ID = C.DEPARTMENT_ID
AND A.JOB_ID = B.JOB_ID
AND C.LOCATION_ID = E.LOCATION_ID
AND A.SALARY >= D.LOWEST_SAL
AND A.SALARY <= D.HIGHEST_SAL
ORDER BY A.EMPLOYEE_ID ASC;
-- 16. �޿��� 5000�޷� ���Ϸ� �޴� �������� ���̵�, �̸�, ����, �ҼӺμ� ���̵�, �ҼӺμ���, �ҼӺμ� ������ �������̵�, 
--     �ҼӺμ� ������ �����̸��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID, B.DEPARTMENT_ID, B.DEPARTMENT_NAME, B.MANAGER_ID
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.SALARY <= 5000
AND A.EMPLOYEE_ID = B.MANAGER_ID
ORDER BY A.EMPLOYEE_ID ASC;
-- 17. 'Asia'������ �������� �ΰ� �ִ� �μ��� ���̵�, �μ���, �μ������� �̸��� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID
FROM DEPARTMENTS A, LOCATIONS B, COUNTRIES C, REGIONS D
WHERE D.REGION_NAME = 'Asia'
AND A.LOCATION_ID = B.LOCATION_ID
AND B.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = D.REGION_ID;
-- 18. 101�� ������ �ٹ��ߴ� �μ����� �ٹ����� ������ ���̵�, �̸�, �μ����̵�, �μ����� ��ȸ�ϱ�
SELECT DISTINCT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B, JOB_HISTORY C
WHERE C.EMPLOYEE_ID = 101
AND B.DEPARTMENT_ID = C.DEPARTMENT_ID
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;
-- 19. �����߿��� �ڽ��� �����ϰ� �ִ� ������ �ְ�޿� 50%�̻��� �޿��� �ް� �ִ� 
--     ������ ���̵�, �̸�, �޿�, �������̵�, ���� �ְ�޿��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.JOB_ID, B.MAX_SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.SALARY >= B.MAX_SALARY / 2
AND A.JOB_ID = B.JOB_ID;
-- 20. �̱�(US)�� ��ġ�ϰ� �ִ� �μ��� ���̵�, �̸�, ��ġ��ȣ, ���ø�, �ּҸ� ��ȸ�ϱ� 
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.LOCATION_ID, B.CITY, B.STREET_ADDRESS
FROM DEPARTMENTS A, LOCATIONS B
WHERE B.COUNTRY_ID = 'US'
AND A.LOCATION_ID = B.LOCATION_ID
ORDER BY A.DEPARTMENT_ID ASC;