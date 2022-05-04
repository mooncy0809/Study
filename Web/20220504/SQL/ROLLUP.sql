DROP TABLE rollup1;
CREATE TABLE rollup1(
  deptno NUMBER(3),
  job      VARCHAR(10),
  sal      NUMBER(5)
);

INSERT INTO rollup1(deptno, job, sal) VALUES(10, 'CLERK', 1300);
INSERT INTO rollup1(deptno, job, sal) VALUES(10, 'MANAGER', 2450);
INSERT INTO rollup1(deptno, job, sal) VALUES(20, 'CLERK', 1900);
INSERT INTO rollup1(deptno, job, sal) VALUES(20, 'ANALYST', 6000);
INSERT INTO rollup1(deptno, job, sal) VALUES(20, 'MANAGER', 2975);
COMMIT;

SELECT * FROM rollup1;
    DEPTNO JOB               SAL
---------- ---------- ----------
        10 CLERK            1300
        10 MANAGER          2450
        20 CLERK            1900
        20 ANALYST          6000
        20 MANAGER          2975

 SELECT deptno, job, sum(sal)  -- ERROR
 FROM rollup1
 GROUP BY ROLLUP(deptno);
 
SELECT deptno, job, sum(sal)
FROM rollup1
GROUP BY ROLLUP(deptno, job);

    DEPTNO JOB            SUM(SAL)
---------- ---------- ---------------
        10 CLERK             1300
        10 MANAGER       2450
        10 null                3750 <- deptno 그룹화
        20 CLERK            1900
        20 ANALYST         6000
        20 MANAGER       2975
        20 null                10875 <- job 그룹화
      null null                14625 <- DEPTNO, JOB 연동 그룹화
