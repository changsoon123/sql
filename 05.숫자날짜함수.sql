
--숫자함수
--ROUND(반올림)
--원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능
SELECT
    ROUND(3.1415,3), ROUND(45.923,0), ROUND(45.923,-1)
FROM dual;

--TRUNC(절사)
--정해진 소수점 자리수까지 잘라낸다.

SELECT
    TRUNC(3.1415, 3), TRUNC(45.923,0), TRUNC(45.923, -1)
FROM dual;

--ABS(절대값)
SELECT
    ABS(-40) , ABS(40)
FROM dual;

--CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

--MOD(나머지)
SELECT 10 / 4, MOD(10, 4)
FROM dual;

--날짜 함수 (환경 설정 들어가서 NLS 검색하면 시간 설정 변경 가능)
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

--날짜도 연산이 가능하다.
SELECT sysdate + 1 FROM dual;

--날짜 연산을 하게 되면 일수로 계산됨
SELECT first_name, sysdate - hire_date
FROM employees;


SELECT first_name, hire_date, 
    (sysdate - hire_date) / 7 AS week
FROM employees;

SELECT first_name, hire_date, 
    (sysdate - hire_date) / 365 AS year
FROM employees;
--WHERE year >= 20;

--날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual; --몇시에 따라 반올림
SELECT ROUND(sysdate, 'year') FROM dual; --연 기준으로 6월 말부터 반올림
SELECT ROUND(sysdate, 'month') FROM dual; --월 기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 주단위로 반올림(일요일이 기준 ,서양 기준)

SELECT TRUNC(sysdate) FROM dual; --몇시에 따라 절사
SELECT TRUNC(sysdate, 'year') FROM dual; --연 기준으로 6월 말부터 반올림
SELECT TRUNC(sysdate, 'month') FROM dual; --월 기준으로 반올림
SELECT TRUNC(sysdate, 'day') FROM dual; -- 주단위로 반올림(일요일이 기준 ,서양 기준)
