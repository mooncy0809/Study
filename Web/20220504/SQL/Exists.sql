DROP TABLE ex1;
CREATE TABLE ex1(
  n1 NUMBER(3),
  v1 VARCHAR(5)
);

INSERT INTO ex1(n1, v1) VALUES(1, 'A');
INSERT INTO ex1(n1, v1) VALUES(2, null);
INSERT INTO ex1(n1, v1) VALUES(3, 'B');
INSERT INTO ex1(n1, v1) VALUES(4, 'C');

COMMIT;

SELECT * FROM ex1;
        N1 V1   
---------- -----
         1 A    
         2 null     
         3 B    
         4 C    
         
DROP TABLE ex2;
CREATE TABLE ex2(
  n1 NUMBER(3),
  v1 VARCHAR(5)
);

INSERT INTO ex2(n1, v1) VALUES(1, 'A');
INSERT INTO ex2(n1, v1) VALUES(2, null);
INSERT INTO ex2(n1, v1) VALUES(3, 'B');

COMMIT;

SELECT * FROM ex2;
        N1 V1   
---------- -----
         1 A    
         2 null      
         3 B    

SELECT v1 FROM ex2;
V1   
-----
A
null
B

-- IN 함수는 null을 제외함
SELECT v1 FROM ex2 WHERE v1 IN('A', null, 'B');
V1   
-----
A
B

SELECT v1 FROM ex2 WHERE v1 IN(SELECT v1 FROM ex2);
V1   
-----
A
B

-- null은 제외됨.
SELECT * FROM ex1 WHERE v1 IN(SELECT v1 FROM ex2);
        N1 V1   
---------- -----
         1 A    
         3 B    

-- null 값은 제외
SELECT * FROM ex1 WHERE v1 NOT IN('B', 'C');
        N1 V1   
---------- -----
         1 A    

-- SQL 오류: ORA-00928: 누락된 SELECT 키워드
SELECT * FROM ex2 A WHERE EXISTS('X');

-- 조건이 없음으로 모든 레코드
SELECT * FROM ex2 A WHERE EXISTS(SELECT 'X' FROM dual);
        N1 V1   
---------- -----
         1 A    
         2 null     
         3 B    
         
-- 'X'가 있으면 레코드가 존재하여 EXIST에 참이되고 레코드 선택
-- ex1.V1 컬럼의 'C'는 ex2에 없음으로 join에서 제외
SELECT * FROM ex1 A WHERE EXISTS(SELECT 'X' FROM ex2 B WHERE A.v1 = B.v1);
        N1 V1   
---------- -----
         1 A    
         3 B    
         
-- 결과 동일
SELECT * FROM ex1 A WHERE EXISTS(SELECT v1 FROM ex2 B WHERE A.v1 = B.v1);
        N1 V1   
---------- -----
         1 A    
         3 B    
         
-- null은 Unknown으로 처리되어 없는 것으로 출력됨.
SELECT * FROM ex1 A WHERE NOT EXISTS(SELECT v1 FROM ex2 B WHERE A.v1 = B.v1);
        N1 V1   
---------- -----
         4 C    
         2 null     
         