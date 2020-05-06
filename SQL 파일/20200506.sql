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
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND SALARY >= (SELECT MIN(SALARY)
               FROM EMPLOYEES
               WHERE DEPARTMENT_ID = 50) * 2
ORDER BY EMPLOYEE_ID ASC;

--8. ����� �߿��� �ڽ��� ��纸�� ���� �Ի��� ����� ���̵�, �̸�, �Ի���, ����� �̸�, ����� �Ի����� ��ȸ�ϱ�
SELECT A1.EMPLOYEE_ID, A1.FIRST_NAME, A1.HIRE_DATE, A2.FIRST_NAME, A2.HIRE_DATE
FROM EMPLOYEES A1, EMPLOYEES A2, DEPARTMENTS B
WHERE A1.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A2.EMPLOYEE_ID = B.MANAGER_ID
AND A1.HIRE_DATE < A2.HIRE_DATE;

--9. Steven King�� ���� �μ����� �ٹ��ϴ� ����� ���̵�� �̸��� ��ȸ�ϱ� ???
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM EMPLOYEES
                       WHERE FIRST_NAME = 'Steven');
                       
--10. �����ں� ������� ��ȸ�ϱ�, ������ ���̵�, ������� ����Ѵ�. ������ ���̵� ������ �������� ����
SELECT MANAGER_ID, COUNT(*) CNT
FROM EMPLOYEES
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID DESC;

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
SELECT A2.EMPLOYEE_ID, A2.FIRST_NAME, A2.SALARY, B.GRA
FROM EMPLOYEES A, EMPLOYEES A2, DEPARTMENTS B, JOB_GRADES B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A2.EMPLOYEE_ID = B.MANAGER_ID
AND A2.SALARY >= B.LOWEST_SAL
AND A2.SALARY <= B.HIGHEST_SAL
AND A.FIRST_NAME = 'Renske';

--15.������̺��� �޿��� �������� �޿������ ��ȸ���� ��, �޿���޺� ������� ��ȸ�ϱ�

--16. �Ի��ڰ� ���� ���� �⵵�� �� �ؿ� �Ի��� ������� ��ȸ�ϱ�

--17. �����ں� ������� ��ȸ���� �� �������ϴ� ������� 10���� �Ѵ� �������� ���̵�� ������� ��ȸ�ϱ�
SELECT TRUNC(MANAGER_ID, -3)MANAGER_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY TRUNC(MANAGER_ID, -3)
HAVING COUNT(*) >= 10
ORDER BY MANAGER_ID;

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
    WHEN SALARY >= 20000 THEN SALARY * 0.1
    WHEN SALARY >= 10000 THEN SALARY * 0.15
    ELSE SALARY * 0.2
    END AS BONUS
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

--22. �ҼӺμ����� �Ի����� ������, �� ���� �޿��� �޴� ����� �̸�, �Ի���, �ҼӺμ���, �޿��� ��ȸ�ϱ�

--23. �μ��� ��ձ޿��� ��ȸ���� �� �μ��� ��ձ޿��� 10000�޷� ������ �μ��� ���̵�, �μ���, ��ձ޿���
--    ��ȸ�ϱ� (��ձ޿��� �Ҽ��� 1�ڸ������� ǥ��)
SELECT A.DEPARTMENT_ID, C.DEPARTMENT_NAME, B.AVG_SALARY
FROM EMPLOYEES A, (SELECT DEPARTMENT_ID DEPTID, TRUNC(AVG(SALARY)) AVG_SALARY
                   FROM EMPLOYEES
                   WHERE DEPARTMENT_ID IS NOT NULL
                   GROUP BY DEPARTMENT_ID) B, DEPARTMENTS C
WHERE A.DEPARTMENT_ID = B.DEPTID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID
AND B.AVG_SALARY <= 10000
ORDER BY A.EMPLOYEE_ID ASC;

--24. ����� �߿��� �ڽ� �����ϰ� �ִ� ������ �ִ�޿��� ������ �޿��� �޴� ����� ���̵�, �̸�, �޿���
--    ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY
FROM EMPLOYEES A, DEPARTMENTS B, JOBS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.JOB_ID = C.JOB_ID
AND A.SALARY = C.MAX_SALARY;

----25. �м��Լ��� ����ؼ� ������� �޿������� �����ϰ�, ������ �ο����� �� 6~10��° ���ϴ� ����,
--    ����� ���̵�, �̸�, �޿�, �޿������ ��ȸ�ϱ�
SELECT NUM, A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES) A, JOB_GRADES B
WHERE NUM >= 6 AND NUM <= 10
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY NUM ASC;