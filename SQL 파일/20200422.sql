-- 데이터 그룹의 생성
-- group by 절을 사용하면 테이블의 정보를 작은 그룹으로 나누어서
-- 그룹당 데이터를 집계할 수 있다.
-- 소속부서별 직원수를 조회하기. 단, 소속부서가 지정되지 않은 직원은 제외한다.
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- 관리자별 자신이 관리하는 직원수를 조회하기. 단, 관리자가 지정되지 않은 직원은 제외
-- 관리자아이디, 직원수를 조회한다.
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

-- 부서별 직원수를 조회하기. 단, 부서가 지정되지 않은 사원은 제외
-- 부서이름, 직원수를 조회하기
SELECT B.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.MANAGER_ID IS NOT NULL
AND A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_NAME;

-- 도시별 직원수를 조회하기
-- 도시명, 직원수
SELECT C.CITY, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
GROUP BY C.CITY;

-- 도시별, 부서별 직원수를 조회하기
-- 도시명, 부서명, 직원수를 조회한다.
SELECT C.CITY, B.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
AND B.LOCATION_ID = C.LOCATION_ID
GROUP BY C.CITY, B.DEPARTMENT_NAME
ORDER BY 1, 2;

-- 급여별 사원수를 조회하기
-- 급여별 사원수를 조회했을 때 , 직원수가 10명 이상인 급여별 빅원수 정보만 조회하기
SELECT TRUNC(SALARY, -3)SALARY, COUNT(*)
FROM EMPLOYEES
GROUP BY TRUNC(SALARY, -3)
HAVING COUNT(*) >= 10
ORDER BY SALARY;

-- having 절 사용해서 그룹결과 제한하기
-- 급여별 사원수를 조회했을 때 , 직원수가 10명 이상인 급여별 빅원수 정보만 조회하기
SELECT TRUNC(SALARY, -3)SALARY, COUNT(*)
FROM EMPLOYEES
GROUP BY TRUNC(SALARY, -3)
HAVING COUNT(*) >= 10
ORDER BY SALARY;

-- 부서별 평균급여 조회하기
-- 부서명과 부서별 평균급여를 조회한다. 평균급여는 소숫점이하는 버린다.
-- 평균급여가 5000달러 미만인 부서만 조회하기
SELECT B.DEPARTMENT_NAME, TRUNC(AVG(SALARY)) AVG_SALARY
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY B.DEPARTMENT_NAME
HAVING AVG(SALARY) < 5000
ORDER BY B.DEPARTMENT_NAME;

-- 그룹함수의 중첩
-- 부서별로 직원수를 조회했을 떄 가장 많은 사원수는 몇명인가?
SELECT MAX(COUNT(*))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 급여 등급별 사원수, 급여 등급별 평균급여를 조회하기
-- 급여 등급과 사원수, 평균급여를 표시한다.
SELECT B.GRA, COUNT(*), TRUNC(AVG(SALARY))
FROM EMPLOYEES A, JOB_GRADES B
WHERE A.SALARY >= B.LOWEST_SAL
AND A.SALARY <= B.HIGHEST_SAL
GROUP BY B.GRA
ORDER BY 1;

-- 서브쿼리
-- 이름이 Neena인 사원과 같은 해에 입사한 사원들의 이름, 입사일을 조회하기
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE FIRST_NAME = 'Neena');

-- Stephen과 같은 직종의 일을 하는 직원들의 아이디와 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Stephen');

SELECT JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Stephen';

-- Mozhe와 같은 직종의 일을 하고, 
-- Mozhe의 급여보다 급여를 많이 받는 직원의 아이디와 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Mozhe')
AND SALARY > (SELECT SALARY
              FROM EMPLOYEES
              WHERE FIRST_NAME = 'Mozhe');

SELECT JOB_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Mozhe';

SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Mozhe';

-- 전체 직원의 평균급여보다 적은 급여를 받는 직원들의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT TRUNC(AVG(SALARY))
                FROM EMPLOYEES);

SELECT TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- 가장 적은 급여를 받는 직원들의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEES);
                
-- 부서별 사원수를 조회했을 때 사원수가 가장 많은 부서의 아이디와 사원수를 조회하기
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID);
         
-- WITH 절을 사용해서 중복 실행되는 쿼리작업을 한 번만 실행되게 할 수 있다.
-- 쿼리의 실행성능을 향상시킨다.
WITH DEPTCNT
AS (SELECT DEPARTMENT_ID, COUNT(*) CNT
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID)   
SELECT DEPARTMENT_ID, CNT
FROM DEPTCNT
WHERE CNT = (SELECT MAX(CNT)
             FROM DEPTCNT);
             
-- 다중행 서브쿼리
-- 50번 부서에 근무했던 적이 있는 사원의 아이디, 이름, 직종, 소속부서아이디를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID
                     FROM JOB_HISTORY
                     WHERE DEPARTMENT_ID = 50);
-- 다중행 서브쿼리 대신 조인을 활용해서 조회하기
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.JOB_ID CURRENT_ID, A.DEPARTMENT_ID CURRENT_DEPT, B.JOB_ID OLD_ID, B.DEPARTMENT_ID OLD_DEPT
FROM EMPLOYEES A, JOB_HISTORY B
WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID
AND B.DEPARTMENT_ID = 50;

-- Seattle에 위치하고 있는 부서의 관리자 직원아이디, 이름을 조회하기
-- 1.Seattle의 LOCATION_ID를 조회하기
-- 2. 그 LOCATION_ID를 가지고 있는 부서의 MANAGER_ID를 조회하기
-- 3. 그 MANAGER_ID에 해당하는 직원아이디, 이름을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID
                      FROM DEPARTMENTS
                      WHERE LOCATION_ID = (SELECT LOCATION_ID
                                           FROM LOCATIONS
                                           WHERE CITY = 'Seattle'));
                                           
SELECT A.EMPLOYEE_ID, A.FIRST_NAME
FROM EMPLOYEES A, DEPARTMENTS B, LOCATIONS C
WHERE A.EMPLOYEE_ID = B.MANAGER_ID
AND B.LOCATION_ID = C.LOCATION_ID
AND C.CITY = 'Seattle';