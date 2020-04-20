-- 조인하기
-- 급여를 5000달러 받는 사원의 아이디, 이름, 직종아이디, 소속부서아이디, 소속부서명을 조회
--                      emp         emp     emp     emp
--                                          job     dept               dept
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY = 3000;

SELECT *
FROM EMPLOYEES, DEPARTMENTS         -- 조인할 테이블을 지정
WHERE EMPLOYEES.SALARY = 3000       -- 조회조건을 정의
AND EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;    -- 조인조건 정의

-- 급여를 15000달러 이상 받은 직원의
-- 직원아이디, 이름, 급여, 직종아이디, 직종제목, 직종최저급여, 직종최고급여를 조회하기
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, 
B.JOB_ID, B.JOB_TITLE, B.MIN_SALARY, B.MAX_SALARY
FROM EMPLOYEES A, JOBS B
WHERE A.SALARY >= 15000
AND A.JOB_ID = B.JOB_ID;

-- 부서관리자가 지정된 부서의
-- 부서아이디, 부서명, 도시명, 우편번호, 주소 조회하기
-- DEPT       DEPT   LOC      LOC    LOC
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, B.CITY, B.POSTAL_CODE, B.STREET_ADDRESS
FROM DEPARTMENTS A, LOCATIONS B
WHERE A.MANAGER_ID IS NOT NULL
AND A.LOCATION_ID = B.LOCATION_ID
ORDER BY A.DEPARTMENT_ID ASC;

-- 관리자 지정된 부서의
-- 부서아이디, 부서명, 관리자아이디, 관리자 이름을 조회하기
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID IS NOT NULL
AND A.MANAGER_ID = B.EMPLOYEE_ID
ORDER BY A.DEPARTMENT_ID ASC;

-- 3개 이상의 테이블 조인하기
-- 급여를 12000이상 받은 사원의
-- 사원아이디, 이름, 급여, 직종아이디, 직종제목, 소속부서아이디, 소속부서명을 조회하기
-- emp        emp   emp   emp                   emp
--                        job        job        dept         dept
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.JOB_ID, B.JOB_TITLE, C.DEPARTMENT_ID, C.DEPARTMENT_NAME
FROM EMPLOYEES A, JOBS B, DEPARTMENTS C
WHERE A.SALARY >= 12000
AND A.JOB_ID = B.JOB_ID
AND A.DEPARTMENT_ID = C.DEPARTMENT_ID;

-- 부서 관리자가 지정된 부서의
-- 부서아이디, 부서명, 관리자의 직원아이디, 직원명, 위치 아이디, 도시명, 주소 조회하기
-- dept       dept   dept                       dept
--                   emp                emp     loc        loc    loc
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME, A.LOCATION_ID, C.CITY, C.STREET_ADDRESS
FROM DEPARTMENTS A, EMPLOYEES B, LOCATIONS C
WHERE A.MANAGER_ID IS NOT NULL
AND A.MANAGER_ID = B.EMPLOYEE_ID
AND A.LOCATION_ID = C.LOCATION_ID;

-- 부서 관리자가 지정된 부서의
-- 부서아이디, 부서명, 위치 아이디, 도시명, 주소, 국가아이디, 국가명 조회하기
-- dept       dept    dept
--                    loc        loc    loc   loc
--                                            country    country
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.LOCATION_ID, B.CITY, B.COUNTRY_ID, C.COUNTRY_NAME
FROM DEPARTMENTS A, LOCATIONS B, COUNTRIES C
WHERE A.MANAGER_ID IS NOT NULL
AND A.LOCATION_ID = B.LOCATION_ID
AND B.COUNTRY_ID = C.COUNTRY_ID;

-- Seattle에서 근무하는 직원의 아이디, 이름, 직종, 소속부서 아이디, 소속부서명을 조회하기
-- loc
--                          emp    emp   emp   emp
--                                       job   dept           dept
-- Seattle에서 근무하는
-- Seattle에 소재한 부서에서 근무하는 직원의 아이디, 이름, 직종, 소속부서 아이디, 소속부서명을 조회하기
-- loc       loc
--           dept                  emp           emp  emp      dept
--                                                             dept            dept
SELECT B.EMPLOYEE_ID, B.FIRST_NAME, B.JOB_ID, C.DEPARTMENT_ID, C.DEPARTMENT_NAME
FROM LOCATIONS A, EMPLOYEES B, DEPARTMENTS C
WHERE A.CITY = 'Seattle'
AND A.LOCATION_ID = C.LOCATION_ID
AND B.DEPARTMENT_ID = C.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID ASC;

-- 직종 변경 이력에서
-- 직원아이디, 직원이름, 업무시작일, 업무종료일, 직종아이디, 직종제목, 부서아이디, 부서명 조회하기
-- history             history    history    history            history
-- emp         emp
--                                           jobs        jobs   dept       dept
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.START_DATE, B.END_DATE, B.JOB_ID, C.JOB_TITLE, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES A, JOB_HISTORY B, JOBS C, DEPARTMENTS D
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND B.JOB_ID = C.JOB_ID
AND B.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY A.EMPLOYEE_ID ASC;

CREATE TABLE JOB_GRADES (
    GRA CHAR(1) PRIMARY KEY,
    LOWEST_SAL NUMBER(6,0) NOT NULL,
    HIGHEST_SAL NUMBER(6,0)NOT NULL
);

INSERT INTO JOB_GRADES VALUES('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES('F', 25000, 40000);

COMMIT;

-- 비등가 조인
-- 50번 부서에 소속된 직원의 급여 등급을 조회하기
-- 직원아이디, 이름, 급여, 급여 등급
-- emp        emp  emp
--                 gra   grade
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.SALARY, B.GRA
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.DEPARTMENT_ID = 50
AND A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
ORDER BY EMPLOYEE_ID ASC;

-- 직종별 최저/최고급여의 등급 조회하기
-- 직종아이디, 직종제목, 직종최저급여, 급여등급
-- job        job      job         grade
SELECT A.JOB_ID, A.JOB_TITLE, A.MIN_SALARY, B.GRA MIN_SALARY_GRA, A.MAX_SALARY, C.GRA MAX_SALARY_GRA
FROM JOBS A, JOB_GRADES B, JOB_GRADES C
WHERE A.MIN_SALARY >= B.LOWEST_SAL
AND A.MIN_SALARY <= B.HIGHEST_SAL
AND A.MAX_SALARY >= C.LOWEST_SAL
AND A.MAX_SALARY <= C.HIGHEST_SAL
ORDER BY A.JOB_ID ASC;