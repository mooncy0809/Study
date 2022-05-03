-- 1. NULL1 문제 1
DROP TABLE null1;
CREATE TABLE null1(
  col1 NUMBER(3)
);

INSERT INTO null1 VALUES(NULL);
INSERT INTO null1 VALUES(0);
INSERT INTO null1 VALUES(null);
INSERT INTO null1 VALUES(0);
INSERT INTO null1 VALUES(NULL);

SELECT * FROM null1;
      COL1
----------
          
         0
          
         0
          
-- null 비교 문법이 잘못됨.
select case null1.col1 when null then -1 else 0 end as c1 from null1;
        C1
----------
         0
         0
         0
         0
         0
         
-- error         
select case null1.col1 when is null then -1 else 0 end as c1 from null1;     
         
select case when null1.col1 is null then -1 else 0 end as c1 from null1;
        C1
----------
        -1
         0
        -1
         0
        -1
        
-- decode(컬럼, 조건1, 결과1, 조건 2, 결과 2)
-- col1이 null이면 -1 리턴, 그렇지 않으면 원래의 값 리턴
select decode(null1.col1, null, -1, null1.col1) as c1 from null1;
        C1
----------
        -1
         0
        -1
         0
        -1
        
select decode(null1.col1, null, 2021, null1.col1) as c1 from null1;
-- col1이 null이면 2021 리턴, 그렇지 않으면 원래의 값 리턴
        C1
----------
      2021
         0
      2021
         0
      2021
      
select decode(null1.col1, 0, 'ZERO', '-') as c1 from null1;
C1  
----
-
ZERO
-
ZERO
-

-- col1이 null이면 ZERO, 0이면 2021
select decode(null1.col1, null, 'ZERO', 0, 2021) as c1 from null1;
C1  
----
ZERO
2021
ZERO
2021
ZERO

-- col1 컬럼이 null이면 -1
select nvl(null1.col1, -1) as c1 from null1;
        C1
----------
        -1
         0
        -1
         0
        -1
        
commit;


-- 2. NULL1 문제 2
DROP TABLE null2;
CREATE TABLE null2(
  col1 NUMBER(3),
  col2 NUMBER(3),
  col3 NUMBER(3)
);

INSERT INTO null2(col1, col2, col3) VALUES(1, 5, 1);
INSERT INTO null2(col1, col2, col3) VALUES(2, null, 13);
INSERT INTO null2(col1, col2, col3) VALUES(2, 10, 12);

COMMIT;

SELECT * FROM null2;
      COL1       COL2       COL3
---------- ---------- ----------
         1          5          1
         2       null         13
         2         10         12
         
SELECT * FROM null2 ORDER BY col1 DESC;
      COL1       COL2       COL3
---------- ---------- ----------
         2       null         13
         2         10         12
         1          5          1

SELECT * FROM null2 ORDER BY col1 DESC, col2 DESC;
      COL1       COL2       COL3
---------- ---------- ----------
         2       null         13
         2         10         12
         1          5          1
         
SELECT * FROM null2 ORDER BY col1 DESC, col2 ASC;
      COL1       COL2       COL3
---------- ---------- ----------
         2         10         12
         2       null         13
         1          5          1


-- 문제 3
-- 결과 없음, IS NULL 이용하여 비교
SELECT * FROM dual WHERE null = null;

-- dual: SQL 문법을 지키기위한 시스템 테이블
SELECT * FROM dual WHERE null is null;

D
-
X


-- 문제 4
DROP TABLE emp;
CREATE TABLE emp(
  no NUMBER(3),
  Name VARCHAR(10)
);

INSERT INTO emp(no, name) VALUES(1, '왕눈이');
INSERT INTO emp(no, name) VALUES(2, null);
INSERT INTO emp(no, name) VALUES(3, '아로미');
INSERT INTO emp(no, name) VALUES(4, null);
INSERT INTO emp(no, name) VALUES(5, null);

commit;

SELECT * FROM emp;

        NO NAME      
---------- ----------
         1 왕눈이    
         2 null          
         3 아로미    
         4 null           
         5 null           
         
-- Oracle X        
-- name이 null이면 '없음'을 출력하고 그렇지 않으면 name 출력
SELECT IS NULL(name, '없음') FROM emp;         

SELECT CASE WHEN name IS NOT NULL THEN name ELSE '-' END AS USER_NAME From emp;
USER_NAME 
----------
왕눈이
0
아로미
0
0

SELECT CASE WHEN name IS NOT NULL THEN '값 있음' ELSE name END AS USER_NAME FROM emp;
USER_NAME 
----------
값 있음
null
값 있음
null
null

SELECT CASE WHEN name IS NULL THEN '없음' ELSE name END AS USER_NAME FROM emp;
USER_NAME 
----------
왕눈이
없음
아로미
없음
없음

SELECT CASE WHEN name IS NULL THEN '없음' ELSE 'O' END AS USER_NAME FROM emp;

US
--
O
없음
O
없음
없음

SELECT * FROM emp;
        NO NAME      
---------- ----------
         1 왕눈이    
         2 null          
         3 아로미    
         4 null           
         5 null

-- 값이 없어지면 null로 변경됨.         
UPDATE emp SET name = '' WHERE no=1; 

SELECT * FROM emp;
        NO NAME      
---------- ----------
         1 null    
         2 null          
         3 아로미    
         4 null           
         5 null
