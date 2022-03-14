-- 1) 테이블 생성 및 데이터 준비
DROP TABLE PG;
 
CREATE TABLE PG(
  no    NUMBER(5) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(no )
);

-- 일련번호를 sequence를 사용하지 않고 subquery를 이용하여 생성하는 경우
-- 서브 쿼리: SQL 내부에 SQL 사용, ()가 존재해야함, 독립적으로 실행 가능.
-- (SELECT NVL(MAX(no ), 0) +1 as no  FROM pg)
-- MAX(): 최대값을 가져오는 함수, 레코드가 없으면 null을 리턴
-- NVL(MAX(no ), 0): MAX 함수가 null이면 특정값으로 대체
-- 레코드가 없는 경우 null을 리턴
SELECT MAX(no ) as no  FROM pg;

-- 레코드가 없는 경우 null에 대한 사칙연산은 null을 리턴
SELECT MAX(no ) + 1 as no  FROM pg;

-- NVL(null, 0): null이 0으로 변경됨.
SELECT NVL(MAX(no ), 0) +1 as no  FROM pg
        NO
----------
         1

INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '01월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '02월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '03월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '04월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '05월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '06월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '07월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '08월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '09월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '10월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '11월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '12월');
 
SELECT no , title FROM pg;

COMMIT;
 
 NUM TITLE
 --- -----
   1 01월
   2 02월
   3 03월
   4 04월
   5 05월
   6 06월
   7 07월
   8 08월
   9 09월
  10 10월
  11 11월
  12 12월
 
-- 분기별로 분할하여 레코드를 추출하는 경우(페이징)
SELECT no, title FROM pg;
 
-- rownum: oralce system에서 select시에 자동으로 붙여주는 일련번호, 테이블에는 존재하지 않음.
SELECT no, title, rownum FROM pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   2 02월        2
   3 03월        3
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
 
-- 2) 2,3월 삭제
DELETE FROM pg WHERE no =2 or no =3;
 
SELECT no, title, rownum FROM pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   4 04월        2
   5 05월        3
   6 06월        4
   7 07월        5
   8 08월        6
   9 09월        7
  10 10월        8
  11 11월        9
  12 12월       10
 
 
-- 3) 페이징시는 일정한 순차값이 생성되는 rownum 값을 사용합니다.
-- rownum주의: rownum은 정렬(ORDER BY ~)보다 먼저 생성됨으로
--                   정렬을 한 후 rownum 컬럼을 사용합니다.
 
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '봄');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '여름');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '가을');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '겨울');
commit;

SELECT no, title, rownum FROM pg;

-- 4) Paging Step 1
-- rownum은 정렬시에 순서가 일정하지 않게됨.
-- FROM → SELECT → ROWNUM 생성 → ORDER BY ~
SELECT no, title, rownum 
FROM pg
ORDER BY title ASC;
 
        NO TITLE                    ROWNUM
---------- -------------------- ----------
         1 01월                          1
         4 04월                          2
         5 05월                          3
         6 06월                          4
         7 07월                          5
         8 08월                          6
         9 09월                          7
        10 10월                          8
        11 11월                          9
        12 12월                         10
        15 가을                         13
        16 겨울                         14
        13 봄                            11
        14 여름                         12
  
-- 5) Paging Step 2, subquery, 내부 View의 사용
-- 정렬을한 테이블(메모리상에 생성됨)을 전달받아 rownum 생성함으로 일정하게됨
SELECT no, title, rownum
FROM (
           SELECT no , title 
           FROM pg
           ORDER BY title ASC
);
 
       NUM TITLE                    ROWNUM
---------- -------------------- ----------
         1 01월                          1
         4 04월                          2
         5 05월                          3
         6 06월                          4
         7 07월                          5
         8 08월                          6
         9 09월                          7
        10 10월                          8
        11 11월                          9
        12 12월                         10
        15 가을                         11
        16 겨울                         12
        13 봄                            13
        14 여름                         14

-- 6) 서브쿼리에서 SELECT 한 컬러만 외부 쿼리에서 사용 가능
SELECT no, title, rownum
FROM (
           SELECT no  
           FROM pg
           ORDER BY title ASC
);  
-- ORA-00904: "TITLE": invalid identifier
  
-- 7) 2,3 월을 추가하세요.
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '02월');
INSERT INTO pg(no , title) VALUES((SELECT NVL(MAX(no ), 0) +1 as no  FROM pg), '03월');
commit;

SELECT no, title FROM pg;
        NO TITLE               
---------- --------------------
         1 01월                
         4 04월                
         5 05월                
         6 06월                
         7 07월                
         8 08월                
         9 09월                
        10 10월                
        11 11월                
        12 12월                
        13 봄                  
        14 여름                
        15 가을                
        16 겨울                
        17 02월                
        18 03월                

-- 8) 목록 다시 출력, ☆ rownum이 생성되고 정렬 기능이 작동함
-- SELECT → ROWNUM 생성 → ORDER BY ~
SELECT no , title, rownum
FROM pg;

SELECT no , title, rownum
FROM pg
ORDER BY title ASC;
  
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월       15
  18 03월       16
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
  15 가을         2
  16 겨울         3
  13 봄          13
  14 여름        14

-- 9) Subquery의 사용  
-- Subquery에서 정렬후 테이블을 넘겨받아 rownum을 생성
SELECT no , title, rownum
FROM (
           SELECT no , title
           FROM pg
           ORDER BY title ASC
);
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월        2
  18 03월        3
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
  15 가을        13
  16 겨울        14
  13 봄          15
  14 여름        16
 
-- 10) 2단으로 레코드 분할시 문제점 발생 
-- 하나의 페이지는 레코드 3개로 구성
-- FROM -> WHERE -> SELECT
SELECT no , title, rownum
FROM (
           SELECT no , title
           FROM pg
           ORDER BY title ASC
)
WHERE rownum >= 1 AND rownum <= 3;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월        2
  18 03월        3
 
-- 2 페이지 출력시 출력 안되는 문제 발생 
-- FROM -> WHERE -> SELECT
SELECT no , title, rownum
FROM (
           SELECT no , title
           FROM pg
           ORDER BY title ASC
)
WHERE rownum >= 4 AND rownum <= 6;
 
 NUM TITLE ROWNUM
 --- ----- ------
 
SELECT no , title, rownum
FROM (
           SELECT no , title
           FROM pg
           ORDER BY title ASC
)
WHERE rownum <= 5;

        NO TITLE                    ROWNUM
---------- -------------------- ----------
         1 01월                          1
        17 02월                          2
        18 03월                          3
         4 04월                          4
         5 05월                          5

 
-- 11) Paging Step 3, subquery
-- 1 분기
SELECT no , title, r
FROM(
         SELECT no , title, rownum as r
         FROM (
                   SELECT no , title 
                   FROM pg
                   ORDER BY title ASC
         )  
)
WHERE r>=1 AND r <=3;
 
 NUM TITLE R
 --- ----- -
   1 01월   1
  17 02월   2
  18 03월   3
   
-- 2 분기
SELECT no , title, r
FROM(
         SELECT no , title, rownum as r
         FROM (
                   SELECT no , title 
                   FROM pg
                   ORDER BY title ASC
         )  
)
WHERE r>=4 AND r <=6;
   
 NUM TITLE R
 --- ----- -
   4 04월   4
   5 05월   5
   6 06월   6

-- 3 분기
SELECT no , title, r
FROM(
         SELECT no , title, rownum as r
         FROM (
                   SELECT no , title 
                   FROM pg
                   ORDER BY title ASC
         )  
)
WHERE r >= 7 AND r <= 9;

       NUM TITLE                      R
---------- -------------------- ----------
         7 07월                          7
         8 08월                          8
         9 09월                          9
 