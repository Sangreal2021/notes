SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;

-- 직업별(job) 급여합계 중 급여합계가 1000 이상인 직업
SELECT job, sum(sal) FROM emp GROUP BY job HAVING sum(sal) >= 1000;

SELECT sum(comm), count(comm) FROM emp;

-- 사원번호 7000 ~ 7700번의 부서별 급여합계
SELECT deptno, sum(sal) FROM emp WHERE empno BETWEEN 7000 AND 7700 GROUP BY deptno;

-- substr(문자열, m, n) : 문자열을 m번째 위치부터 n개를 잘라서 출력.(인덱스 규칙 X)
SELECT ascii('a'), substr('ABC',1,2), length('A BC'), ltrim(' ABC'), length(ltrim(' ABC')) FROM dual;

-- 날짜
SELECT sysdate, extract(YEAR FROM sysdate), to_char(sysdate, 'YYYYMMDD') FROM dual;

-- 숫자형 함수
SELECT abs(-1), sign(10), mod(4,2), ceil(10.9), floor(10.1), round(10.222, 1) FROM dual;

-- DECODE, CASE 문
SELECT decode(empno, 7369, 'true', 'false') FROM emp;

select (CASE
			WHEN empno=7369 THEN 'A'
			WHEN empno=7900 THEN 'B'
		ELSE 'C'
	END) AS cond
FROM emp;

-- ROWNUM(mysql의 limit), ROWID
SELECT * FROM emp WHERE rownum <= 1;

SELECT * FROM (SELECT rownum list, ename FROM emp) WHERE rownum <= 5;

SELECT * FROM (SELECT rownum list, ename FROM emp) WHERE list BETWEEN 5 AND 10;

SELECT rowid, empno FROM emp;

-- WITH 구문
WITH viewData AS
	(SELECT * FROM emp
		UNION all
	 SELECT * FROM emp
	)
	SELECT * FROM viewData WHERE empno=7900;
	
WITH Temp AS
	(SELECT * FROM emp WHERE deptno=30)
SELECT * FROM Temp;


-- DCL
-- 1. GRANT
--GRANT '권한' ON '테이블명' TO '사용자';

-- 2. REVOKE : 부여된 권한 취소
-- REVOKE '권한' ON '테이블명' FROM '사용자';





























