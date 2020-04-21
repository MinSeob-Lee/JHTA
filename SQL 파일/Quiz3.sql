--1. ��� �������� ��� �������̵� ��ȸ�ϱ�
SELECT JOB_ID
FROM EMPLOYEES;
--2. �޿��� 12,000�޷� �̻� �޴� ������ �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;
--3. ������ȣ�� 176�� ������ ���� �μ����� �ٹ��ϴ� ������ ���̵�� �̸� �������̵� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID
FROM EMPLOYEES A, EMPLOYEES B
WHERE B.EMPLOYEE_ID = 176
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID;
--4. �޿��� 12,000�޷� �̻� 15,000�޷� ���� �޴� �������� ���� ���̵�� �̸��� �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000
AND SALARY <= 15000;
--5. 2005�� 1�� 1�Ϻ��� 2005�� 6�� 30�� ���̿� �Ի��� ������ ���̵�, �̸�, �������̵�, �Ի����� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2005/01/01'
AND HIRE_DATE <= '2005/06/30';
--6. �޿��� 5,000�޷��� 12,000�޷� �����̰�, �μ���ȣ�� 20 �Ǵ� 50�� ������ �̸��� �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000
AND DEPARTMENT_ID IN (20, 50);
--7. �����ڰ� ���� ������ �̸��� �������̵� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;
--8. Ŀ�̼��� �޴� ��� ������ �̸��� �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� ������������ �����ؼ� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY COMMISSION_PCT, SALARY ASC;
--9. �̸��� 2��° ���ڰ� e�� ��� ������ �̸��� ��ȸ�ϱ�
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';
--10. �������̵� ST_CLERK �Ǵ� SA_REP�̰� �޿��� 2,500�޷�, 3,500�޷�, 7,000�޷� �޴� ��� ������ �̸��� �������̵�, �޿��� ��ȸ�ϱ�
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('ST_CLERK', 'SA_REF')
AND SALARY IN (2500, 3500, 7000);
--11. ��� ������ �̸��� �Ի���, �ٹ� ���� ���� ����Ͽ� ��ȸ�ϱ�, �ٹ����� ���� ������ �ݿø��ϰ�, �ٹ��������� �������� ������������ �����ϱ�
SELECT FIRST_NAME, HIRE_DATE, TRUNC((SYSDATE - HIRE_DATE) / 12) WORKING_DATE
FROM EMPLOYEES
ORDER BY WORKING_DATE DESC;
--12. ������ �̸��� Ŀ�̼��� ��ȸ�ϱ�, Ŀ�̼��� ���� �ʴ� ������ '����'���� ǥ���ϱ�
SELECT FIRST_NAME, NVL(TO_CHAR(COMMISSION_PCT), '����')
FROM EMPLOYEES;
--13. ��� ������ �̸�, �μ���ȣ, �μ��̸��� ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;
--14. 80���μ��� �Ҽӵ� ������ �̸��� �������̵�, ��������, �μ��̸��� ��ȸ�ϱ�
SELECT A.FIRST_NAME, B.JOB_ID, B.JOB_TITLE, C.DEPARTMENT_NAME
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C
WHERE A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID;
--15. Ŀ�̼��� �޴� ��� ������ �̸��� �������̵�, ��������, �μ��̸�, �μ������� ���ø��� ��ȸ�ϱ�
SELECT A.FIRST_NAME, B.JOB_ID, B.JOB_TITLE, C.DEPARTMENT_NAME, D.CITY
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C, LOCATIONS D
WHERE A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID
AND C.LOCATION_ID = D.LOCATION_ID;
--16. ������ �������� �ΰ� �ִ� ��� �μ����̵�� �μ��̸��� ��ȸ�ϱ�
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME
FROM DEPARTMENTS A, REGIONS B, COUNTRIES C, LOCATIONS D
WHERE B.REGION_NAME = 'Europe'
AND B.REGION_ID = C.REGION_ID
AND C.COUNTRY_ID = D.COUNTRY_ID
AND D.LOCATION_ID = A.LOCATION_ID;
--17. ������ �̸��� �ҼӺμ���, �޿�, �޿� ����� ��ȸ�ϱ�
SELECT A.FIRST_NAME, B.DEPARTMENT_NAME, A.SALARY, C.GRA
FROM EMPLOYEES A, DEPARTMENTS B, JOB_GRADES C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A.SALARY >= C.LOWEST_SAL
AND A.SALARY <= C.HIGHEST_SAL;
--18. ������ �̸��� �ҼӺμ���, �ҼӺμ��� �����ڸ��� ��ȸ�ϱ�, �ҼӺμ��� ���� ������ �ҼӺμ��� '����, �����ڸ� '����'���� ǥ���ϱ� **
SELECT A.FIRST_NAME, NVL(TO_CHAR(B.DEPARTMENT_NAME), '����'), NVL(TO_CHAR(A2.FIRST_NAME), '����')
FROM EMPLOYEES A, EMPLOYEES A2, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
AND B.MANAGER_ID = A2.EMPLOYEE_ID(+)
ORDER BY A.EMPLOYEE_ID ASC;
--19. ��� ����� �̸�, �������̵�, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.JOB_ID, A.SALARY, B.DEPARTMENT_NAME
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
ORDER BY A.EMPLOYEE_ID ASC;
--20. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.JOB_ID, B.JOB_TITLE, A.SALARY, B.MIN_SALARY, B.MAX_SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID;
--21. ��� ����� �̸�, �������̵�, ��������, �޿�, �ּұ޿��� ���� �޿��� ���̸� ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.JOB_ID, B.JOB_TITLE, A.SALARY, TRUNC(A.SALARY - B.MIN_SALARY) �޿�����
FROM EMPLOYEES A, JOBS B
WHERE A.JOB_ID = B.JOB_ID;
--22. Ŀ�̼��� �޴� ��� ����� ���̵�, �μ��̸�, �ҼӺμ��� ������(���ø�)�� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, B.DEPARTMENT_NAME, C.CITY
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID;
--23. �̸��� A�� a�� �����ϴ� ��� ����� �̸��� ����, ��������, �޿�, �ҼӺμ����� ��ȸ�ϱ�
SELECT A.FIRST_NAME, B.JOB_ID, B.JOB_TITLE, A.SALARY, C.DEPARTMENT_NAME
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C
WHERE A.DEPARTMENT_ID = C.DEPARTMENT_ID
AND A.JOB_ID = B.JOB_ID
AND A.FIRST_NAME LIKE 'A%'
OR A.FIRST_NAME LIKE 'a%';
--24. 30, 60, 90�� �μ��� �ҼӵǾ� �ִ� ����� �߿��� 100���� �����ϴ� ������� �̸�, ����, �޿�,
--    �޿������ ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.JOB_ID, A.SALARY, B.GRA
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.DEPARTMENT_ID IN (24, 30, 60, 90)
AND A.MANAGER_ID = 100
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL;
--25. 80�� �μ��� �Ҽӵ� ������� �̸�, ����, ��������, �޿�, �ּұ޿�, �ִ�޿�, �޿����, 
--    �ҼӺμ����� ��ȸ�ϱ�
SELECT A.FIRST_NAME, B.JOB_ID, B.JOB_TITLE, A.SALARY, B.MIN_SALARY, B.MAX_SALARY, C.GRA
FROM EMPLOYEES A, JOBS B, JOB_GRADES C, DEPARTMENTS D
WHERE A.DEPARTMENT_ID = 80
AND A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = D.DEPARTMENT_ID
AND A.SALARY >= C.LOWEST_SAL
AND A.SALARY <= C.HIGHEST_SAL
ORDER BY A.EMPLOYEE_ID ASC;
--26. ������߿��� �ڽ��� ��纸�� ���� �Ի��� ������� �̸�, �Ի���, ����� �̸�, ����� �Ի�����
--    ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.HIRE_DATE, A2.FIRST_NAME, A2.HIRE_DATE
FROM EMPLOYEES A, EMPLOYEES A2, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND A2.EMPLOYEE_ID = B.MANAGER_ID
AND A.HIRE_DATE < A2.HIRE_DATE;
--27. �μ����� IT�� �μ��� �ٹ��ϴ� ������� �̸���, ����, �޿�, �޿����, ����� �̸��� ������
--    ��ȸ�ϱ�
SELECT A.FIRST_NAME, A.JOB_ID, A.SALARY, B.GRA, A2.FIRST_NAME, A2.JOB_ID
FROM EMPLOYEES A, EMPLOYEES A2, JOB_GRADES B, DEPARTMENTS C
WHERE C.DEPARTMENT_NAME = 'IT'
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID
AND A2.EMPLOYEE_ID = C.MANAGER_ID
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY A.EMPLOYEE_ID ASC;
--28. 'ST_CLERK'�� �ٹ��ϴٰ� �ٸ� �������� ������ ����� ���̵�, �̸�, ������ �μ���,
--     ���� ����, ���� �ٹ��μ����� ��ȸ�ϱ�
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, C2.DEPARTMENT_NAME, A.JOB_ID, C.DEPARTMENT_NAME
FROM EMPLOYEES A, JOB_HISTORY B, DEPARTMENTS C, DEPARTMENTS C2
WHERE B.JOB_ID = 'ST_CLERK'
AND A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND B.DEPARTMENT_ID = C2.DEPARTMENT_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID;