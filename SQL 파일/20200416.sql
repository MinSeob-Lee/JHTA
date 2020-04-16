SELECT JOB_TITLE
FROM JOBS;

-- 테이블에서 열을 선택해서 조회하기
-- 사원아이디, 사원명, 직종아이디, 급여 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES;

-- 직종아이디, 직종의 최소급여, 최대급여 조회하기
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM JOBS;

-- 지역아이디, 도시명, 주소 조회하기
SELECT LOCATION_ID, CITY, STREET_ADDRESS
FROM LOCATIONS;

-- 사원아이디, 사원명, 입사일 조회하기
SELECT EMPLOYEE_ID AS ID, FIRST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES;

-- 연산자를 이용하기, 별칭 사용하기
-- 사원아이디, 직종, 급여, 연봉을 조회하고 적절한 별칭 부여하기
SELECT EMPLOYEE_ID AS ID, JOB_ID AS JOB, SALARY, SALARY*4*12 AS ANN_SAL
FROM EMPLOYEES;

-- 사원아이디, 직종, 급여, 시급을 조회하고 적절한 별칭 부여하기, 시급은 급여/(5*24) 이다.
SELECT EMPLOYEE_ID ID, JOB_ID JOB, SALARY SAL, SALARY/(5*24) TIME_SAL
FROM EMPLOYEES;

-- 행을 제한해서 조회하기
-- 60번 부서에서 근무하는 사원의 아이디, 이름, 직종, 부서아이디를 조회하기
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, DEPARTMENT_ID DEPT
FROM EMPLOYEES
WHERE (DEPARTMENT_ID=60);

-- 급여를 5000달러 이하로 받는 사원아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, SALARY
FROM EMPLOYEES
WHERE SALARY<=5000;

-- 100번 직원에게 보고하는 직원의 아이디, 이름 조회하기
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME
FROM EMPLOYEES
WHERE MANAGER_ID=100;

-- 100번 직원이 부서담당자로 지정된 부서의 아이디, 부서명을 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID=100;

-- 직종 최대 급여가 15000달러 이상 되는 직종의 아이디, 직종제목, 최대급여 조회하기
SELECT JOB_ID, JOB_TITLE, MAX_SALARY
FROM JOBS
WHERE MAX_SALARY>=15000;

-- 시급을 100달러 이상 받는 직원의 아이디, 이름, 직종, 급여, 시급을 조회하기
SELECT EMPLOYEE_ID ID, FIRST_NAME NAME, JOB_ID JOB, SALARY, SALARY/(5*8) AS "SALARY/H"
FROM EMPLOYEES
WHERE SALARY/(5*8)>100;

-- 이름이 Neena인 사람의 직원아이디, 이름, 이메일, 전화번호를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER
FROM EMPLOYEES
WHERE FIRST_NAME = 'Neena';

-- 커미션이 null인 직원의 직원아이디, 이름, 소속부서아이디 확인하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

-- 커미션이 null이 아닌 직원의 직원아이디, 이름, 직종아이디, 소속부서 아이디 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 소속부서를 배정받지 못한 직원의 아이디, 이름, 입사일 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- 부서담당자가 지정되지 않은 부서의 아이디, 부서명을 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

-- 부서담당자가 지정된 부서의 부서아이디, 부서명, 담당자 직원아이디 조회하기
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

-- between a and b 사용하기
-- 급여를 2000이상 3000이하로 받는 사원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 3000;

-- In(값1, 값2, 값3...) 사용하기
-- 10번 부서와 20번 부서에 소속된 사원의 아이디, 이름, 소속부서 아이디 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20);

-- 50, 60, 70, 80번 부서에 소속되지 않은 사원의 아이디, 이름, 소속부서 아이디 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (50, 60, 70, 80);

-- 국가아이디가 JP, US인 지역의 위치아이디, 주소, 국가아이디 조회하기
SELECT LOCATION_ID, STREET_ADDRESS, COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN ('JP', 'US');

-- 직원의 직종아이디가 AD_PRES이거나 AD_VP인 직원의 아이디, 이름, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN('AD_PRES', 'AD_VP');

-- 50번 혹은 60번 부서에 근무한 적이 있는 사원의 아이디, 근무시작일, 근무종료일을 조회하기
SELECT EMPLOYEE_ID, START_DATE, END_DATE
FROM JOB_HISTORY
WHERE DEPARTMENT_ID IN (50, 60);

-- 101번이나 102번 직원이 상사로 지정된 사원의 아이디, 이름, 매니저아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN(101,102);

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_________%' AND FIRST_NAME LIKE '%er';

-- 직종아이디가 **_MAN인 직원의 아이디, 이름, 직종아이디, 급여 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID LIKE '%MAN';

-- 이름이 'A'로 시작하고 이름이 네 글자인 직원의 이름을 전부 조회하기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A___';

-- 이름에 'e'가 포함된 직원의 이름을 전부 조회하기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'E%' 
OR FIRST_NAME LIKE '%e%';

-- 논리 연산자를 사용해서 2개 이상의 조건을 만족하는 행을 조회하기
-- 80번 부서에서 일하는 직원 중 급여가 3000달러 미만인 사원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=80 
AND SALARY<3000;

-- 50번 부서에서 일하는 직원 중 직종이 매니저인 직원의 직원아이디, 이름, 직종아이디, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50 
AND JOB_ID LIKE '%MAN';

-- 50번 부서에서 일하고 급여를 2500불 이하로 받고, 자신의 매니저의 아이디가 121번인 직원의 아이디, 이름, 입사일, 급여, 직종아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=50 
AND SALARY<=2500 
AND MANAGER_ID=121;

-- 50번이나 60번 부서에 소속된 직원 중에서 이름이 'A'로 시작하는 직원의 아이디, 이름, 부서아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50,60) 
AND FIRST_NAME LIKE 'A%';

-- 커미션을 받는 직원 중에서 급여를 10000달러 이상 받는 직원의 아이디, 이름, 직종, 입사일, 급여, 연봉을 조회하기
-- 연봉 = 급여*4*12 + 급여*커미션*4*12
SELECT 
    EMPLOYEE_ID
    , FIRST_NAME
    , JOB_ID
    , HIRE_DATE, SALARY
    , (SALARY*(1+COMMISSION_PCT)*4*12) AS "ANN SAL"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
AND SALARY>=10000;

-- 정렬하기
-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 입사일을 조회하기
-- 이름순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 입사일을 조회하기
-- 이름순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME ASC;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 입사일을 조회하기
-- 이름순으로 내림차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY FIRST_NAME DESC;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 연봉, 입사일을 조회하기
-- 연봉순으로 오름차순 정렬하기 (ASC는 생략가능)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY SALARY*48;         -- 연산식을 사용해서 정렬

-- 60번 부서에 소속된 사원들의 아이디, 이름, 급여, 연봉, 입사일을 조회하기
-- 연봉순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY 4 ASC;            -- 컬럼의 순번을 사용해서 정렬하기(select절의 4번째 컬럼 : salary*48, db에서의 컬럼순번이 아님)

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY*48 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60
ORDER BY ANNUAL_SALARY ASC;    -- 컬럼의 별칭을 사용해서 정렬하기(가장 깔끔 / 추천 방법)

-- 50번 부서에 소속된 직원 중에서 연봉이 250000달러 이상인
-- 직원들의 아이디, 이름, 급여, 연봉, 입사일을 조회하기
-- 연봉순으로 오름차순 정렬하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 4 * 12 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND SALARY * 4 * 12 >= 250000
ORDER BY ANNUAL_SALARY ASC;

-- 실행 오류
-- SELECT절에서 정의한 별칭을 WHERE절에서 사용할 수 없다.
-- SELECT절에서 정의한 별칭은 ORDER BY절에서만 사용할 수 있다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 4 * 12 AS ANNUAL_SALARY, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
AND ANNUAL_SALARY >= 250000
ORDER BY ANNUAL_SALARY ASC;

-- 50번 부서에서 근무하는 직원들의 이름, 급여를 조회하고
-- 급여순으로 내림차순 정렬하고, 만약 급여가 동일하면 이름순으로 오름차순 정렬하기
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY DESC, FIRST_NAME ASC;

-- 단일행 함수 중 문자함수 사용하기
-- 사원의 아이디, 이름을 조회하기(이름을 대문자로 표시)
SELECT EMPLOYEE_ID
, UPPER(FIRST_NAME)
, LOWER(FIRST_NAME)
, LENGTH(FIRST_NAME)
, CONCAT(FIRST_NAME, LAST_NAME)
, LPAD(FIRST_NAME, 10, '#')
, RPAD(FIRST_NAME, 10, '@')
FROM EMPLOYEES;