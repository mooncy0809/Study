CREATE TABLE sales(
  salesno  NUMBER(8)      NOT NULL, -- 판매 번호
  product  VARCHAR(20)   NOT NULL, -- 상품명
  price     NUMBER(8)      NOT NULL, -- 가격
  cnt       NUMBER(5)       NOT NULL, -- 주문 수량
  dc        NUMBER(5, 2)    NOT NULL, -- 할인율, 정수 3자리, 소수 2자리
  rdate    DATE                NOT NULL, -- 주문 날짜
  etc       VARCHAR(20)          NULL, -- 기타 주문 사항
  PRIMARY KEY(salesno)
);

DROP TABLE sales;

CREATE SEQUENCE sales_seq
  START WITH 1           -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 99999999 -- 최대값: 99999999 --> NUMBER(8) 대응
  CACHE 2                  -- 2번은 메모리에서만 계산
  NOCYCLE;                -- 다시 1부터 생성되는 것을 방지
  
DROP SEQUENCE sales_seq;

-- NULL 허용하는 etc 컬럼 생략
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 500000, 1, 10.0, sysdate);

INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '해외여행', 1200000, 1, 5.0, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;

-- ORA-01400: cannot insert NULL into ("KD1"."SALES"."PRODUCT")         
-- NOT NULL 속성은 INSERT시에 반드시 값이 있어야함.
INSERT INTO sales(salesno, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, 2000000, 1, 5.0, sysdate);

-- 큰 정수인 경우 에러 발생
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
-- ORA-01438: value larger than specified precision allowed for this column
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 300000, 1, 1000.01, sysdate);

-- 소수 자리수가 큰 경우 
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 450000, 1, 10.001, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;
   SALESNO PRODUCT         PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 국내여행                 500000         1         10  2021-09-28 03:41:57                     
         2 해외여행                1200000        1          5  2021-09-28 03:41:57                     
         5 국내여행                 450000         1         10  2021-09-28 03:46:58                     
         
-- 소수 자리수 반올림 발생   
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 550000, 1, 10.005, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 국내여행                 500000          1         10 2021-09-28 03:41:57                     
         2 해외여행                1200000          1          5 2021-09-28 03:41:57                     
         5 국내여행                 450000          1         10 2021-09-28 03:46:58                     
         6 국내여행                 550000          1      10.01 2021-09-28 03:50:24                    
         
-- 최대값
-- dc        NUMBER(5, 2)    NOT NULL, -- 할인율
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '국내여행', 650000, 1, 999.99, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;         
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 국내여행                 500000          1         10 2021-09-28 03:41:57                     
         2 해외여행                1200000          1          5 2021-09-28 03:41:57                     
         5 국내여행                 450000          1         10 2021-09-28 03:46:58                     
         6 국내여행                 550000          1      10.01 2021-09-28 03:50:24                     
         7 국내여행                 650000          1     999.99 2021-09-28 03:52:01        
         
DELETE FROM sales WHERE salesno=5 OR salesno=6;

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;    
   SALESNO PRODUCT        PRICE            CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 국내여행                 500000          1          10  2021-09-28 03:41:57                     
         2 해외여행                1200000          1           5  2021-09-28 03:41:57                     
         7 국내여행                 650000          1     999.99  2021-09-28 03:52:01               
         
-- 최소값
INSERT INTO sales(salesno, product, price, cnt, dc, rdate)
VALUES(sales_seq.nextval, '대룡시장', 150000, 1, -999.99, sysdate);

SELECT salesno, product, price, cnt, dc, rdate, etc
FROM sales
ORDER BY salesno;
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 국내여행                 500000          1         10 2021-09-28 03:41:57                     
         2 해외여행                1200000          1          5 2021-09-28 03:41:57                     
         7 국내여행                 650000          1     999.99 2021-09-28 03:52:01                     
         8 대룡시장                 150000          1    -999.99 2021-09-28 03:55:31         
         
 
-- 문자 코드순 정렬
SELECT salesno, product, price, cnt, dc, rdate
FROM sales
ORDER BY product ASC;        
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE              
---------- -------------------- ---------- ---------- ---------- -------------------
         1 국내여행                 500000          1         10 2021-09-28 03:41:57
         7 국내여행                 650000          1     999.99 2021-09-28 03:52:01
         8 대룡시장                 150000          1    -999.99 2021-09-28 03:55:31
         2 해외여행                1200000          1          5 2021-09-28 03:41:57
         
-- 2차 정렬: 1차 정렬 결과는 고정되고, 같은 1차 정렬안에서 2차 정렬이 발생함.
SELECT salesno, product, price, cnt, dc, rdate
FROM sales
ORDER BY product ASC, price DESC;
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE              
---------- -------------------- ---------- ---------- ---------- -------------------
         7 국내여행                 650000          1     999.99 2021-09-28 03:52:01
         1 국내여행                 500000          1         10 2021-09-28 03:41:57
         8 대룡시장                 150000          1    -999.99 2021-09-28 03:55:31
         2 해외여행                1200000          1          5 2021-09-28 03:41:57
         
-- '여행'이란 단어가 들어간 레코드 검색
SELECT salesno, product, price, cnt, dc
FROM sales
WHERE product LIKE '여행'  -- 선택된 행 없음, 정확히 일치
ORDER BY salesno;

SELECT salesno, product, price, cnt, dc
FROM sales
WHERE product LIKE '%여행%'  -- 여행이란 단어 등장시 모두 포함.
ORDER BY salesno;

UPDATE sales SET product='여행은 재충전', dc=5.5 WHERE salesno=1;
UPDATE sales SET product='여행은  재충전', dc=5.5 WHERE salesno=1;
UPDATE sales SET product='여행은   재충전', dc=5.5 WHERE salesno=1; -- 공백 3개, 한글 6개
-- ORA-12899: "KD1"."SALES"."PRODUCT" 열에 대한 값이 너무 큼(실제: 21, 최대값: 20)

SELECT salesno, product, price, cnt, dc
FROM sales;
   SALESNO PRODUCT                   PRICE        CNT         DC
---------- -------------------- ---------- ---------- ----------
         1 여행은 재충전            500000          1        5.5
         2 해외여행                1200000          1          5
         7 국내여행                 650000          1     999.99
         8 대룡시장                 150000          1    -999.99
         

-- '여행'으로 시작하는 레코드 출력
SELECT * FROM sales  WHERE product LIKE '여행%';
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         1 여행은 재충전            500000          1        5.5 2021-09-28 03:41:57              
         
-- '여행'으로 끝나는 레코드 출력
SELECT * FROM sales  WHERE product LIKE '%여행';
   SALESNO PRODUCT                   PRICE        CNT         DC RDATE               ETC                 
---------- -------------------- ---------- ---------- ---------- ------------------- --------------------
         2 해외여행                1200000          1          5 2021-09-28 03:41:57                     
         7 국내여행                 650000          1     999.99 2021-09-28 03:52:01                     

-- '시장' 이란 단어와(AND) 금액이 20만원 이하인 레코드, FROM -> WHERE -> SELECT
SELECT salesno, product, price, cnt, dc
FROM sales 
WHERE product LIKE '%시장%' AND price <= 200000;

   SALESNO PRODUCT         PRICE        CNT         DC
---------- -------------------- ---------- ---------- ----------
         8 대룡시장                 150000          1    -999.99

-- '여행'이란 단어가 들어간 상품중에 금액이 500000 ~ 1000000 인 상품 출력
SELECT salesno, product, price, cnt, dc
FROM sales 
WHERE product LIKE '%여행%' AND price >= 500000 AND price <= 1000000;
   SALESNO PRODUCT                   PRICE        CNT         DC
---------- -------------------- ---------- ---------- ----------
         1 여행은 재충전            500000          1        5.5
         7 국내여행                 650000          1     999.99
         
SELECT salesno, product, price, cnt, dc
FROM sales 
WHERE product LIKE '%여행%' AND price BETWEEN 500000 AND 1000000;
   SALESNO PRODUCT                   PRICE        CNT         DC
---------- -------------------- ---------- ---------- ----------
         1 여행은 재충전            500000          1        5.5
         7 국내여행                 650000          1     999.99
         
-- UPDATE
-- WHERE 조건이 없는 수정은 모든 레코드가 변경됨(권장아님). 
UPDATE sales SET etc='여행사 안내';

SELECT salesno, product, price, cnt, dc, etc FROM sales ORDER BY salesno;
   SALESNO PRODUCT                   PRICE        CNT         DC  ETC                 
---------- -------------------- ---------- ---------- ---------- --------------------
         1 여행은 재충전            500000          1        5.5   여행사 안내         
         2 해외여행                1200000          1          5    여행사 안내         
         7 국내여행                 650000          1     999.99  여행사 안내         
         8 대룡시장                 150000          1    -999.99  여행사 안내   
         
UPDATE sales 
SET etc='마니산 등산' 
WHERE salesno=8;

SELECT salesno, product, price, cnt, dc, etc FROM sales WHERE salesno = 8;         
   SALESNO PRODUCT                   PRICE        CNT         DC ETC                 
---------- -------------------- ---------- ---------- ---------- --------------------
         8 대룡시장                 150000          1    -999.99 마니산 등산         
         
-- 삭제
-- DELETE FROM sales; -- 모든 레코드 삭제, 권장하지 않음
DELETE FROM sales WHERE salesno=1;

SELECT salesno, product, price, cnt, dc, etc FROM sales ORDER BY salesno;
   SALESNO PRODUCT                   PRICE        CNT         DC ETC                 
---------- -------------------- ---------- ---------- ---------- --------------------
         2 해외여행                1200000          1          5 여행사 안내         
         7 국내여행                 650000          1     999.99 여행사 안내         
         8 대룡시장                 150000          1    -999.99 마니산 등산       
         
-- 범위를 지정한 삭제
DELETE FROM sales WHERE salesno >= 2 AND salesno <= 5;

SELECT salesno, product, price, cnt, dc, etc FROM sales ORDER BY salesno;
   SALESNO PRODUCT                   PRICE        CNT         DC ETC                 
---------- -------------------- ---------- ---------- ---------- --------------------
         7 국내여행                 650000          1     999.99 여행사 안내         
         8 대룡시장                 150000          1    -999.99 마니산 등산         