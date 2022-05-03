-- 1. Union 문제 1
DROP TABLE A;
CREATE TABLE A (
  col1 NUMBER(3)
);

INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
SELECT * FROM A;
      COL1
----------
         1
         2
         3
         4

DROP TABLE B;
CREATE TABLE B (
  col1 NUMBER(3)
);

INSERT INTO B VALUES(4);
INSERT INTO B VALUES(5);
SELECT * FROM B;
      COL1
----------
         4
         5
                  
DROP TABLE C;
CREATE TABLE C (
  col1 NUMBER(3)
);

INSERT INTO C VALUES(2);
SELECT * FROM C;
      COL1
----------
         2

-- 중복값이 생략됨.
SELECT * FROM A 
UNION 
SELECT * FROM B; 
      COL1
----------
         1
         2
         3
         4
         5
-- 차집합
SELECT * FROM A 
UNION 
SELECT * FROM B 
MINUS 
SELECT * FROM C;  
      COL1
----------
         1
         3
         4
         5
