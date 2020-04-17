SELECT FIRST_NAME || LAST_NAME
FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES;

SELECT SUBSTR('940625', 3, 2)
FROM EMPLOYEES;

SELECT *
FROM DUAL;

SELECT INSTR('010-4899-0653', '-')
FROM DUAL;

SELECT STREET_ADDRESS, SUBSTR(STREET_ADDRESS, 1, INSTR(STREET_ADDRESS, ' ')-1)
FROM LOCATIONS;

SELECT REPLACE(FIRST_NAME, 'a', 'A')
FROM EMPLOYEES;

-- 숫자함수
-- 반올림하기
SELECT
ROUND(1265.737, 2) "2",     -- 소수점 2자리로 반올림
ROUND(1265.737, 1) "1",     -- 소수점 1자리로 반올림
ROUND(1265.737, 0) "0",     -- 일의 자리로 반올림
ROUND(1265.737) " ",        -- 일의 자리로 반올림
ROUND(1265.737, -1) "-1",   -- 십의 자리로 반올림
ROUND(1265.737, -2) "-2"    -- 백의 자리로 반올림
FROM DUAL;

-- 숫자값 버리기
SELECT
TRUNC(1265.737, 2) "2",     -- 소수점 2자리까지만 남기고 버리기
TRUNC(1265.737, 1) "1",     -- 소수점 1자리까지만 남기고 버리기
TRUNC(1265.737, 0) "0",     -- 일의 자리까지만 남기고 버리기
TRUNC(1265.737) " ",        -- 일의 자리까지만 남기고 버리기
TRUNC(1265.737, -1) "-1",   -- 십의 자리까지만 남기고 버리기
TRUNC(1265.737, -2) "-2"    -- 백의 자리까지만 남기고 버리기
FROM DUAL;

-- 직원들의 시급을 조회하기
-- 직원아이디, 이름, 직종아이디, 급여, 시급
-- 시급 = 급여 * 환율 / (5 * 8) 시급은 원단위까지만 표시한다.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, TRUNC(SALARY * 1220.40 / (5 * 8)) AS PAY_FOR_HOUR
FROM EMPLOYEES
ORDER BY PAY_FOR_HOUR DESC;

-- 나머지값 구하기
SELECT MOD(32, 5)
FROM DUAL;

-- 날짜 함수
-- 현재 날짜와 시간정보 조호하기
SELECT SYSDATE
FROM DUAL;

-- 직원아이디, 직원명, 입사일, 오늘까지 근무한 날짜 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(SYSDATE - HIRE_DATE)
FROM EMPLOYEES;

-- 오늘, 3일전, 1주일전, 1개월전, 3개월전
SELECT SYSDATE "지금", SYSDATE - 3 "3일 전", SYSDATE - 7 "1주일 전", SYSDATE - 30 "1달 전"
FROM DUAL;

-- 60번 부서에 소속된 사원들의 아이디, 이름, 입사일, 근무한 개월수를 조회하기
-- 개월수는 소숫점부분은 버린다.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 오늘부터 3개월 후의 날짜, 3개월 이전의 날짜는?
SELECT ADD_MONTHS(SYSDATE, 3), ADD_MONTHS(SYSDATE, -3)
FROM DUAL;

-- 날짜 반올림하기, 버리기
SELECT SYSDATE, ROUND(SYSDATE), TRUNC(SYSDATE)
FROM DUAL;

-- 두 날짜간의 일 수 계산하기
-- 현재 날짜에 대해 TRUNC() 함수로 시분초를 전부 0으로 만든 후 날짜 연산
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SYSDATE - HIRE_DATE, TRUNC(SYSDATE) - HIRE_DATE
FROM EMPLOYEES;

-- 이번 달의 마지막 날 조회하기
SELECT LAST_DAY(TRUNC(SYSDATE))
FROM DUAL;

-- 오늘을 기준으로 다음 번 토요일
SELECT NEXT_DAY(TRUNC(SYSDATE), 7)
FROM DUAL;

-- 오늘은 기준으로 다음 번 금요일
SELECT NEXT_DAY(TRUNC(SYSDATE), 6)
FROM DUAL;

-- 오늘을 기준으로 다음 번 일요일
SELECT NEXT_DAY(TRUNC(SYSDATE), 1)
FROM DUAL;

-- 변환 함수
-- 날짜를 문자로 변환하기
SELECT TO_CHAR(SYSDATE, 'YYYY') 년
, TO_CHAR(SYSDATE, 'MM') 월
, TO_CHAR(SYSDATE, 'DD') 일
, TO_CHAR(SYSDATE, 'DAY') 요일
, TO_CHAR(SYSDATE, 'AM') "오전/오후"
, TO_CHAR(SYSDATE, 'HH') 시간
, TO_CHAR(SYSDATE, 'HH24') 시간
, TO_CHAR(SYSDATE, 'MI') 분
, TO_CHAR(SYSDATE, 'SS') 초
FROM DUAL;

-- 2003년도에 입사한 사원의 아이디, 이름, 입사한 달을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, TO_CHAR(HIRE_DATE, 'MM')
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003';

-- 입사일이 오늘 날짜와 같은 날짜에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'MMDD') = TO_CHAR(SYSDATE, 'MMDD');

-- 특정 날짜를 나타내는 문자를 날짜(DATE 타입)로 변환하기
SELECT TO_DATE('2018-12-31', 'YYYY-MM-DD') + 1000
FROM DUAL;

-- 특정 날짜를 나타내는 문자를 날짜로 변환해서 오늘까지의 일수, 개월수를 조회하기
SELECT TRUNC(SYSDATE - TO_DATE('2016-04-17', 'YYYY-MM-DD')),
MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('1994-06-25', 'YYYY-MM-DD'))
FROM DUAL;

-- 2005-01-01 ~ 2005-03-31 사이에 입사한 사원의 아이디, 이름, 입사일, 직종아이디 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('2005-01-01', 'YYYY-MM-DD')
AND HIRE_DATE <= TO_DATE('2005-03-31', 'YYYY-MM-DD')
ORDER BY HIRE_DATE;

-- 2003년에 입사한 직원의 아이디, 이름, 입사일 조회
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2003'
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= TO_DATE('20030101', 'YYYYMMDD')
AND HIRE_DATE <= TO_DATE('20040101', 'YYYYMMDD')
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '20030101'
AND HIRE_DATE <= '20040101'
ORDER BY HIRE_DATE;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2003/01/01'
AND HIRE_DATE <= '2004/01/01'
ORDER BY HIRE_DATE;

-- 숫자를 천단위마다 구분자가 포함된 텍스트로 변환해서 조회하기
SELECT TO_CHAR(10000, '999,999')
FROM DUAL;

-- 숫자를 소수점 2자리에서 반올림한 후 텍스트로 변환해서 조회하기
SELECT TO_CHAR(123.4567, '000.00')
FROM DUAL;

-- 문자를 숫자로 변환해서 사용하기
-- 급여가 15000달러 이상인 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= '15000';

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= TO_NUMBER('15000');

-- TO_NUMBER() 함수를 반드시 사용해야 하는 경우
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= TO_NUMBER('15,000', '99,999');

-- NVL() 함수
SELECT NVL(10, 1)   -- 10이 최종값이다.
    , NVL(NULL, 1)  -- 1이 최종값이다.
FROM DUAL;

-- 직원아이디, 이름, 급여, 커미션을 조회하기
-- 커미션값이 NULL인 경우 0으로 조회한다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- 직원아이디, 이름, 실급여를 조회하기
-- 실급여 = 급여 + 급여 * 커미션이다.
SELECT EMPLOYEE_ID, FIRST_NAME
, SALARY + SALARY * COMMISSION_PCT SAL1
, SALARY + SALARY * NVL(COMMISSION_PCT, 0) SAL2
FROM EMPLOYEES;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 NULL인 경우 '지정된 관리자 없음'으로 조회하기
SELECT DEPARTMENT_ID
, DEPARTMENT_NAME
, NVL(TO_CHAR(MANAGER_ID), '지정된 관리자 없음')
FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID;

-- 부서아이디, 부서명, 해당부서 관리자 아이디를 조회하기
-- 관리자 아이디가 NULL인 경우 100직원을 관리자로 지정한다.
SELECT DEPARTMENT_ID
, DEPARTMENT_NAME
, NVL(MANAGER_ID, 100)
FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID;

-- NVL2() 함수 사용하기
SELECT NVL2(10, 1, 0)       -- 최종값은 1이다.
,NVL2(NULL, 1, 0)           -- 최종값은 0이다.
FROM DUAL;

-- 직원아이디, 이름, 커미션 수령여부를 'YES', 'NO'로 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, NVL2(COMMISSION_PCT, 'YES', 'NO') 수령여부
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~ WHEN
-- 직원아이디, 이름, 급여, 급여등급 조회하기
-- 급여등급은
-- 20000달러 이상   A등급
-- 10000달러 이상   B등급
-- 5000달러 이상    C등급
-- 그 외 
SELECT
EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
WHEN SALARY >= 20000 THEN 'A'
WHEN SALARY >= 10000 THEN 'B'
WHEN SALARY >= 5000 THEN 'C'
ELSE 'D'
END SALARY_GRADE
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- CASE ~ WHEN
-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 급여등급은
-- 20000달러 이상   10%인상
-- 10000달러 이상   15%인상
-- 5000달러 이상    20%인상
-- 그외            25% 인상
SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
WHEN SALARY >= 20000 THEN SALARY * 1.1
WHEN SALARY >= 10000 THEN SALARY * 1.15
WHEN SALARY >= 5000 THEN SALARY * 1.2
ELSE SALARY * 1.25
END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- 직원아이디, 이름, 급여, 인상된 급여를 조회하기
-- 인상률은
-- 소속부서가 50번 부서면 10% 인상
-- 소속부서가 80번 부서면 15% 인상
-- 그 외 부서는 5% 인상
SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE
    WHEN DEPARTMENT_ID = 50 THEN SALARY * 1.1
    WHEN DEPARTMENT_ID = 80 THEN SALARY * 1.15
    ELSE SALARY * 1.05
    END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID
, FIRST_NAME
, SALARY
, CASE DEPARTMENT_ID
    WHEN 50 THEN SALARY * 1.1
    WHEN 80 THEN SALARY * 1.15
    ELSE SALARY * 1.05
    END AS INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID
    , FIRST_NAME
    , SALARY
    , DECODE(DEPARTMENT_ID, 50, SALARY * 1.1,
                            80, SALARY * 1.15,
                            SALARY * 1.05) INCREASED_SALARY
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;

-- DECODE() 함수를 사용해서 조회하기
-- 직원아이디, 이름, 급여, 인상된 급여 조회하기
-- 급여등급은
-- 20000달러 이상   A
-- 10000달러 이상   B
-- 5000달러 이상    C
-- 그외             D
SELECT EMPLOYEE_ID
    , FIRST_NAME
    , SALARY
    , DECODE(TRUNC(SALARY, -4), 20000, 'A'
                              , 10000, 'B'
                              , DECODE(TRUNC(SALARY/5000) * 5000, 5000, 'C'
                                                                , 'D')) SALARY_GRADE
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;