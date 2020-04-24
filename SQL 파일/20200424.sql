-- ����� ���� ����ϱ�
-- ��� �÷��� ���� ��������� �����ϱ�
-- ������ �÷������� �°� ���� �����Ѵ�.
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE)
VALUES
('minseob', 'zxcv1234', '�̹μ�', 'minsub@naver.com', 10, SYSDATE);

-- �÷����� ������ ���
-- ���̺��� �÷������� �°� ���� �����Ѵ�.
INSERT INTO SAMPLE_BOOK_USERS
VALUES
('neena', 'zxcv1234', '�ϳ�', 'neena@gmail.com', 100, SYSDATE);

-- �÷����� ������ ���
-- �ݵ�� ���̺��� �÷������� �°� ��� ���� �����ؾ� �Ѵ�.
INSERT INTO SAMPLE_BOOK_USERS
VALUES
('ssosso', 'zxcv1234', '�ҿ�����', 'ssosso@gmail.com'); -- ����, ���� ������.

-- ������ �÷����� ���� �����ϰ�, �������� NULL�̳� DEFAULT���� ����ǰ� �ϱ�
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME)
VALUES
('suyoung', 'zxcv1234', '�����');

-- �ʼ��Է°��� ������ ���
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD)
VALUES
('dalchong', 'zxcv1234'); -- ����

-- �÷��� ũ�⺸�� ū ���� �ԷµǴ� ���
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME) -- ����
VALUES
('dalchong', 'zxcv1234', '����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ����ѹ��ź��̿͵η�̻�õ���ڵ��ڻ�');

-- ���̺��� �� �����ϱ�
-- ��� ���� Ư�� �÷����� �����ϱ�(WHERE ���� �����ϸ� �ȴ�.)
-- ��� ������� ��й�ȣ�� 'zxcv1234'�� �����ϱ�
UPDATE SAMPLE_BOOK_USERS
SET
    USER_PASSWORD = 'zxcv1234';
    
-- ��� ���� Ư�� �÷����� �����ϱ�
-- ��� �������� �޿��� 500�� �λ��ϱ�
UPDATE EMPLOYEES
SET
    SALARY = SALARY + 500;
    
-- WHERE���� ����ؼ� ���ǽ��� �����ϴ� Ư������ �÷����� �����ϱ�
-- 90�� �μ��� �Ҽӵ� ������ �޿��� 10000�޷� �λ��Ű��
UPDATE EMPLOYEES
SET
    SALARY = SALARY + 10000
WHERE DEPARTMENT_ID = 90;

-- �� ���� ���� �÷��� ���� �����ϱ�
-- 100010�� å�� ����, ����, ���ΰ����� �����ϱ�
UPDATE SAMPLE_BOOKS
SET
    BOOK_TITLE = '�̰��� �ڹٴ� ������',
    BOOK_PRICE = 40000,
    BOOK_DISCOUNT_PRICE = 38000
WHERE BOOK_NO = 100010;

-- ���������� �̿��ؼ� �� �����ϱ�
-- 132�� ������ �޿��� �ҼӺμ�(50�� �μ�)�� ��ձ޿���ŭ �����ϱ�
UPDATE EMPLOYEES
SET
    SALARY = (SELECT TRUNC(AVG(SALARY))
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 50)
WHERE EMPLOYEE_ID = 132;

-- 10�� �μ��� �μ���ȣ�� 300������ �����ϱ�
UPDATE DEPARTMENTS
SET
    DEPARTMENT_ID = 300
WHERE DEPARTMENT_ID = 10; -- ����, �ڽ����̺�(EMPLOYEES)�� �ڽķ��ڵ� ����

-- 100����� �ҼӺμ��� 500������ �����ϱ�
UPDATE EMPLOYEES
SET
    DEPARTMENT_ID = 500
WHERE EMPLOYEE_ID = 100; -- ����, �θ����̺�(DEPARTMENTS)�� 500�� �μ��� �������� ����

-- ������ �����ϱ�
-- ���̵� neena�� �� �����ϱ�
DELETE FROM SAMPLE_BOOK_USERS
WHERE USER_ID = 'neena';



CREATE TABLE COPY_SAMPLE_BOOK_USERS(
    USER_ID VARCHAR2(50) PRIMARY KEY,
    USER_PASSWORD VARCHAR2(50),
    USER_NAME VARCHAR2(100),
    USER_EMAIL VARCHAR2(256),
    USER_POINT NUMBER(10,0),
    USER_REGISTERED_DATE DATE
);


-- SAMPLE_BOOK_USERS�� ��� ���� COPY_SAMPLE_BOOK_USERS�� �߰��ϱ�
INSERT INTO COPY_SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE)
SELECT USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE
FROM SAMPLE_BOOK_USERS;

-- ���� ���̺� ���ο� �߰�
INSERT INTO SAMPLE_BOOK_USERS
VALUES ('ryu', 'zxcv1234', '������', 'abc123@gmail.com', 10, sysdate);
INSERT INTO SAMPLE_BOOK_USERS
VALUES ('kkang', 'zxcv1234', '������', 'kkang1111@gmail.com', 100, sysdate);

-- �������̺�� ������̺� �����ϱ�
MERGE INTO COPY_SAMPLE_BOOK_USERS B
    USING SAMPLE_BOOK_USERS A
    ON (B.USER_ID = A.USER_ID)
WHEN MATCHED THEN
    UPDATE SET
        B.USER_PASSWORD = A.USER_PASSWORD,
        B.USER_NAME = A.USER_NAME,
        B.USER_EMAIL = A.USER_EMAIL,
        B.USER_POINT = A.USER_POINT,
        B.USER_REGISTERED_DATE = A.USER_REGISTERED_DATE
WHEN NOT MATCHED THEN
    INSERT VALUES
    (A.USER_ID, A.USER_PASSWORD, A.USER_NAME, A.USER_EMAIL, A.USER_POINT, A.USER_REGISTERED_DATE);
    
    COMMIT;