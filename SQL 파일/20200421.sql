-- 셀프조인(자체조인)
-- 101번 사원의 이름, 직종, 자신의 상사이름을 조회하기
SELECT EMP.FIRST_NAME, EMP.JOB_ID "직원의 직종", MGR.FIRST_NAME "상사의 이름"
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.EMPLOYEE_ID = 101
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID;

-- 60번 부서에 근무중인 사원의 아이디, 이름, 사원의 직종, 상사의 이름, 상사의 직종,
-- 직원의 소속부서아이디, 직원의 소속부서명, 부서관리자 아이디, 부서관리자 이름을 조회하기
SELECT 직원.EMPLOYEE_ID, 
직원.FIRST_NAME, 
직원.JOB_ID "직원의 직종", 
상사.FIRST_NAME "상사의 이름",
상사.JOB_ID "상사의 직종",
부서.DEPARTMENT_ID "소속부서 아이디",
부서.DEPARTMENT_NAME "소속부서 이름",
부서.MANAGER_ID "관리자 아이디",
부서관리자.FIRST_NAME "부서의 관리자 이름"
FROM EMPLOYEES 직원, EMPLOYEES 상사, DEPARTMENTS 부서, EMPLOYEES 부서관리자
WHERE 직원.DEPARTMENT_ID = 60
AND 직원.MANAGER_ID = 상사.EMPLOYEE_ID         -- 직원과 상사간의 조인조건
AND 직원.DEPARTMENT_ID = 부서.DEPARTMENT_ID   -- 직원과 소속부서간의 조인조건
AND 부서.MANAGER_ID = 부서관리자.EMPLOYEE_ID;  -- 부서와 부서관리자간의 조인조건

-- 포괄조인
-- 부서아이디, 부서명, 부서관리자아이디, 부서관리자 이름 조회하기
SELECT A.DEPARTMENT_ID, A.DEPARTMENT_NAME, A.MANAGER_ID, B.FIRST_NAME
FROM DEPARTMENTS A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+)
ORDER BY A.DEPARTMENT_ID;

-- 모든 직원의 이름, 급여, 직종아이디, 소속부서명을 조회하기
SELECT *
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID(+)
ORDER BY A.EMPLOYEE_ID;

-- 다중행 함수 사용하기
-- EMPLOYEES의 모든 행의 개수 조회하기
SELECT COUNT(*)
FROM EMPLOYEES;

-- 50번 부서에서 일하는 직원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- 커미션을 받는 직원의 수를 조회하기
SELECT COUNT(COMMISSION_PCT)    -- 컬럼을 지정하면 해당 컬럼의 값이 NULL이 아닌 것만 카운트한다.
FROM EMPLOYEES;

-- 커미션을 받는 직원의 수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 직원들 중에서 가장 많은 급여를 받는 직원의 급여를 조회하기
SELECT MAX(SALARY)
FROM EMPLOYEES;

-- 최고급여를 받는 사람의 이름과 최고급여를 조회하기(오류)
SELECT FIRST_NAME, MAX(SALARY)  -- 오류 : 그룹함수와 그룹함수가 아닌 표현식을 같이 사용할 수 없다.
FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
                FROM EMPLOYEES);
                
-- 조회된 행의 개수를 구하기
-- COUNT(*) : 조회된 모든 행의 개수를 반환한다.
-- COUNT(컬럼명) : 해당 컬럼의 값이 NULL이 아닌 행의 개수를 반환한다.
-- COUNT(DISTINCT 컬럼명) : 해당 컬럼의 값에 대해 중복된 값은 1번만 카운트해서 행의 개수를 반환한다.
SELECT COUNT(*)
FROM EMPLOYEES;     -- 107

SELECT COUNT(JOB_ID)
FROM EMPLOYEES;     -- 107

SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;     -- 19

SELECT COUNT(DISTINCT TO_CHAR(HIRE_DATE, 'YYYY'))
FROM EMPLOYEES;

SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEES;

-- 조회된 행의 특정 컬럼에 대한 합계를 구하기
-- SUM(컬럼명) : 해당 컬럼의 값 중에서 NULL을 제외한 값들의 합계를 반환한다.
SELECT SUM(SALARY)      -- 전체 사원들의 급여 총액
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT)      -- 전체 사원들의 커미션에 대한 합계
FROM EMPLOYEES;                 -- 커미션 값이 NULL인 것은 계산에 포함되지 않음

-- 조회된 행의 특정 컬럼에 대한 평균을 구하기
-- AVG(컬럼명) : 해당 컬럼의 값 중에서 NULL을 제외한 값을 가진 행들에 대한 평균값을 반환한다.
SELECT TRUNC(AVG(SALARY))       -- 전체 직원들의 급여 평균
FROM EMPLOYEES;

SELECT TRUNC(AVG(COMMISSION_PCT), 2)
FROM EMPLOYEES;

-- 조회된 행의 특정 컬럼에 대한 최대값, 최소값 구하기
-- MIN(컬럼명) : 해당 컬럼의 값 중에서 NULL을 제외한 가장 작은 값을 반환한다.
-- MAX(컬럼명) : 해당 컬럼의 값 중에서 NULL을 제외한 가장 큰 값을 반환한다.
SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES;

SELECT MIN(COMMISSION_PCT), MAX(COMMISSION_PCT)
FROM EMPLOYEES;

-- GROUP BY와 그룹함수를 사용해서 데이터 집계하기
-- 직종별 직원수를 조회하기
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 입사년도별 사원수
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1;