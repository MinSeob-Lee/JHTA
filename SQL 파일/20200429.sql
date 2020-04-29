-- Top-N �м�

-- 50�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ���� 3���� ��ȸ�ϱ�
SELECT ROWNUM, SALARY, FIRST_NAME
FROM (SELECT SALARY, FIRST_NAME
      FROM EMPLOYEES
      WHERE DEPARTMENT_ID = 50
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

-- �μ��� ������� ������� �� ������� ���� ���� �μ� 3���� ��ȸ�ϱ�
SELECT ROWNUM, DEPARTMENT_ID, CNT
FROM (SELECT DEPARTMENT_ID, COUNT(*) CNT
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID
      ORDER BY CNT DESC)
WHERE ROWNUM <= 3;

-- �μ��� ������� ������� �� ������� ���� ���� �μ� 3���� ��ȸ�ϱ�
-- �μ����̵�, �μ���, ������� ��µǾ�� ��.
SELECT *
FROM DEPARTMENTS A, (SELECT ROWNUM RANKING, DEPARTMENT_ID, CNT
                     FROM (SELECT DEPARTMENT_ID, COUNT(*) CNT
                           FROM EMPLOYEES
                           GROUP BY DEPARTMENT_ID
                           ORDER BY CNT DESC)
                     WHERE ROWNUM <= 3) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID;

-- ������ ���� ��� å 3���� ��ȸ�ϱ�
-- ����, ����, ������ ��µǾ�� �� 
SELECT ROWNUM RANKING, BOOK_TITLE, BOOK_PRICE
FROM (SELECT BOOK_TITLE, BOOK_PRICE
      FROM SAMPLE_BOOKS
      ORDER BY BOOK_PRICE DESC)
      WHERE ROWNUM <= 3;
      
-- ������ ���� ��� å 3���� ��ȸ���� ��
-- �ֱ� 1���� �̳��� �� å�� �� ����ڸ� ��ȸ�ϱ�
-- ����ھ��̵�, ����ڸ�, å����, ���Ű���, ���ż���, ���ų�¥�� ��µǾ�� ��
SELECT A.USER_ID, A.USER_NAME, B.BOOK_TITLE, C.ORDER_AMOUNT, C.ORDER_REGISTERED_DATE, C.ORDER_PRICE
FROM SAMPLE_BOOK_USERS A, (SELECT ROWNUM RANKING, BOOK_TITLE, BOOK_NO, BOOK_PRICE
                           FROM (SELECT BOOK_TITLE, BOOK_NO, BOOK_PRICE
                           FROM SAMPLE_BOOKS
                           ORDER BY BOOK_PRICE DESC)
                           WHERE ROWNUM <= 3) B, SAMPLE_BOOK_ORDERS C
WHERE A.USER_ID = C.USER_ID
      AND B.BOOK_NO = C.BOOK_NO
      AND C.ORDER_REGISTERED_DATE > SYSDATE - 7;
      
-- �����Ѿ��� ������� �� �����Ѿ��� ���� ���� �������
-- ���̵�, �̸�, �ѱ��űݾ��� ��ȸ�ϱ�
SELECT A.USER_ID, A.USER_NAME, B.TOTAL_PRICE
FROM SAMPLE_BOOK_USERS A, (SELECT USER_ID, TOTAL_PRICE
                           FROM(SELECT USER_ID, SUM(ORDER_PRICE * ORDER_AMOUNT) TOTAL_PRICE
                                FROM SAMPLE_BOOK_ORDERS
                                GROUP BY USER_ID
                                ORDER BY TOTAL_PRICE DESC)
                           WHERE ROWNUM = 1) B
WHERE A.USER_ID = B.USER_ID;

-- �м��Լ� ����ϱ�
-- �޿��� �������� �����ؼ� ���� �ο��ϱ�
SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC), SALARY, FIRST_NAME
FROM EMPLOYEES;

-- �޿��� �������� �������� �����ؼ� ������ �ο����� �� �޿������� 11~20���� �ش��ϴ� ������
-- ����, ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) NUM, EMPLOYEE_ID, FIRST_NAME, SALARY
      FROM EMPLOYEES)
WHERE NUM >= 11 AND NUM <= 20;

-- �μ����� �޿��� �������� �������� �����ؼ� ������ �ο��ϱ�
SELECT 
    ROW_NUMBER() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) NUM,
    DEPARTMENT_ID, SALARY, FIRST_NAME
FROM EMPLOYEES;

-- �μ����� �޿��� �������� �������� �����ؼ� ������ �ο����� ��
-- �ش� �μ����� ���� �޿��� ���� �޴� ������
-- �̸�, �޿�, �μ����̵� ��ȸ�ϱ�
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM (SELECT ROW_NUMBER() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) NUM,
             FIRST_NAME, SALARY, DEPARTMENT_ID
      FROM EMPLOYEES)
WHERE NUM = 1;

SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) ROW_NUMBER,
       RANK()       OVER(ORDER BY SALARY DESC) RANK,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) DENSE_RANK,
       SALARY
FROM EMPLOYEES;

-- ROW NUMBER() OVER()�� Ȱ���ؼ� �����͸� Ư�� �÷����� �������� �������� ������ ��ȸ�ϱ�
SELECT *
FROM (SELECT ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) NUM, EMPLOYEE_ID, FIRST_NAME
      FROM EMPLOYEES)
WHERE NUM >= 1 AND NUM <= 10;

SELECT *
FROM (SELECT ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) NUM, EMPLOYEE_ID, FIRST_NAME
      FROM EMPLOYEES)
WHERE NUM >= 11 AND NUM <= 20;

SELECT FIRST_VALUE(SALARY) OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC), 
       DEPARTMENT_ID, SALARY, FIRST_NAME
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;

-- ���ο� �Ϸù�ȣ ��ȸ
SELECT SAMPLE_ORDER_SEQ.NEXTVAL FROM DAUL;
-- ���� �������� �Ϸù�ȣ ��ȸ
SELECT SAMPLE_ORDER_SEQ.CURRVAL FROM DUAL;

CREATE INDEX SAMPLE_USER_IDX
ON SAMPLE_BOOK_USERS (USER_NAME);

CREATE INDEX SAMPLE_ORDER_DATE_IDX
ON SAMPLE_BOOK_ORDERS (TO_CHAR(ORDER_REGISTERED_DATE, 'YYYY-MM-DD'));

SELECT *
FROM SAMPLE_BOOK_USERS
WHERE USER_NAME = 'ȫ�浿';

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

SELECT *
FROM SAMPLE_BOOK_ORDERS
WHERE TO_CHAR(ORDER_REGISTERED_DATE, 'YYYY-MM-DD') = '2020-04-28';