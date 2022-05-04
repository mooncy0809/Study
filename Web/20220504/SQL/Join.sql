-- PK, FK 선언을 제외하고 문제가 출제됨(권장되지 않음).

-- JOIN 1
DROP TABLE join1; 
Create table join1( COL1 varchar2(5), COL2 number(5), KEY1 varchar2(5) );
insert into join1 values('BBB',123,'B');
insert into join1 values('DDD',222,'C');
insert into join1 values('EEE',233,'D');
insert into join1 values('FFF',143,'E');

COMMIT;

SELECT * FROM join1;
COL1        COL2 KEY1 
----- ---------- -----
BBB          123 B    
DDD          222 C    
EEE          233 D    
FFF          143 E    

DROP TABLE join2; 
Create table join2( KEY2 varchar2(5), COL1 number(5), COL2 varchar2(5));
insert into join2 values('A', 10, 'BC');
insert into join2 values('B', 10, 'CD');
insert into join2 values('C', 10, 'DE');

COMMIT;

SELECT * FROM join2;

KEY2        COL1 COL2 
----- ---------- -----
A             10 BC   
B             10 CD   
C             10 DE  

-- ANSI
SELECT * FROM join1 A INNER JOIN join2 B ON (A.KEY1 = B.KEY2);

COL1        COL2 KEY1  KEY2        COL1 COL2 
----- ---------- ----- ----- ---------- -----
BBB          123 B     B             10 CD   
DDD          222 C     C             10 DE   

-- LEFT 테이블 레코드 모두 출력
SELECT * FROM join1 A LEFT OUTER JOIN join2 B ON(A.KEY1 = B.KEY2);

COL1        COL2 KEY1  KEY2        COL1 COL2 
----- ---------- ----- ----- ---------- -----
BBB          123 B     B             10 CD   
DDD          222 C     C             10 DE   
FFF          143 E                           
EEE          233 D                

-- RIGHT 테이블 레코드 모두 출력
SELECT * FROM join1 A RIGHT OUTER JOIN join2 B ON(A.KEY1 = B.KEY2);

COL1        COL2 KEY1  KEY2        COL1 COL2 
----- ---------- ----- ----- ---------- -----
BBB          123 B     B             10 CD   
DDD          222 C     C             10 DE   
                       A             10 BC   

-- join1 레코드 갯수 4 * join2 레코드 갯수 4 = 12
SELECT * FROM join1 A CROSS JOIN join2 B;

COL1        COL2 KEY1  KEY2        COL1 COL2 
----- ---------- ----- ----- ---------- -----
BBB            123 B     A             10 BC   
DDD          222 C     A             10 BC   
EEE            233 D     A             10 BC   
FFF          143 E     A             10 BC   
BBB          123 B     B             10 CD   
DDD          222 C     B             10 CD   
EEE          233 D     B             10 CD   
FFF          143 E     B             10 CD   
BBB          123 B     C             10 DE   
DDD          222 C     C             10 DE   
EEE          233 D     C             10 DE   
FFF          143 E     C             10 DE   

