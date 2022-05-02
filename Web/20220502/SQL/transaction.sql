1. 견본 테이블 생성
 
DROP TABLE pay PURGE;
 
CREATE TABLE pay(
    name varchar(10) NOT NULL,
    pay  number(7)   NOT NULL,
    tax  number(6)   DEFAULT 0
);
 
SELECT * FROM tab;
 TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
ADMIN                          TABLE             
CATE                           TABLE             
CATEGRP                        TABLE             
CONTENTS                       TABLE             
DEPARTMENT                     TABLE             
ITPAY                          TABLE             
MEMO                           TABLE             
PAY                            TABLE             
PAY2                           TABLE             
POSITION                       TABLE             
SALES                          TABLE             

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
STUDENT                        TABLE             
TEST                           TABLE             
VISIT                          TABLE             
 
2. COMMIT(INSERT, UPDATE, DELETE 적용)
 
INSERT INTO pay(name,pay,tax) VALUES('왕눈이', 2000000, 100000);
 
-- 물리적 디스크상에 적용, 취소 불가능
COMMIT;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2000000     100000

 
3. ROLLBACK
 
DELETE FROM pay WHERE name='왕눈이';
 
SELECT * FROM pay;
선택된 행 없음

-- 삭제된 레코드가 복구 됩니다., ROLLBACK
-- ROLLBACK WORK;  
ROLLBACK;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2000000     100000
 
 
4. 여러단계의 복구
-- 왕눈이 삭제 
DELETE FROM pay WHERE name='왕눈이';
-- 레코드 없음 
SELECT * FROM pay;
  
-- 아로미 추가
INSERT INTO pay(name,pay,tax) VALUES('아로미', 2200000, 120000);
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
아로미        2200000     120000

-- 아로미의 급여를 10% 인상합니다.
UPDATE pay SET pay=pay * 1.1 WHERE name='아로미';
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
아로미        2420000     120000

-- 아로미의 세금을 11% 인상합니다.
UPDATE pay SET tax=tax * 0.11 WHERE name='아로미';
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
아로미        2420000      13200

-- 최초 상태로 돌아갑니다.
ROLLBACK WORK;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2000000     100000
 
5. SAVEPOINT
   - 특정 지점으로 ROLLBACK 할 수 있는 기능을 제공합니다.
 
-- 원본 데이터 상태
SAVEPOINT first;
 
INSERT INTO pay(name,pay,tax) VALUES('아로미', 3000000, 300000);
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2000000     100000
아로미        3000000     300000
 
UPDATE pay SET pay=3500000, tax=350000;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        3500000     350000
아로미        3500000     350000

SAVEPOINT second;
 
 
INSERT INTO pay(name,pay,tax) VALUES('투투', 5600000, 800000);
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        3500000     350000
아로미        3500000     350000
투투          5600000     800000

-- SAVEPOINT second 지역으로 복구합니다.
ROLLBACK TO SAVEPOINT second;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        3500000     350000
아로미        3500000     350000
 
ROLLBACK TO SAVEPOINT first;
 
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2000000     100000
 
 
6. READ Consistency(읽기 일관성)
   - iSQL+ 는 브러우저를 닫으면 COMMIT 됩니다.
   - SQL+는 창을 닫으면 ROLLBACK 됩니다.
   - SQL+는 exit명령을 내리면 COMMIT됩니다.
     따라서 로그아웃시에는 반드시 명시적으로 ROLLBACK, COMMIT명령 
     사용을 권장 합니다.
 
   USER 1 --- 임시 영역 ---+   +--- COMMIT: 적용  ----- Data Area
                          +--+ 
   USER 1 --- 임시 영역 ---+   +--- ROLLBACK: 취소
 
1)  SQL Developer
DELETE FROM pay;
INSERT INTO pay(name,pay,tax) VALUES('왕눈이', 2500000, 200000);
COMMIT;

SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2500000     200000

2) SQL Command Line
SQL> connect kd1
Connected.

SQL> SELECT * FROM pay;
NAME                        PAY        TAX
-------------------- ---------- ----------
왕눈이                  2500000     200000

SQL> INSERT INTO pay(name, pay, tax) VALUES('아로미', 2600000, 250000);
 
SQL> SELECT * FROM pay;
NAME                        PAY        TAX
-------------------- ---------- ----------
왕눈이                  2500000     200000
아로미                  2600000     250000
 
3) SQL Developer, 변경된 데이터 아로미를 읽을 수 없습니다.
SELECT * FROM pay;
NAME              PAY        TAX
---------- ---------- ----------
왕눈이        2500000     200000
 
4) SQL Command Line
SQL> COMMIT;
 
5) SQL Developer, COMMIT이 되었음으로 변경된 데이터를 읽을 수 있습니다.
SELECT * FROM pay;
NAME                        PAY        TAX
-------------------- ---------- ----------
왕눈이                  2500000     200000
아로미                  2600000     250000
