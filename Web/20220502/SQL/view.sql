1. 기본적인 View의 생성
 
1) 테이블 구조
DROP TABLE test PURGE;
 
CREATE TABLE test(
    testno NUMBER(5)   NOT NULL, -- 일련번호
    name   VARCHAR(30) NOT NULL, -- 성명
    mat    NUMBER(3)   NOT NULL, -- 수학
    eng    NUMBER(3)   NOT NULL, -- 영어
    tot    NUMBER(3)       NULL, -- 총점
    avg    NUMBER(4, 1)    NULL, -- 평균
    PRIMARY KEY (testno) 
);
 
DELETE FROM test;
 
2) 기초 데이터 추가
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test), '피어스 브러스넌', 80, 100);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test), '메릴스트립', 80, 100);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test), '사이프리드', 85, 80);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test),  '콜린퍼스', 65, 60);
 
INSERT INTO test(testno, name, mat, eng)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test), '스텔란 스카스가드', 75, 70);

SELECT testno, name, mat, eng FROM test;
    TESTNO NAME                                  MAT        ENG
---------- ------------------------------ ---------- ----------
         1 피어스 브러스넌                        80        100
         2 메릴스트립                            80        100
         3 사이프리드                            85         80
         4 콜린퍼스                              65         60
         5 스텔란 스카스가드                      75         70
         
COMMIT;
 
UPDATE test SET tot = mat+eng;
 
UPDATE test SET avg = tot/2;
 
SELECT * FROM test;
    TESTNO NAME                              MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 피어스 브러스넌                        80        100        180       90
         2 메릴스트립                            80        100        180       90
         3 사이프리드                            85         80        165       82.5
         4 콜린퍼스                              65         60        125       62.5
         5 스텔란 스카스가드                      75         70        145       72.5
         
commit;
 
3) VIEW의 생성
-- 우수생 목록
SELECT testno, name, mat, eng, tot, avg
FROM test
WHERE avg >= 90;
    TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 피어스 브러스넌                         80        100        180         90
         2 메릴스트립                             80        100        180         90
         
DROP VIEW vtest_90;
 
CREATE VIEW vtest_90
AS 
SELECT testno, name, mat, eng, tot, avg
FROM test
WHERE avg >= 90;
 
SELECT * FROM tab;

-- View 사용, 평균 90점이상인 사원 출력 
SELECT testno, name, mat, eng, tot, avg FROM vtest_90;
     TESTNO NAME                                  MAT        ENG        TOT        AVG
---------- ------------------------------ ---------- ---------- ---------- ----------
         1 피어스 브러스넌                        80        100        180         90
         2 메릴스트립                             80        100        180         90
 
2. 일부 컬럼만 View의 대상으로 지정
 
DROP VIEW vtest_80;
 
CREATE VIEW vtest_80
AS 
SELECT testno, name, tot, avg
FROM test
WHERE avg >= 80;
 
-- View에 만들어진 컬럼만 출력됨.
SELECT * FROM vtest_80;
    TESTNO NAME                                  TOT        AVG
---------- ------------------------------ ---------- ----------
         1 피어스 브러스넌                       180         90
         2 메릴스트립                           180         90
         3 사이프리드                           165         82.5
         
SELECT testno, name, tot, avg FROM vtest_80; 
 
-- ERROR, View에 없는 컬럼 mat, eng 접근 못함.
SELECT testno, name, mat, eng, tot, avg FROM vtest_80; 
 
 
3. ()안의 컬럼은 생성되는 View의 컬럼의 별명입니다.
- 실제 컬럼명이 감추어짐.
CREATE OR REPLACE VIEW vtest_70(
    hakbun, student_name, total, average
)
AS 
SELECT testno, name, tot, avg
FROM test
WHERE avg >= 70;
 
SELECT * FROM vtest_70;
    HAKBUN STUDENT_NAME                      TOTAL    AVERAGE
---------- ------------------------------ ---------- ----------
         1 피어스 브러스넌                       180         90
         2 메릴스트립                           180         90
         3 사이프리드                           165         82.5
         5 스텔란 스카스가드                     145         72.5

  
4. 함수를 이용한 View의 생성
CREATE OR REPLACE VIEW vtest_func(
    max_total, min_total, avg_total
)
AS 
SELECT MAX(tot), MIN(tot), AVG(tot) 
FROM test;
   
 
SELECT * FROM vtest_func;
 MAX_TOTAL  MIN_TOTAL  AVG_TOTAL
---------- ---------- ----------
       180        125        159
       
SELECT max_total, min_total, avg_total FROM vtest_func;
 
 
5. WITH CHECK OPTION 
   - VIEW 생성시 WHERE문에 명시한 컬럼의 값을 변경 할 수 없습니다.
 
1) 실습용 테이블
DROP TABLE employee;
 
CREATE TABLE employee(
    name          varchar(10) not null,
    salary        number(7)   not null,
    department_id number(4)   not null
);
 
INSERT INTO employee(name, salary,department_id)
VALUES('aaa', 1000000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('bbb', 1100000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('ccc', 1200000, 20);
INSERT INTO employee(name, salary,department_id)
VALUES('ddd', 1300000, 30);
INSERT INTO employee(name, salary,department_id)
VALUES('eee', 1400000, 40);
 
SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
COMMIT;
 
2) WITH CHECK OPTION 사용하지 않은 경우
CREATE OR REPLACE VIEW vemp20
AS 
SELECT *
FROM employee
WHERE department_id=20;
 
SELECT * FROM vemp20;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
 
-- vemp20은 20번 부서만 작업 대상으로 하나
-- WHERE문에 나타난 부서를 30번으로 변경함으로 논리적 에러가
-- 발생합니다.
-- View를 이용한 UPDATE는 권장이 아닙니다.
UPDATE vemp20 SET department_id=30;
 
-- 부서가 모두 30번으로 변경되어 결과가 없습니다.
SELECT * FROM vemp20;
선택된 행 없음

SELECT * FROM employee;
AME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            30  <- 20에서 30으로 변경됨
bbb           1100000            30  <- 20에서 30으로 변경됨
ccc           1200000            30  <- 20에서 30으로 변경됨
ddd           1300000            30
eee           1400000            40
 
-- INSERT, DELETE, UPDATE 실행 취소
ROLLBACK;
 
SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20 <- 복구됨.
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
  
 
3) WITH CHECK OPTION을 사용한 경우
-- WITH CHECK OPTION CONSTRAINT 제약 조건명;
CREATE VIEW vemp_c20
AS 
SELECT *
FROM employee
WHERE department_id=20
WITH CHECK OPTION CONSTRAINT vemp_c20_ck;
   
SELECT * FROM vemp_c20;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
 
-- UPDATE가 금지되어 실행이 안됩니다. UPDATE를 실행하고자 할 경우는
-- 실제의 테이블을 대상으로 합니다.
-- SQL 오류: ORA-01402: view WITH CHECK OPTION where-clause violation
-- 01402. 00000 -  "view WITH CHECK OPTION where-clause violation"
-- ORA-01402: 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다
UPDATE vemp_c20 SET department_id=30;
 
UPDATE vemp_c20 SET salary = 5000000 WHERE name = 'ccc';
 
SELECT * FROM vemp_c20;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           5000000            20   <- 1200000에서 5000000으로 인상

SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           5000000            20   <- 1200000에서 5000000으로 인상
ddd           1300000            30
eee           1400000            40

ROLLBACK;
롤백 완료.

SELECT * FROM employee;
NAME           SALARY DEPARTMENT_ID
---------- ---------- -------------
aaa           1000000            20
bbb           1100000            20
ccc           1200000            20
ddd           1300000            30
eee           1400000            40
 
  
6. WITH READ ONLY 옵션
  - View에서 UPDATE, INSERT, DELETE 기능을 금지시킵니다.
 
CREATE OR REPLACE VIEW test_read(num, name, total)
AS 
SELECT testno, name, tot
FROM test
WHERE tot >= 150
WITH READ ONLY;
  
SELECT * FROM test_read;
       NUM NAME                                TOTAL
---------- ------------------------------ ----------
         1 피어스 브러스넌                        180
         2 메릴스트립                            180
         3 사이프리드                            165
 
INSERT INTO test_read(num, name, total)
VALUES((SELECT NVL(MAX(testno), 0)+1 as cnt FROM test), '줄리 월터스', 150);
 
-- SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view
-- SQL 오류: ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
-- 42399.0000 - "cannot perform a DML operation on a read-only view"
UPDATE test_read SET total = 200;
 
 
※ VIEW는 INSERT, UPDATE, DELETE에는 사용을 권장하지 않습니다.
 
 
7. FROM 절에 기록된 Subquery는 INLINE VIEW라고 해서
   SQL 내부에 포함된 임시 VIEW라고 부릅니다.(페이징에서 많이 사용됨.)
    
1) 레코드 정렬
SELECT testno, name, mat, eng, tot, avg
FROM test
ORDER BY testno DESC;
 
2) rownum 산출
SELECT testno, name, mat, eng, tot, avg, rownum as r
FROM(
    SELECT testno, name, mat, eng, tot, avg -- Inline View
    FROM test
    ORDER BY testno DESC
);
   
3) record 분할
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        ORDER BY testno DESC
    )
)
WHERE r > =1 AND r <= 3;
    TESTNO NAME                                MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         5 스텔란 스카스가드                       75         70        145       72.5          1
         4 콜린퍼스                              65         60        125       62.5          2
         3 사이프리드                             85         80        165       82.5          3
 
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        ORDER BY testno DESC
    )
)
WHERE r > =4 AND r <= 6;
    TESTNO NAME                               MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         2 메릴스트립                            80        100        180         90          4
         1 피어스 브러스넌                        80        100        180         90          5
 
4) 검색
SELECT testno, name, mat, eng, tot, avg, r
FROM(
    SELECT testno, name, mat, eng, tot, avg, rownum as r
    FROM(
        SELECT testno, name, mat, eng, tot, avg -- Inline View
        FROM test
        WHERE name LIKE '%메릴%'
        ORDER BY testno DESC
    )
)
WHERE r > =1 AND r <= 3;
    TESTNO NAME                                  MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         2 메릴스트립                             80        100        180         90          1
         
 
5) Subquery의 View 생성
 
CREATE OR REPLACE VIEW v_test_list
AS
SELECT testno, name, mat, eng, tot, avg -- Inline View
FROM test
ORDER BY testno DESC
WITH READ ONLY;
 
6) Subquery의 View의 사용
 
SELECT testno, name, mat, eng, tot, avg, rownum r
FROM v_test_list;
    TESTNO NAME                                  MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         5 스텔란 스카스가드                      75         70        145       72.5          1
         4 콜린퍼스                              65         60        125       62.5          2
         3 사이프리드                            85         80        165       82.5          3
         2 메릴스트립                            80        100        180         90          4
         1 피어스 브러스넌                        80        100        180         90          5

-- 1 page 
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
)
WHERE r > =1 AND r <= 3;
    TESTNO NAME                               MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         5 스텔란 스카스가드                      75         70        145       72.5          1
         4 콜린퍼스                             65         60        125       62.5          2
         3 사이프리드                            85         80        165       82.5          3

-- 2 page  
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
)
WHERE r > = 4 AND r <= 6;
    TESTNO NAME                               MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         2 메릴스트립                            80        100        180         90          4
         1 피어스 브러스넌                        80        100        180         90          5
         
 
-- 검색
SELECT testno, name, mat, eng, tot, avg, r
FROM (
    SELECT testno, name, mat, eng, tot, avg, rownum r
    FROM v_test_list
    WHERE name LIKE '%메릴%'
)
WHERE r > = 1 AND r <= 3;
    TESTNO NAME                                  MAT        ENG        TOT        AVG          R
---------- ------------------------------ ---------- ---------- ---------- ---------- ----------
         2 메릴스트립                             80        100        180         90          1

 
8. paging view 제작시 검색에서 문제가 되는 경우

CREATE OR REPLACE VIEW v_test_list
AS
SELECT testno, name, mat, eng, tot, avg, rownum as r
FROM(
    SELECT testno, name, mat, eng, tot, avg -- Inline View
    FROM test
    ORDER BY testno DESC
)
WITH READ ONLY;

-- 1 page 
SELECT testno, name, mat, eng, tot, avg, r
FROM v_test_list
WHERE r > =1 AND r <= 3;
 
-- 2 page  
SELECT testno, name, mat, eng, tot, avg, r
FROM v_test_list
WHERE r > = 4 AND r <= 6;
 
-- 검색일 경우 rownum이 1 ~ 3구간에서만 검색됨으로 문제 발생
SELECT testno, name, mat, eng, tot, avg, r
FROM v_test_list
WHERE name LIKE '%메릴%'  AND (r > = 1 AND r <= 3);

선택된 행 없음


[실습] Contents table paging view
CREATE OR REPLACE VIEW v_contents_pg
AS
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1
FROM contents
ORDER BY contentsno DESC
WITH READ ONLY;

-- 1 page
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, r
FROM (
          SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, rownum as r
          FROM v_contents_pg
)
WHERE r >= 1 AND r <= 3;


-- 2 page
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, r
FROM (
          SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, rownum as r
          FROM v_contents_pg
)
WHERE r >= 4 AND r <= 6;

-- search
SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, r
FROM (
          SELECT contentsno, adminno, cateno, title, content, recom, cnt, replycnt, rdate, word,
          file1, thumb1, size1, rownum as r
          FROM v_contents_pg
          WHERE cateno=23 AND (title LIKE '%가을%' OR content LIKE '%가을%' OR word LIKE '%가을%')
)
WHERE r >= 1 AND r <= 3;