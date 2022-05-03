-- IN 문제 1
DROP TABLE In1;
CREATE TABLE In1 (
  col1 VARCHAR(3),
  col2 VARCHAR(3)
);

INSERT INTO In1 VALUES('x', 'y');
INSERT INTO In1 VALUES('가', '나');
INSERT INTO In1 VALUES('A', 'B');
INSERT INTO In1 VALUES('다', '라');
INSERT INTO In1 VALUES('a', 'b');
INSERT INTO In1 VALUES('1', '2');

SELECT * FROM In1;
COL1 COL2
--- ---
x   y  
가  나 
A   B  
다  라 
a   b  
1   2  


SELECT * FROM In1 WHERE (col1, col2) IN (('x', 'y'), ('가', '나'));
COL1 COL2
--- ---
x   y  
가  나 

select * from In1 where (col1= 'x' and col2= '가') or (col1= 'y' and col2= '나');
선택된 행 없음

select * from In1 where (col1 = 'x' and col2 = 'y') or (col1 = '가' and col2 = '나');
COL COL
--- ---
x   y  
가  나 

select * from In1 where not (col1, col2) in (('A', 'B'),('다', '라'),('a', 'b'),('1', '2'));
COL COL
--- ---
x   y  
가  나

select * from In1 where (col1, col2) not in (('A', 'B'),('다', '라'),('a', 'b'),('1', '2'));
COL COL
--- ---
x   y  
가  나 

select * from In1 where (col1 = 'x' or col1= '가') and (col2 = 'y' or col2 = '나');
COL COL
--- ---
x   y  
가  나 

-- IN 문제 2
DROP TABLE employee;
CREATE TABLE employee(
  eno     NUMBER(3),
  ename   VARCHAR(5),
  address VARCHAR(10),
  score   NUMBER(3),
  dno     NUMBER(3)
);

INSERT INTO employee(eno, ename, address, score, dno) VALUES(100, 'hong', 'seoul', 80, 100);
INSERT INTO employee(eno, ename, address, score, dno) VALUES(300, 'lee', 'busan', 90, 200);
INSERT INTO employee(eno, ename, address, score, dno) VALUES(200, 'kim', 'jeju', 90, 100);
INSERT INTO employee(eno, ename, address, score, dno) VALUES(500, 'hong', 'busan', 95, 200);
INSERT INTO employee(eno, ename, address, score, dno) VALUES(400, 'son', 'seoul', 65, 300);

commit;

SELECT * FROM employee;

       ENO ENAME ADDRESS         SCORE        DNO
---------- ----- ---------- ---------- ----------
       100 hong  seoul              80        100
       300 lee   busan              90        200
       200 kim   jeju               90        100
       500 hong  busan              95        200
       400 son   seoul              65        300
       
DROP TABLE department;
CREATE TABLE department(
  dno NUMBER(3),
  dname VARCHAR(15)
);

INSERT INTO department(dno, dname) VALUES(100, '영업');
INSERT INTO department(dno, dname) VALUES(200, '개발');
INSERT INTO department(dno, dname) VALUES(300, '서비스');

commit;

SELECT * FROM department;

       DNO DNAME          
---------- ---------------
       100 영업           
       200 개발           
       300 서비스      

SELECT e.dno, d.dname, e.ename, e.score
FROM employee e, department d
WHERE e.dno = d.dno

       DNO DNAME           ENAME      SCORE
---------- --------------- ----- ----------
       100 영업            hong          80
       200 개발            lee           90
       100 영업            kim           90
       200 개발            hong          95
       300 서비스          son           65

SELECT dno, max(score) FROM employee GROUP BY dno;

       DNO MAX(SCORE)
---------- ----------
       200         95
       300         65
       100         90

SELECT e.dno, d.dname, e.ename, e.score
FROM employee e, department d
WHERE e.dno = d.dno AND (e.dno, score) IN (SELECT dno, max(score) FROM employee GROUP BY dno);

       DNO DNAME           ENAME      SCORE
---------- --------------- ----- ----------
       100 영업            kim           90
       200 개발            hong          95
       300 서비스          son           65