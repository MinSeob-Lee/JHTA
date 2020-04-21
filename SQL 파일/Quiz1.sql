-- 부서테이블의 모든 부서 정보를 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS;
-- 부서테이블에서 위치아이디가 1700번이 아닌 부서 정보 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE LOCATION_ID != 1700;
-- 100사원이 관리하는 부서정보 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100;
-- 부서명이 'IT'인 부서의 정보 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';
-- 위치아이디가 1700번인 지역의 주소, 우편번호, 도시명, 국가코드를 조회하기
SELECT STREET_ADDRESS, POSTAL_CODE, CITY, COUNTRY_ID
FROM LOCATIONS
WHERE LOCATION_ID = 1700;
-- 최소급여가 2000이상 5000이하인 직종의 직종아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MIN_SALARY >= 2000
AND MAX_SALARY <= 5000;
-- 최대급여가 20000불을 초과하는 직종의 아이디, 직종제목, 최소급여, 최대급여 조회하기
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY > 20000;
-- 100직원에게 보고하는 사원의 아이디, 이름, 부서아이디을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE MANAGER_ID = 100;
-- 80번 부서에서 근무하고 급여를 8000불 이상 받는 사원의 아이디, 이름, 급여, 커미션포인트 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY >= 8000;
-- 직종이 SA_REP이고, 커미션포인트가 0.25이상인 사원의 아이디, 이름, 급여, 커미션포인트를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REF'
AND COMMISSION_PCT >= 0.25;
-- 80번 부서에 근무하고, 급여가 10000불 이상인 사원의 아이디, 이름, 급여, 연봉을 조회하기
    연봉 = (급여 + 급여*커미션)*12다
    연봉의 별칭은 annual_salary다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY + SALARY * COMMISSION_PCT) * 12 AS ANNUAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY >= 10000;
-- 80번 부서에 근무하고, 147번 직원에게 보고하는 사원 중에서 커미션이 0.1인 사원의 
    사원아이디, 이름, 직종, 급여, 커미션포인트를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND MANAGER_ID = 147
AND COMMISSION_PCT = 0.1;
-- 사원들이 수행하는 직종을 중복없이 조회하기
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- 사원들이 소속된 부서아이디를 모두 조회하기
SELECT DEPARTMENT_ID
FROM DEPARTMENTS;
-- 급여가 12000을 넘는 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 12000;
-- 급여가 5000이상 12000이하인 사원의 이름과 급여를 조회하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000;
-- 2007년에 입사한 사원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%07';
-- 20과 50번 부서에 소속된 사원의 이름과 부서번호를 조회하고, 이름을 알파벳순으로 정렬해서  조회하기
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20
AND DEPARTMENT_ID = 50
ORDER BY FIRST_NAME ASC;
-- 급여가 5000이상 12000이하고, 20번과 50번 부서에 소속된 사원의 이름과 급여, 부서번호를 조회하기
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 5000
AND SALARY <= 12000
AND DEPARTMENT_ID = 20
AND DEPARTMENT_ID = 50;
-- 관리자가 없는 사원의 이름과 직종, 급여를 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;
-- 직종이 'SA_MAN'이거나 'ST_MAN'인 직원중에서 급여를 8000이상 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN'
AND SALARY >= 8000;
? 2020 GitHub, Inc.
