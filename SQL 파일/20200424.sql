-- 사용자 정보 등록하기
-- 모든 컬럼에 값을 명시적으로 저장하기
-- 나열된 컬럼순서에 맞게 값을 나열한다.
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE)
VALUES
('minseob', 'zxcv1234', '이민섭', 'minsub@naver.com', 10, SYSDATE);

-- 컬럼명을 생략한 경우
-- 테이블의 컬럼순서에 맞게 값을 나열한다.
INSERT INTO SAMPLE_BOOK_USERS
VALUES
('neena', 'zxcv1234', '니나', 'neena@gmail.com', 100, SYSDATE);

-- 컬럼명을 생략한 경우
-- 반드시 테이블의 컬럼순서에 맞게 모든 값을 나열해야 한다.
INSERT INTO SAMPLE_BOOK_USERS
VALUES
('ssosso', 'zxcv1234', '소영선배', 'ssosso@gmail.com'); -- 오류, 값이 부족함.

-- 나열된 컬럼에만 값을 저장하고, 나머지는 NULL이나 DEFAULT값이 저장되게 하기
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME)
VALUES
('suyoung', 'zxcv1234', '김수영');

-- 필수입력값이 누락된 경우
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD)
VALUES
('dalchong', 'zxcv1234'); -- 오류

-- 컬럼의 크기보다 큰 값이 입력되는 경우
INSERT INTO SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME) -- 오류
VALUES
('dalchong', 'zxcv1234', '김수한무거북이와두루미삼천갑자동박삭김수한무거북이와두루미삼천갑자동박삭김수한무거북이와두루미삼천갑자동박삭');

-- 테이블의 값 수정하기
-- 모든 행의 특정 컬럼값을 수정하기(WHERE 절을 생략하면 된다.)
-- 모든 사용자의 비밀번호를 'zxcv1234'로 변경하기
UPDATE SAMPLE_BOOK_USERS
SET
    USER_PASSWORD = 'zxcv1234';
    
-- 모든 행의 특정 컬럼값을 수정하기
-- 모든 직원들의 급여를 500불 인상하기
UPDATE EMPLOYEES
SET
    SALARY = SALARY + 500;
    
-- WHERE절을 사용해서 조건식을 만족하는 특정행의 컬럼값을 수정하기
-- 90번 부서에 소속된 직원의 급여를 10000달러 인상시키기
UPDATE EMPLOYEES
SET
    SALARY = SALARY + 10000
WHERE DEPARTMENT_ID = 90;

-- 한 번에 여러 컬럼의 값을 변경하기
-- 100010번 책의 제목, 가격, 할인가격을 수정하기
UPDATE SAMPLE_BOOKS
SET
    BOOK_TITLE = '이것이 자바다 개정판',
    BOOK_PRICE = 40000,
    BOOK_DISCOUNT_PRICE = 38000
WHERE BOOK_NO = 100010;

-- 서브쿼리를 이용해서 값 변경하기
-- 132번 직원의 급여를 소속부서(50번 부서)의 평균급여만큼 변경하기
UPDATE EMPLOYEES
SET
    SALARY = (SELECT TRUNC(AVG(SALARY))
              FROM EMPLOYEES
              WHERE DEPARTMENT_ID = 50)
WHERE EMPLOYEE_ID = 132;

-- 10번 부서의 부서번호를 300번으로 변경하기
UPDATE DEPARTMENTS
SET
    DEPARTMENT_ID = 300
WHERE DEPARTMENT_ID = 10; -- 오류, 자식테이블(EMPLOYEES)에 자식레코드 존재

-- 100사원의 소속부서를 500번으로 변경하기
UPDATE EMPLOYEES
SET
    DEPARTMENT_ID = 500
WHERE EMPLOYEE_ID = 100; -- 오류, 부모테이블(DEPARTMENTS)에 500번 부서가 존재하지 않음

-- 데이터 삭제하기
-- 아이디가 neena인 행 삭제하기
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


-- SAMPLE_BOOK_USERS의 모든 행을 COPY_SAMPLE_BOOK_USERS에 추가하기
INSERT INTO COPY_SAMPLE_BOOK_USERS
(USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE)
SELECT USER_ID, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_POINT, USER_REGISTERED_DATE
FROM SAMPLE_BOOK_USERS;

-- 원본 테이블에 새로운 추가
INSERT INTO SAMPLE_BOOK_USERS
VALUES ('ryu', 'zxcv1234', '류관순', 'abc123@gmail.com', 10, sysdate);
INSERT INTO SAMPLE_BOOK_USERS
VALUES ('kkang', 'zxcv1234', '강감찬', 'kkang1111@gmail.com', 100, sysdate);

-- 원본테이블과 대상테이블 병합하기
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