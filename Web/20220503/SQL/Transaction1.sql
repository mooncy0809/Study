-- 트랜잭션 문제 1
DROP TABLE tab1;
CREATE TABLE tab1(
  col1 NUMBER(3)
);

INSERT INTO TAB1 VALUES(1);
INSERT INTO TAB1 VALUES(2);
SELECT * FROM tab1;
      COL1
----------
         1
         2
                 
SAVEPOINT SV1;

UPDATE TAB1 SET COL1=7 WHERE COL1=2;
SELECT * FROM tab1;
      COL1
----------
         1
         7

INSERT INTO TAB1 VALUES(9);
SELECT * FROM tab1;
      COL1
----------
         1
         7
         9
SAVEPOINT SV2;

DELETE TAB1 WHERE COL1 =7;
SELECT * FROM tab1;
      COL1
----------
         1
         9
         
INSERT INTO TAB1 VALUES(11);
SELECT * FROM tab1;
      COL1
----------
         1
         9
        11
SAVEPOINT SV3;


INSERT INTO TAB1 VALUES(9);
SELECT * FROM tab1;
      COL1
----------
         1
         9
        11
         9
ROLLBACK TO SV2;
SELECT * FROM tab1;
      COL1
----------
         1
         7
         9

COMMIT; 


-- 트랜잭션 문제 2
DROP TABLE tab1;
CREATE TABLE tab1(
  col1 NUMBER(3)
);

INSERT INTO TAB1 VALUES(1);
INSERT INTO TAB1 VALUES(2);
SELECT * FROM tab1;

      COL1
----------
         1
         2
         
-- 컬럼명 변경
ALTER TABLE TAB1
RENAME COLUMN col1 to col2;
         
SELECT * FROM tab1;
      COL2
----------
         1
         2
         
ROLLBACK WORK; -- DDL문을 만나면 자동 COMMIT이 발생함으로 복구가 안됨.   

SELECT * FROM tab1;
      COL2
----------
         1
         2