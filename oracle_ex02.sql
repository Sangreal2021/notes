SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;

SELECT deptno, mgr, avg(sal) FROM emp GROUP BY deptno, mgr;

SELECT job, sum(sal)
FROM emp
GROUP BY job
HAVING sum(sal) >=1000;

SELECT deptno, sum(sal) FROM emp
WHERE empno BETWEEN 7000 AND 7600
GROUP BY deptno;

SELECT ename FROM emp WHERE deptno=10;

SELECT ename, sal, hiredate FROM emp;

SELECT deptno AS "부서번호", dname AS "부서명", loc AS "지역" FROM dept;

SELECT DISTINCT job FROM emp;
SELECT DISTINCT ename, job FROM emp;

SELECT empno, ename, deptno FROM emp WHERE deptno=10;

SELECT empno, ename, job, sal FROM emp WHERE ename='MILLER';
SELECT empno, ename, job, sal FROM emp WHERE deptno=10 AND job='MANAGER';
SELECT empno, ename, job, deptno FROM emp WHERE NOT deptno=10;
SELECT empno, ename, job, sal FROM emp WHERE sal BETWEEN 1000 AND 3000;
SELECT empno, ename, job, sal FROM emp WHERE empno IN (7844, 7654, 7521, 1000); -- 4개 중 포함되는 것 출력
SELECT empno, ename, job, sal FROM emp WHERE ename LIKE 'S%'; -- 앞글자가 S로 시작
SELECT empno, ename, job, sal FROM emp WHERE ename LIKE '%S'; -- 뒷글자가 S로 끝나는
SELECT empno, ename, job, sal FROM emp WHERE ename LIKE '%S%'; -- S가 포함된
SELECT empno, ename, job, sal FROM emp WHERE ename LIKE '_A%'; -- 두번째 글자가 A
SELECT empno, ename, job, sal FROM emp WHERE ename LIKE '____'; -- 4자리수 이름
SELECT empno, ename, job, sal FROM emp WHERE ename NOT LIKE '%A%'; -- A가 포함되지 않은

SELECT empno, ename, job, sal FROM emp WHERE sal >= 2500 ORDER BY sal DESC;

SELECT count(comm) FROM emp;

SELECT deptno, mgr, avg(sal) FROM emp GROUP BY deptno, mgr;
















