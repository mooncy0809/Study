-- 1. Grouping 문제 1
DROP TABLE dept1;
CREATE TABLE dept1(
  deptno     NUMBER(3),
  job        VARCHAR(15),
  sales      VARCHAR(10),
  cnt        NUMBER(3)
);

INSERT INTO dept1(deptno, job, sales, cnt) VALUES(2, '영업2팀', 1000, 2);
INSERT INTO dept1(deptno, job, sales, cnt) VALUES(2, '영업1팀', 1000, 1);
INSERT INTO dept1(deptno, job, sales, cnt) VALUES(1, '영업2팀', 2000, 2);
INSERT INTO dept1(deptno, job, sales, cnt) VALUES(1, '영업1팀', 3000, 1);

SELECT deptno, job, sales, cnt FROM dept1;
    DEPTNO JOB             SALES             CNT
---------- --------------- ---------- ----------
         2 영업2팀         1000                2
         2 영업1팀         1000                1
         1 영업2팀         2000                2
         1 영업1팀         3000                1

commit;

-- Error: SQL 오류: ORA-00979: GROUP BY 표현식이 아닙니다.
-- 기본적으로 GROUP BY에 명시된 컬럼만 SELECT 가능
SELECT deptno, job, sales, cnt FROM dept1 GROUP BY deptno;

SELECT deptno FROM dept1 GROUP BY deptno;
    DEPTNO
----------
         1
         2

-- 중복 출력 안됨, 대분류, 중분류 실행.
SELECT deptno,job FROM dept1 GROUP BY deptno, job;
    DEPTNO JOB            
---------- ---------------
         1 영업1팀        
         1 영업2팀        
         2 영업2팀        
         2 영업1팀     
         
-- 어디에도 속하지 않는 그룹, deptno 별 그룹, job 별 그룹, deptno + job이 결합된 그룹
SELECT deptno,job FROM dept1 GROUP BY CUBE(deptno, job);
    DEPTNO JOB            
---------- ---------------
      null nulll          <- record                          
      null 영업1팀        
      null 영업2팀        
         1 null               
         1 영업1팀        
         1 영업2팀        
         2 null               
         2 영업1팀        
         2 영업2팀      
         
-- SQL 오류: ORA-00979: GROUP BY 표현식이 아닙니다.
SELECT deptno,job FROM dept1 GROUP BY GROUPING SETS(deptno);
-- SQL 오류: ORA-00979: GROUP BY 표현식이 아닙니다.
SELECT deptno,job FROM dept1 GROUP BY GROUPING SETS(());

-- 각각의 컬럼별 그룹
SELECT deptno,job FROM dept1 GROUP BY GROUPING SETS(deptno, job);
    DEPTNO JOB            
---------- ---------------
     null  영업1팀        
     null  영업2팀        
         2 null               
         1 null                              

SELECT deptno,job FROM dept1 GROUP BY GROUPING SETS(deptno, job, (deptno, job));
    DEPTNO JOB            
---------- ---------------
         1 영업1팀        
         2 영업1팀        
         1 영업2팀        
         2 영업2팀        
         2 null               
         1 null                
      null 영업1팀        
      null 영업2팀     

-- CUBE와 결과 동일           
SELECT deptno,job 
FROM dept1 
GROUP BY GROUPING SETS(deptno, job, (deptno, job), ());
      null nulll          <- record                          
      null 영업1팀        
      null 영업2팀        
         1 null               
         1 영업1팀        
         1 영업2팀        
         2 null               
         2 영업1팀        
         2 영업2팀 

-- GROUP BY를 사용하고 있을 때 그룹 함수는 SELECT에 선언가능
-- 예) 각 사원의 매출액, 부서별 매출액, 월별 매출액, 년도 매출액등
SELECT deptno,sum(sales) FROM dept1 GROUP BY deptno;
    DEPTNO SUM(SALES)
---------- ----------
         1       5000
         2       2000

-- 대분류, 중분류의 표현         
SELECT deptno,job,sum(sales) FROM dept1 GROUP BY deptno, job;    
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
         1 영업1팀               3000
         1 영업2팀               2000
         2 영업2팀               1000
         2 영업1팀               1000
         
SELECT deptno,job,sum(sales) FROM dept1 GROUP BY GROUPING SETS(deptno, job);
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
           영업1팀               4000  <- 모든 부서의 영업1팀 매출액 합계
           영업2팀               3000  <- 모든 부서의 영업2팀 매출액 합계
         2                      2000
         1                      5000
           
SELECT deptno,job,sum(sales) FROM dept1 GROUP BY GROUPING SETS(deptno, job, (deptno, job));
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
         1 영업1팀               3000
         2 영업1팀               1000
         1 영업2팀               2000
         2 영업2팀               1000
      null 영업1팀               4000
      null 영업2팀               3000
         1 null                 5000  <- 1번 부서의 매출액 합계
         2 null                 2000
         
SELECT deptno,job,sum(sales) FROM dept1 GROUP BY GROUPING SETS(deptno, job, (deptno, job), ());
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
         2 영업1팀               1000
         1 영업2팀               2000
         2 영업2팀               1000
         1 영업1팀               3000
         1 null                 5000  <- 부서별 매출액 합계
         2 null                 2000
      null null                 7000  <- 모든 팀과 모든 부서의 통합 매출액 합계
      null 영업2팀               3000  <- 팀별 매출액 합계
      null 영업1팀               4000   

-- null 값이 먼저 출력됨.           
SELECT deptno,job,sum(sales) FROM dept1 GROUP BY CUBE(deptno, job);
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
      null null                 7000
      null 영업1팀               4000
      null 영업2팀               3000
         1 null                 5000
         1 영업1팀               3000
         1 영업2팀               2000
         2 null                 2000
         2 영업1팀               1000
         2 영업2팀               1000
         
-- null 값이 나중에 출력됨.      
SELECT deptno,job,sum(sales) FROM dept1 
GROUP BY GROUPING SETS(deptno, job, (deptno, job), ()) 
ORDER BY deptno ASC, job ASC;
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
         1 영업1팀               3000
         1 영업2팀               2000
         1                      5000
         2 영업1팀               1000
         2 영업2팀               1000
         2                      2000
           영업1팀               4000
           영업2팀               3000
                                7000  <- 전체 합계

-- null 값이 먼저 출력됨.               
SELECT deptno,job,sum(sales) FROM dept1 
GROUP BY GROUPING SETS(deptno, job, (deptno, job), ()) 
ORDER BY deptno DESC, job DESC;
    DEPTNO JOB             SUM(SALES)
---------- --------------- ----------
                                7000  <- 전체 합계
           영업2팀               3000
           영업1팀               4000
         2                      2000
         2 영업2팀               1000
         2 영업1팀               1000
         1                      5000
         1 영업2팀               2000
         1 영업1팀               3000

commit;


-- GROUP BY, COUNT, DISTINCT 문제 2
INSERT INTO dept1(deptno, job, sales, cnt) VALUES(1, '영업2팀', 3000, 1);
INSERT INTO dept1(deptno, job, sales, cnt) VALUES(1, '영업2팀', 3000, 1);

SELECT deptno, job, sales, cnt FROM dept1;

    DEPTNO JOB             SALES             CNT
---------- --------------- ---------- ----------
         1 영업2팀         3000                1
         1 영업2팀         3000                1
         2 영업2팀         1000                2
         2 영업1팀         1000                1
         1 영업2팀         2000                2
         1 영업1팀         3000                1
         
SELECT deptno, COUNT(*) as 갯수 FROM dept1 GROUP BY deptno;         
    DEPTNO         갯수
----------  ----------
         1          4
         2          2

SELECT * FROM dept1 ORDER BY deptno, job;
    DEPTNO JOB             SALES             CNT
---------- --------------- ---------- ----------
         1 영업1팀         3000                1
         1 영업2팀         3000                1
         1 영업2팀         3000                1
         1 영업2팀         2000                2
         2 영업1팀         1000                1
         2 영업2팀         1000                2
         
-- DISTINCT: 중복되는 값중 대표값 1개만 출력         
SELECT deptno, COUNT(DISTINCT job) as 갯수 FROM dept1 GROUP BY deptno;       
    DEPTNO         갯수
----------  ----------
         1          2
         2          2


-- 2. Grouping 문제 2
-- 2명 이상의 학생을 갖는 학과에 대해, 성적(score) 평균이 80이상인 학과의
-- 학과코드(dno), 학과명(dname), 학생수를 검색 하시오.
DROP TABLE student;
CREATE TABLE student(
  sno     NUMBER(3),
  sname   VARCHAR(5),
  address VARCHAR(10),
  score   NUMBER(3),
  dno     NUMBER(3)
);

INSERT INTO student(sno, sname, address, score, dno) VALUES(100, 'hong', 'seoul', 95, 100);
INSERT INTO student(sno, sname, address, score, dno) VALUES(300, 'lee', 'busan', 90, 200);
INSERT INTO student(sno, sname, address, score, dno) VALUES(200, 'kim', 'jeju', 85, 100);
INSERT INTO student(sno, sname, address, score, dno) VALUES(500, 'hong', 'busan', 95, 300);
INSERT INTO student(sno, sname, address, score, dno) VALUES(400, 'son', 'seoul', 80, 300);

commit;

SELECT * FROM student;

       SNO SNAME ADDRESS         SCORE        DNO
---------- ----- ---------- ---------- ----------
       100 hong  seoul              95        100
       300 lee   busan              90        200
       200 kim   jeju               85        100
       500 hong  busan              95        300
       400 son   seoul              80        300
       
DROP TABLE department;
CREATE TABLE department(
  dno NUMBER(3),
  dname VARCHAR(15)
);

INSERT INTO department(dno, dname) VALUES(100, 'computer');
INSERT INTO department(dno, dname) VALUES(200, 'electronics');
INSERT INTO department(dno, dname) VALUES(300, 'MIS');

commit;

SELECT * FROM department;

       DNO DNAME          
---------- ---------------
       100 computer       
       200 electronics    
       300 MIS         

-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY       
SELECT d.dno, d.dname, count(*), avg(score) 
FROM student s, department d 
WHERE s.dno = d.dno 
GROUP BY d.dno, d.dname 
HAVING count(*) >= 2 and avg(score) >= 80;

       DNO DNAME             COUNT(*) AVG(S.SCORE)
---------- --------------- ---------- ------------
       100 computer                 2           90
       300 MIS                      2         87.5


-- 3. Grouping 문제 3
DROP TABLE customer;
CREATE TABLE customer(
  custid NUMBER(3),
  name   VARCHAR(10)
);

INSERT INTO customer(custid, name) VALUES(1, 'A');
INSERT INTO customer(custid, name) VALUES(2, 'B');
INSERT INTO customer(custid, name) VALUES(3, 'C');

COMMIT;

SELECT * FROM customer;
    CUSTID NAME      
---------- ----------
         1 A         
         2 B         
         3 C         
         
DROP TABLE orders;
CREATE TABLE orders(
  orderid NUMBER(3),
  custid NUMBER(3),
  bookname VARCHAR(10),
  saleprice NUMBER(5)
);

INSERT INTO orders(orderid, custid, bookname, saleprice) VALUES(1, 1, 'JAVA', 10000);
INSERT INTO orders(orderid, custid, bookname, saleprice) VALUES(2, 1, 'Python', 11000);
INSERT INTO orders(orderid, custid, bookname, saleprice) VALUES(3, 2, 'HTML', 10000);
INSERT INTO orders(orderid, custid, bookname, saleprice) VALUES(4, 2, 'JS', 9000);
INSERT INTO orders(orderid, custid, bookname, saleprice) VALUES(5, 3, 'DBMS', 8000);

COMMIT;

SELECT * FROM orders;

   ORDERID     CUSTID BOOKNAME    SALEPRICE
---------- ---------- ---------- ----------
         1          1 JAVA            10000
         2          1 Python          11000
         3          2 HTML            10000
         4          2 JS               9000
         5          3 DBMS             8000
         
-- FROM -> SELECT -> 서브쿼리: FROM -> WHERE -> SELECT
SELECT custid, (SELECT name FROM customer cs WHERE cs.custid = od.custid) as name
FROM orders od

    CUSTID NAME      
---------- ----------
         1 A         
         1 A         
         2 B         
         2 B         
         3 C    

-- FROM -> GROUP BY -> SELECT -> 서브쿼리: FROM -> WHERE -> SELECT         
SELECT custid, (SELECT name FROM customer cs WHERE cs.custid = od.custid) as name
FROM orders od
GROUP BY od.custid;

    CUSTID NAME      
---------- ----------
         1 A         
         2 B         
         3 C    

-- FROM -> GROUP BY -> SELECT -> 서브쿼리: FROM -> WHERE -> SELECT    
SELECT custid, (SELECT name FROM customer cs WHERE cs.custid = od.custid) as name, SUM(saleprice)
FROM orders od
GROUP BY od.custid;

    CUSTID NAME       SUM(SALEPRICE)
---------- ---------- --------------
         1 A                   21000
         2 B                   19000
         3 C                    8000

SELECT custid, SUM(saleprice) hap 
FROM orders 
GROUP BY custid

    CUSTID        HAP
---------- ----------
         1      21000
         2      19000
         3       8000

SELECT cs.custid, cs.name, od.hap
FROM (SELECT custid, SUM(saleprice) hap FROM orders GROUP BY custid) od, customer cs

    CUSTID NAME                S
---------- ---------- ----------
         1 A               21000
         2 B               21000
         3 C               21000
         1 A               19000
         2 B               19000
         3 C               19000
         1 A                8000
         2 B                8000
         3 C                8000

-- FROM -> 서브쿼리: FROM -> GROYP BY -> SELECT -> WHERE -> SELECT         
SELECT cs.custid, cs.name, hap
FROM (SELECT custid, SUM(saleprice) hap FROM orders GROUP BY custid) od, customer cs
WHERE cs.custid = od.custid;

    CUSTID NAME                S
---------- ---------- ----------
         1 A               21000
         2 B               19000
         3 C                8000

SELECT cs.custid, cs.name, SUM(saleprice) 
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.custid, cs.name;

    CUSTID NAME       SUM(SALEPRICE)
---------- ---------- --------------
         2 B                   19000
         1 A                   21000
         3 C                    8000