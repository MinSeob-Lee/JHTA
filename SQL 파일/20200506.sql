--1. �޿��� 5000�̻� 12000������ ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000;

--2. ������� �Ҽӵ� �μ��� �μ����� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

--3. 2007�⿡ �Ի��� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

--4. �޿��� 5000�̻� 12000�����̰�, 20���� 50�� �μ��� �Ҽӵ� ����� ���̵�, �̸�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.SALARY >= 5000
AND A.SALARY <= 12000
AND A.DEPARTMENT_ID IN (20,50)
ORDER BY EMPLOYEE_ID ASC;

--5. 100�� �������� �����ϴ� ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.MANAGER_ID = 100
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY A.EMPLOYEE_ID ASC;

--6. 80�� �μ��� �ҼӵǾ� �ְ�, 80�� �μ��� ��ձ޿����� ���� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY < (SELECT TRUNC(AVG(SALARY))
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 80);
              
--7. 50�� �μ��� �Ҽӵ� ��� �߿��� �ش� ������ �ּұ޿����� 2�� �̻��� �޿��� �޴� ����� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = 50
AND A.SALARY >= B.MIN_SALARY * 2;

--8. ����� �߿��� �ڽ��� ��纸�� ���� �Ի��� ����� ���̵�, �̸�, �Ի���, ����� �̸�, ����� �Ի����� ��ȸ�ϱ�
SELECT A1.EMPLOYEE_ID, A1.FIRST_NAME, A1.HIRE_DATE, A2.FIRST_NAME, A2.HIRE_DATE
FROM EMPLOYEES A1, EMPLOYEES A2
WHERE A2.EMPLOYEE_ID = A1.MANAGER_ID
AND A1.HIRE_DATE < A2.HIRE_DATE;

--9. Steven King�� ���� �μ����� �ٹ��ϴ� ����� ���̵�� �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE FIRST_NAME = 'Steven' AND LAST_NAME = 'King');
                       
--10. �����ں� ������� ��ȸ�ϱ�, ������ ���̵�, ������� ����Ѵ�. ������ ���̵� ������ �������� ����
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY MANAGER_ID
ORDER BY 1;

--11. Ŀ�̼��� �޴� ����� ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES A
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY EMPLOYEE_ID ASC;

--12. �޿��� ���� ���� �޴� ��� 3���� ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT ROWNUM EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

--13. 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϴ� ����� ���̵�, �̸�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE FIRST_NAME = 'Ismael')
AND DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Ismael');
                     
--14. 'Renske'���� ����޴� ����� ���̵�� �̸�, �޿�, �޿� ����� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.SALARY >= B.LOWEST_SAL AND A.SALARY <= B.HIGHEST_SAL
AND A.EMPLOYEE_ID = (SELECT MANAGER_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Renske');
                     
--15.������̺��� �޿��� �������� �޿������ ��ȸ���� ��, �޿���޺� ������� ��ȸ�ϱ�
SELECT Y.GRA, NVL(X.CNT, 9)
FROM(SELECT B.GRA, COUNT(*) CNT
     FROM EMPLOYEES A, JOB_GRADES B
     WHERE A.SALARY >= B.LOWEST_SAL AND A.SALARY <= B.HIGHEST_SAL
     GROUP BY B.GRA)X, JOB_GRADES Y
WHERE X.GRA(+) = Y.GRA
ORDER BY Y.GRA;

--16. �Ի��ڰ� ���� ���� �⵵�� �� �ؿ� �Ի��� ������� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                   FROM EMPLOYEES
                   GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'));
                   
WITH YEAR_COUNT
AS (SELECT TO_CHAR(HIRE_DATE, 'YYYY') YEAR, COUNT(*) CNT
    FROM EMPLOYEES
    GROUP BY TO_CHAR(HIRE_DATE, 'YYYY'))
SELECT YEAR, CNT
FROM YEAR_COUNT
WHERE CNT = (SELECT MIN(CNT)
             FROM YEAR_COUNT);
             
--17. �����ں� ������� ��ȸ���� �� �������ϴ� ������� 10���� �Ѵ� �������� ���̵�� ������� ��ȸ�ϱ�
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING COUNT(*) > 10;

--18. 'Europe'�������� �ٹ����� ����� ���̵�, �̸�, �ҼӺμ���, ������ ���ø�, �����̸��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME, D.CITY, C.COUNTRY_NAME
FROM EMPLOYEES A, DEPARTMENTS B, COUNTRIES C, LOCATIONS D, REGIONS E
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = D.LOCATION_ID
AND D.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = E.REGION_ID
AND E.REGION_NAME = 'Europe';

--19. ��ü ����� ������̵�, �̸�, �޿�, �ҼӺμ����̵�, �ҼӺμ���, ����� �̸��� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, A.DEPARTMENT_ID, B.DEPARTMENT_NAME, A2.FIRST_NAME MANAGER_NAME
FROM EMPLOYEES A, EMPLOYEES A2, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A2.EMPLOYEE_ID = B.MANAGER_ID
ORDER BY EMPLOYEE_ID ASC;

--20. 50�� �μ��� �ٹ����� ������� �޿��� 500�޷� �λ��Ű��
UPDATE EMPLOYEES
SET
SALARY = SALARY + 500
WHERE DEPARTMENT_ID = 50;

--21. ����� ���̵�, �̸�, �޿�, ���ʽ��� ��ȸ�ϱ�,
--    ���ʽ��� 20000�޷� �̻��� �޿��� 10%, 10000�޷� �̻��� �޿��� 15%, �� �ܴ� �޿��� 20%�� �����Ѵ�.
SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
    WHEN SALARY >= 20000 THEN TRUNC(SALARY * 0.1)
    WHEN SALARY >= 10000 THEN TRUNC(SALARY * 0.15)
    ELSE TRUNC(SALARY * 0.2)
    END AS BONUS
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

--22. �ҼӺμ����� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸�, �Ի���, �ҼӺμ���, �޿��� ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.HIRE_DATE, B.DEPARTMENT_NAME, A.SALARY
FROM(SELECT DISTINCT �Ĺ�.FIRST_NAME, �Ĺ�.HIRE_DATE, �Ĺ�.SALARY, �Ĺ�.DEPARTMENT_ID
FROM EMPLOYEES �Ĺ�, EMPLOYEES ����
WHERE �Ĺ�.DEPARTMENT_ID = ����.DEPARTMENT_ID
AND �Ĺ�.SALARY > ����.SALARY
AND �Ĺ�.HIRE_DATE > ����.HIRE_DATE) A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

--23. �μ��� ��ձ޿��� ��ȸ���� �� �μ��� ��ձ޿��� 10000�޷� ������ �μ��� ���̵�, �μ���, ��ձ޿���
--    ��ȸ�ϱ� (��ձ޿��� �Ҽ��� 1�ڸ������� ǥ��)
SELECT A.DEPARTMENT_ID, B.DEPARTMENT_NAME, TRUNC(AVG(SALARY)) DEPT_AVG_SALARY
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID, B.DEPARTMENT_NAME
HAVING AVG(A.SALARY) <= 10000
ORDER BY A.DEPARTMENT_ID;

--24. ����� �߿��� �ڽ� �����ϰ� �ִ� ������ �ִ�޿��� ������ �޿��� �޴� ����� ���̵�, �̸�, �޿���
--    ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.JOB_ID = C.JOB_ID
AND A.SALARY = C.MAX_SALARY;

----25. �м��Լ��� ����ؼ� ������� �޿������� �������� �����ϰ�, ������ �ο����� �� 6~10��° ���ϴ� ����,
--    ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT NUM, A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES) A, JOB_GRADES B
WHERE NUM >= 6 AND NUM <= 10
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY NUM DESC;

SELECT A.NUM, A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM(SELECT NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
     FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
     FROM EMPLOYEES)
     WHERE NUM >= 6 AND NUM <= 10) A, JOB_GRADES B
WHERE A.SALARY >= B.LOWEST_SAL AND A.SALARY <= B.HIGHEST_SAL;