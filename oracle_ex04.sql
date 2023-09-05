-- 20230905
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;

SELECT max(A), max(B) FROM
	(
		SELECT 'Free' A, '' B FROM dual UNION ALL
		SELECT '' A, 'Dom' B FROM dual
	);
	
-- EQUI 조인
SELECT * FROM emp, dept
WHERE emp.deptno = dept.DEPTNO;

SELECT	* FROM emp, dept
WHERE	emp.deptno = dept.DEPTNO
AND		emp.ename LIKE 'S%' ORDER BY ename;

-- INNER 조인
SELECT		* FROM emp
INNER JOIN	dept
ON			emp.deptno = dept.deptno;

SELECT		* FROM emp
INNER JOIN	dept
ON			emp.deptno = dept.deptno
AND			emp.ename LIKE 'A%'
ORDER BY	ename;

-- HASH 조인
SELECT	* FROM emp, dept
WHERE	emp.deptno = dept.deptno;

-- INTERSECT 연산
SELECT		deptno FROM emp
INTERSECT
SELECT		deptno FROM dept;

-- OUTER 조인
SELECT	* FROM dept, emp
WHERE	emp.deptno (+)= dept.deptno;

-- 1) LEFT OUTER JOIN
SELECT			* FROM dept
LEFT OUTER JOIN	emp
ON				emp.deptno = dept.deptno;

-- 2) RIGHT OUTER JOIN
SELECT				* FROM dept
RIGHT OUTER JOIN	emp
ON					emp.deptno = dept.deptno;

-- UNION 연산 : 중복 제거 O
SELECT deptno FROM emp
UNION
SELECT deptno FROM emp;
-- UNION ALL 연산 : 중복 제거 X
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM emp;

-- MINUS 연산 : 먼저 쓴 select문에는 있고, 뒤에 쓰는 select문에는 없는 집합.
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp;

-- CONNECT BY : 계층형 조회
-- 1) LPAD(' ', 4) : 왼쪽 공백 4칸을 출력
SELECT		LEVEL, lpad(' ', 4 * (LEVEL-1)) || empno AS lv, mgr, CONNECT_by_isleaf
FROM		emp
START WITH	mgr IS NULL
CONNECT BY	PRIOR empno=mgr;

-- SUBQUERY : select문 내에 다시 select문을 사용하는 SQL
SELECT	* FROM emp
WHERE	deptno = (SELECT deptno FROM dept WHERE deptno=10);
-- (1) 인라인 뷰
SELECT	* FROM (SELECT rownum num, ename FROM emp) a
WHERE	num < 5;

-- (2) 다중 행(Multi row) 서브쿼리
-- 	1) IN : 여러 행 중 하나만 참이 되어도 참!
--	아래는 급여가 2000보다 큰 사원번호 조회 후 emp, empno를 조회.
SELECT	ename, dname, sal FROM emp, dept
WHERE	emp.deptno=dept.deptno
AND		emp.empno
IN		(SELECT empno FROM emp WHERE sal > 2000);

-- 	2) ALL : 메인쿼리와 서브쿼리의 결과가 모두 동일하면 참!
--	아래는 DEPTNO가 20, 30 이하면 조회되는 쿼리문
SELECT	* FROM emp
WHERE	deptno <= ALL (20, 30);

--	3) EXISTS : 존재 여부 확인 -> 참 or 거짓 반환
--	급여가 2000 이상이 있으면 참이 반환, 없으면 거짓이 반환.
--	-> 2000이상 존재하므로 출력됨. 20000이면 아무것도 출력 X
SELECT	ename, dname, sal FROM emp, dept
WHERE	emp.deptno=dept.deptno
AND		EXISTS (SELECT 1 FROM emp WHERE sal > 2000);





















