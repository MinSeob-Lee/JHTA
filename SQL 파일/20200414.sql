-- 사원아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

-- 부서아이디, 부서명을 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS;

-- 잡아이디, 잡타이틀을 조회하기
SELECT JOB_ID, JOB_TITLE
FROM JOBS;

-- 나라이름 조회하기
SELECT COUNTRY_NAME
FROM COUNTRIES;

-- 사원아이디, 이름, 급여, 연봉을 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 연봉은 ANN_SAL로 정의하기
SELECT EMPLOYEE_ID ID, FIRST_NAME AS NAME, SALARY AS SAL, SALARY * 12 AS ANN_SAL
FROM EMPLOYEES;

-- 사원아이디, 이름, 급여, 10% 인상된 급여를 조회하기
-- 사원아이디의 별칭은 ID, 이름은 NAME, 급여는 SAL, 10% 인상된 급여는 INCREMENT SALARY로 정의하기
SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS NAME, SALARY AS SAL, SALARY * 1.1 AS "INCREMENT SALARY"
FROM EMPLOYEES;

-- 부서아이디, 부서명, 부서담당자 아이디 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS;

-- 사원아이디, 이름, 급여, 커미션, 커미션이 포함된 급여 조회하기
-- 커미션이 포함된 급여는 급여 + 급여 * 커미션
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY + (SALARY * COMMISSION_PCT)
FROM EMPLOYEES;

-- 중복행 없이 조회하기
-- 사원들이 종사하고 있는 직종을 전부 조회하기
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 60번 부서에 근무하는 사원의 아이디, 이름, 직종, 급여, 부서아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 급여를 15000달러 이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 15000;