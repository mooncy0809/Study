1. 테이블 구조
- PURGE 테이블 삭제시 휴지통에 버리지 말것, 즉시 삭제, 개발자 버전은 휴지통기능 지원 안함. 
DROP TABLE pay PURGE;
 
CREATE TABLE pay(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    sawon   VARCHAR(15) NOT NULL,  -- 사원명
    address VARCHAR(30) NOT NULL,  -- 주소
    gdate   DATE        NOT NULL,  -- 수령일
    bonbong NUMBER(8)   DEFAULT 0, -- 본봉  
    tax     NUMBER(7, 2)   DEFAULT 0, -- 세금, 전체 자리, +-99999.99
    bonus   NUMBER(7)       NULL,  -- 보너스
    PRIMARY KEY(payno)
);
  
2. 기초 데이터 추가: sysdate 객체는 ± 가능
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax, bonus)
VALUES(1, '가길동', '경기도 성남시', sysdate, 2100000, 12345.67, 0);
       
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax, bonus)
VALUES(2, '나길순', '경기도 성남시', sysdate-3, 2890000, 0, 300000);
 
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax)
VALUES(3, 'Lee Jung Jae', '경기도 부천시', sysdate-1, 4070000, 0);
 
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax)
VALUES(4,  'Jung Ho Yeon', '경기도 부천시', sysdate-0, 2960000, 0);
 
SELECT * FROM pay;

     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0           
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0

commit;
  
2. 컬럼 추가
ALTER TABLE pay
ADD (test VARCHAR2(9));
 
DESCRIBE pay;
  
3. 컬럼 속성 수정
ALTER TABLE pay
MODIFY (test VARCHAR2(30));
  
4. 컬럼명 수정
ALTER TABLE pay
RENAME COLUMN test to test2;
  
5. 컬럼 삭제
ALTER TABLE pay
DROP COLUMN test2;
 
6. 테이블 삭제
DROP TABLE pay;
 
-- DROP TABLE pay PURGE; -- 테이블 완전 삭제

7. 테이블 복구(11g XE 지원 안함, 18c XE 지원)
FLASHBACK TABLE pay TO BEFORE DROP;
 
SELECT * FROM pay;
 
8. 휴지통 비우기(11g XE 지원 안함, 18c XE 지원)
- 삭제된 테이블 완전 삭제, 복구 불가능
 
PURGE RECYCLEBIN;



[02] 함수의 사용
     - 레코드 단위로 함수가 적용 됩니다.
     - 테스트 데이터

DROP TABLE pay PURGE;
 
CREATE TABLE pay(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    sawon   VARCHAR(15) NOT NULL,  -- 사원명
    address VARCHAR(30) NOT NULL,  -- 주소
    gdate   DATE        NOT NULL,  -- 수령일
    bonbong NUMBER(8)   DEFAULT 0, -- 본봉  
    tax     NUMBER(7, 2)   DEFAULT 0, -- 세금, 전체 자리, +-99999.99
    bonus   NUMBER(7)       NULL,  -- 보너스
    PRIMARY KEY(payno)
);

INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax, bonus)
VALUES(1, '가길동', '경기도 성남시', '2022-04-27', 2100000, 12345.67, 0); -- 2022-04-20 12:00:00
       
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax, bonus)
VALUES(2, '나길순', '경기도 성남시', '2022-04-24 10:16:50', 2890000, 0, 300000); -- string -> date
 
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax)
VALUES(3, 'Lee Jung Jae', '경기도 부천시', '2022-04-26 10:16:50', 4070000, 0);
 
INSERT INTO pay(payno, sawon, address, gdate, bonbong, tax)
VALUES(4,  'Jung Ho Yeon', '경기도 부천시', '2022-04-27 10:16:50', 2960000, 0);

COMMIT;

SELECT * FROM pay;

     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2100000   12345.67          0
         2 나길순          경기도 성남시                  2022-04-24 10:16:50    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                  2022-04-26 10:16:50    4070000          0           
         4 Jung Ho Yeon    경기도 부천시                  2022-04-27 10:16:50    2960000          0           
    
1. UPPER, LOWER
 
-- 소문자로 변경
SELECT payno, LOWER(sawon), address, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO LOWER(SAWON)    ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         4 jung ho yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0           
         3 lee jung jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0           
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0     300000
         
-- 대문자로 변경
SELECT payno, UPPER(sawon), address, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO UPPER(SAWON)    ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         4 JUNG HO YEON    경기도 부천시                  2021-09-29 03:42:59    2960000          0           
         3 LEE JUNG JAE    경기도 부천시                  2021-09-28 03:42:59    4070000          0           
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0     300000
 
2. CONCAT(2개의 컬럼만 결합 가능)
SELECT payno, CONCAT(sawon, '-' || address), gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO CONCAT(SAWON,'-'||ADDRESS)                     GDATE                  BONBONG        TAX      BONUS
---------- ---------------------------------------------- ------------------- ---------- ---------- ----------
         4 Jung Ho Yeon-경기도 부천시                     2021-09-29 03:42:59    2960000          0           
         3 Lee Jung Jae-경기도 부천시                     2021-09-28 03:42:59    4070000          0           
         1 가길동-경기도 성남시                           2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순-경기도 성남시                           2021-09-26 03:42:59    2890000          0     300000

-- 함수를 사용한 경우는 컬럼 별명(alias)을 반드시 선언 할 것 ★
SELECT payno, CONCAT(sawon, '-' || address) as name, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO NAME                                           GDATE                  BONBONG        TAX      BONUS
---------- ---------------------------------------------- ------------------- ---------- ---------- ----------
         4 Jung Ho Yeon-경기도 부천시                     2021-09-29 03:42:59    2960000          0           
         3 Lee Jung Jae-경기도 부천시                     2021-09-28 03:42:59    4070000          0           
         1 가길동-경기도 성남시                           2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순-경기도 성남시                           2021-09-26 03:42:59    2890000          0     300000
 
3. SUBSTR, index는 1부터 시작
-- 3번째 문자부터 출력, 시작 index는 1
SELECT payno, SUBSTR(address, 3) as address, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO ADDRESS                      GDATE                  BONBONG        TAX      BONUS
---------- ---------------------------- ------------------- ---------- ---------- ----------
         4 도 부천시                    2021-09-29 03:42:59    2960000          0           
         3 도 부천시                    2021-09-28 03:42:59    4070000          0           
         1 도 성남시                    2021-09-29 03:42:59    2100000   12345.67          0
         2 도 성남시                    2021-09-26 03:42:59    2890000          0     300000
  
-- 1번째 기준 3개의 문자 출력
SELECT payno, SUBSTR(address, 1, 3) as address, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO ADD GDATE                  BONBONG        TAX      BONUS
---------- --- ------------------- ---------- ---------- ----------
         4 경기도 2021-09-29 03:42:59    2960000          0           
         3 경기도 2021-09-28 03:42:59    4070000          0           
         1 경기도 2021-09-29 03:42:59    2100000   12345.67          0
         2 경기도 2021-09-26 03:42:59    2890000          0     300000
 
-- 2번째 기준 4개의 문자 출력
SELECT payno, SUBSTR(address, 2, 4) as address, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO ADDR GDATE                  BONBONG        TAX      BONUS
---------- ---- ------------------- ---------- ---------- ----------
         4 기도 부 2021-09-29 03:42:59    2960000          0           
         3 기도 부 2021-09-28 03:42:59    4070000          0           
         1 기도 성 2021-09-29 03:42:59    2100000   12345.67          0
         2 기도 성 2021-09-26 03:42:59    2890000          0     300000
 
4. LENGTH
SELECT payno, sawon, LENGTH(sawon) as len, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO SAWON          LEN GDATE                  BONBONG        TAX      BONUS
---------- --------------- ---------- ------------------- ---------- ---------- ----------
         4 Jung Ho Yeon       12  2021-09-29 03:42:59    2960000          0           
         3 Lee Jung Jae         12  2021-09-28 03:42:59    4070000          0           
         1 가길동                  3   2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순                  3   2021-09-26 03:42:59    2890000          0     300000
         
5. INSTR: 특정 문자의 검색, index는 1부터 시작, 존재하지 않으면 0
SELECT payno, address, INSTR(address, '천') as idx, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO ADDRESS                               IDX GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------ ---------- ------------------- ---------- ---------- ----------
         4 경기도 부천시                           6 2021-09-29 03:42:59    2960000          0           
         3 경기도 부천시                           6 2021-09-28 03:42:59    4070000          0           
         1 경기도 성남시                           0 2021-09-29 03:42:59    2100000   12345.67          0
         2 경기도 성남시                           0 2021-09-26 03:42:59    2890000          0     300000
         
SELECT payno, address, INSTR(address, '부천') as idx, gdate, bonbong, tax, bonus
FROM pay
ORDER BY sawon ASC;
     PAYNO ADDRESS                               IDX GDATE                  BONBONG        TAX      BONUS
---------- ------------------------------ ---------- ------------------- ---------- ---------- ----------
         4 경기도 부천시                           5 2021-09-29 03:42:59    2960000          0           
         3 경기도 부천시                           5 2021-09-28 03:42:59    4070000          0           
         1 경기도 성남시                           0 2021-09-29 03:42:59    2100000   12345.67          0
         2 경기도 성남시                           0 2021-09-26 03:42:59    2890000          0     300000
 
6. LPAD, RPAD 참고
SELECT bonbong, LPAD(bonbong, 10, 0) as bon
FROM pay
ORDER BY sawon ASC;
   BONBONG BON       
---------- ----------
   2960000 0002960000
   4070000 0004070000
   2100000 0002100000
   2890000 0002890000
   
SELECT address, LPAD(address, 20, 0) as bon
FROM pay
ORDER BY sawon ASC;
DDRESS                        BON                 
------------------------------ --------------------
경기도 부천시                  0000000경기도 부천시
경기도 부천시                  0000000경기도 부천시
경기도 성남시                  0000000경기도 성남시
경기도 성남시                  0000000경기도 성남시
 
SELECT bonbong, RPAD(bonbong, 10, 0) as bon
FROM pay
ORDER BY sawon ASC;
   BONBONG BON       
---------- ----------
   2960000 2960000000
   4070000 4070000000
   2100000 2100000000
   2890000 2890000000
   
-- 부족한 자리는 '*'로 지정 
SELECT bonbong, LPAD(bonbong, 10, '*')  as bon
FROM pay
ORDER BY sawon ASC;
   BONBONG BON       
---------- ----------
   2960000 ***2960000
   4070000 ***4070000
   2100000 ***2100000
   2890000 ***2890000
   
7. REPLACE
- REPLACE(컬럼명, 변경할 문자열, 최종 변경된 문자열)
SELECT * FROM pay;

-- 실행 순서(FWSO): FROM -> WHERE -> SELECT -> ORDER BY
SELECT payno, address, REPLACE(address, '부천시', '파주시') as ADDR
FROM pay
WHERE address LIKE '%부천%'
ORDER BY sawon ASC;
    PAYNO ADDRESS                        ADDR             
---------- ------------------------------ ---------------------
         4 경기도 부천시                  경기도 파주시     
         3 경기도 부천시                  경기도 파주시       

8. ROUND
SELECT * FROM dual;  -- SQL 형식을 만들기위한 시스템 테이블, FROM을 생략할 수 없음.
D
-
X

-- 소수 둘째 자리까지 반올림
SELECT ROUND(55.634, 2), ROUND(55.635, 2)
FROM dual;
ROUND(55.634,2)   ROUND(55.635,2)
---------------         ---------------
          55.63           55.64
 
-- 정수 영역 반올림
-- -1: 1의 자리, -2: 10의 자리에서 반올림
SELECT ROUND(23541, -1), ROUND(23541.25, -2), ROUND(23551.25, -2)
FROM dual;
ROUND(23541,-1)   ROUND(23541.25,-2)   ROUND(23551.25,-2)
---------------          ------------------           ------------------
          23540               23500                       23600
 
9. TO_CHAR(): 날짜의 출력 및 비교
-- 현재 날짜 출력
SELECT sysdate FROM dual;
 
-- 2021-09-29일에 급여를 받는 사람 출력
SELECT gdate, SUBSTR(gdate, 1, 10) as rdate
FROM pay;
GDATE                      RDATE     
-------------------         ----------
2022-04-27 10:16:50    2022-04-27
2022-04-24 10:16:50    2022-04-24
2022-04-26 10:16:50    2022-04-26
2022-04-27 10:16:50    2022-04-27

SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) = '2022-04-27';
    PAYNO ADDRESS                      RDATE     
---------- ------------------------------ ----------
         1 경기도 성남시                  2022-04-27
         4 경기도 부천시                  2022-04-27

SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) < '2022-04-27';
     PAYNO ADDRESS                        RDATE     
---------- ------------------------------ ----------
         2 경기도 성남시                  2022-04-24
         3 경기도 부천시                  2022-04-26
         
SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) > '2022-04-26';
     PAYNO ADDRESS                        RDATE     
---------- ------------------------------ ----------
         1 경기도 성남시                  2022-04-27
         4 경기도 부천시                  2022-04-27
         
SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) >= '2022-04-26';
     PAYNO ADDRESS                        RDATE     
---------- ------------------------------ ----------
         1 경기도 성남시                  2022-04-27
         3 경기도 부천시                  2022-04-26
         4 경기도 부천시                  2022-04-27
         
SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) > "2022-04-27";  -- "" ERROR

SELECT payno, address, SUBSTR(gdate, 1, 10) as rdate
FROM pay
WHERE SUBSTR(gdate, 1, 10) >= '2022-04-25' AND SUBSTR(gdate, 1, 10) <= '2022-04-26'
     PAYNO ADDRESS                        RDATE     
---------- ------------------------------ ----------
         3 경기도 부천시                  2022-04-26

SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd') as rdate
FROM pay;
GDATE                     RDATE     
-------------------        ----------
2022-04-27 10:16:50   2022-04-27
2022-04-24 10:16:50   2022-04-24
2022-04-26 10:16:50   2022-04-26
2022-04-27 10:16:50   2022-04-27
 
-- 형식 적용
SELECT gdate, TO_CHAR(gdate, 'yyyy-mm-dd hh:mi:ss') as newgdate
FROM pay;
GDATE                      NEWGDATE           
-------------------         -------------------
2022-04-27 10:16:50    2022-04-27 10:16:50
2022-04-24 10:16:50    2022-04-24 10:16:50
2022-04-26 10:16:50    2022-04-26 10:16:50
2022-04-27 10:16:50    2022-04-27 10:16:50
  
SELECT * FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2100000   12345.67          0
         2 나길순          경기도 성남시                  2022-04-24 10:16:50    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                2022-04-26 10:16:50    4070000          0           
         4 Jung Ho Yeon    경기도 부천시              2022-04-27 10:16:50    2960000          0         
 
-- SUBSTR등으로 가공되지 않은 날짜 컬럼을 문자열과 비교 할 수 없음, 에러는 발생 안됨. ★
SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE gdate = '2022-04-27 12:00:00';
 
-- TO_CHAR() 함수를 통한 문자열 형변환, SQL tool의 영향을 받음.
SELECT payno, sawon, address, gdate, TO_CHAR(gdate), bonbong, tax, bonus
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE               TO_CHAR(GDATE)         BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00   04/27/22 12:00:00    2100000   12345.67          0
         2 나길순          경기도 성남시                  2022-04-24 10:16:50   04/24/22 10:16:50    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                2022-04-26 10:16:50   04/26/22 10:16:50    4070000          0           
         4 Jung Ho Yeon    경기도 부천시              2022-04-27 10:16:50   04/27/22 10:16:50    2960000          0      

-- TO_CHAR() 함수를 통한 문자열 형변환, 형식을 지정함으로 SQL tool의 영향을 받지 않음.
SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh:mi:ss') = '2022-04-27 12:00:00'; -- DATE -> String
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2100000   12345.67          0    

SELECT payno, sawon, address, gdate, TO_CHAR(gdate, 'yyyy-mm-dd hh24'), bonbong, tax, bonus
FROM pay
     PAYNO SAWON           ADDRESS                        GDATE               TO_CHAR(GDATE    BONBONG        TAX      BONUS
---------- --------------- ------------------------------ -------------------         ------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2022-04-27 00    2100000   12345.67          0
         2 나길순          경기도 성남시                  2022-04-24 10:16:50    2022-04-24 10    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                2022-04-26 10:16:50    2022-04-26 10    4070000          0           
         4 Jung Ho Yeon    경기도 부천시              2022-04-27 10:16:50    2022-04-27 10    2960000          0           

SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh') = '2022-04-27 12';
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2100000   12345.67          0

SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE TO_CHAR(gdate, 'yyyy-mm-dd hh24') = '2022-04-27 00';
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2022-04-27 12:00:00    2100000   12345.67          0

-- 설계시 시간을 12시간 단위인지, 24시간 단위인지 결정 할 것, 시간 단위를 변경하는 것은 권장하지 않음.         
  
10. 두 날짜 사이의 차 출력
    - sysdate+1: 오늘 날짜에 1일을 더함
   
SELECT sysdate + 1 FROM dual;
SELECT sysdate + 5 FROM dual;
SELECT sysdate - 1 FROM dual;

-- 1달을 31로 지정하고 나누기하여 차이값을 산출(2월, 3월 월별 날짜 비중 없음) 
SELECT sysdate+1, sysdate 
FROM dual;
SYSDATE+1               SYSDATE            
-------------------         -------------------
2022-04-28 12:09:22    2022-04-27 12:09:22

SELECT MONTHS_BETWEEN(sysdate+1, sysdate) 
FROM dual;

MONTHS_BETWEEN(SYSDATE+1,SYSDATE) -- 날짜와 날짜 사이의 사잇값.
---------------------------------
                      .0322580645
                      
-- 2022 4월: 30 * .0322580645 = .967741935:
SELECT 30 * .0322580645 as mon FROM dual;
       MON
------------
.967741935

SELECT 31 * .0322580645 as mon FROM dual;
       MON
------------
1
 
SELECT MONTHS_BETWEEN(sysdate+30, sysdate) 
FROM dual;

 MONTHS_BETWEEN(SYSDATE+30,SYSDATE)
----------------------------------
                                 1
                                 
SELECT MONTHS_BETWEEN(sysdate+45, sysdate) 
FROM dual;

MONTHS_BETWEEN(SYSDATE+45,SYSDATE)
----------------------------------
                        1.48387097

-- 2월달로 변경한 경우
C:\Windows\system32>date
현재 날짜: 2022-04-27
새로운 날짜를 입력하십시오: (년-월-일) 2022-02-25
SELECT sysdate FROM dual;
SYSDATE            
-------------------
2022-02-25 12:42:06

SELECT MONTHS_BETWEEN(sysdate+1, sysdate) 
FROM dual;
MONTHS_BETWEEN(SYSDATE+1,SYSDATE)
---------------------------------
                      .0322580645  <- 4월 기준: .0322580645
-- 2월은 28일, 4월은 30이나 하루의 비중이 .0322580645로 같음
SELECT 28 * .0322580645 as mon FROM dual;  -- .903225806
SELECT 30 * .0322580645 as mon FROM dual;  -- .967741935
SELECT 31 * .0322580645 as mon FROM dual;  -- 1

SELECT 1 / 28 as mon FROM dual;  -- .0357142857 2월 기준으로 예상했으나 다르게 출력
SELECT 1 / 30 as mon FROM dual;  -- .0333333333 4월 기준으로 예상했으나 다르게 출력

SELECT payno, sawon, MONTHS_BETWEEN(gdate, sysdate) as period
FROM pay;
 PAYNO SAWON                 PERIOD
---------- ---------------         ----------
         1 가길동                   0
         2 나길순                  -0.100340875
         3 Lee Jung Jae          -0.0358247461
         4 Jung Ho Yeon         0
         
-- 특정 날짜 기준 1일 이전 자료 검색                        
SELECT payno, sawon, MONTHS_BETWEEN(gdate, sysdate) as period, gdate
FROM pay
WHERE MONTHS_BETWEEN(gdate, sysdate) < -0.0322580645;
 PAYNO SAWON               PERIOD      GDATE              
---------- --------------- ---------- -------------------
         2 나길순            -0.100465203   2022-04-24 10:16:50
         3 Lee Jung Jae    -0.0359490741  2022-04-26 10:16:50
         
-- 특정 날짜 기준 2일 이전 자료 검색                        
SELECT payno, sawon, MONTHS_BETWEEN(gdate, sysdate) as period, gdate
FROM pay
WHERE MONTHS_BETWEEN(gdate, sysdate) < (-0.0322580645*2);
  PAYNO SAWON               PERIOD     GDATE              
---------- --------------- ---------- -------------------
         2 나길순          -0.100452136     2022-04-24 10:16:50


-- 현재 날짜 기준 이전 2달간의 자료 검색 예) 현재 4월 27인 경우: 2월 27일 ~ 4월 27일까지 조회
SELECT payno, sawon, MONTHS_BETWEEN(sysdate, gdate) as period, gdate
FROM pay
     PAYNO SAWON     PERIOD GDATE              
---------- --------------- ---------- -------------------
         1 가길동             0 2022-04-27 12:00:00
         2 나길순             .100602972 2022-04-24 10:16:50  -- 현재 날짜 기준 이전 날짜와의 차이를 양수로 계산
         3 Lee Jung Jae     .0360868429 2022-04-26 10:16:50
         4 Jung Ho Yeon    0 2022-04-27 10:16:50

SELECT payno, sawon, MONTHS_BETWEEN(sysdate, gdate) as period, gdate
FROM pay
WHERE MONTHS_BETWEEN(sysdate, gdate) < 2;
     PAYNO SAWON              PERIOD         GDATE              
---------- ---------------          ----------        -------------------
         1 가길동                   0                  2022-04-27 12:00:00
         2 나길순                   .10066943      2022-04-24 10:16:50
         3 Lee Jung Jae           .0361533005   2022-04-26 10:16:50
         4 Jung Ho Yeon         0                  2022-04-27 10:16:50
         
11. 월 더하기
SELECT ADD_MONTHS(sysdate, 1) FROM dual;
ADD_MONTHS(SYSDATE,
-------------------
2021-10-29 04:52:44

SELECT payno, sawon, gdate
FROM pay
WHERE gdate >= (sysdate-1);
     PAYNO SAWON           GDATE              
---------- --------------- -------------------
         1 가길동          2021-09-29 03:42:59
         4 Jung Ho Yeon    2021-09-29 03:42:59
         
-- 하루 이전부터 1달간의 등록 자료 검색
SELECT payno, sawon, gdate
FROM pay
WHERE (gdate >= sysdate-1) AND (gdate <= ADD_MONTHS(sysdate, 1));
     PAYNO SAWON           GDATE              
---------- --------------- -------------------
         1 가길동          2021-09-29 03:42:59
         4 Jung Ho Yeon    2021-09-29 03:42:59
         
12. 돌아오는 월요일의 날짜 출력
SELECT NEXT_DAY(sysdate, '월요일') as nextday FROM dual;
 
13. 이번달의 마지막날 출력
SELECT LAST_DAY(sysdate) as lastday FROM dual;

14. TO_DATE
SELECT TO_DATE('2021-09-29 04:05:01') as rdate FROM dual;
RDATE              
-------------------
2021-09-29 04:05:01

SELECT TO_DATE('2021-09-29 04:05:01', 'yyyy-mm-dd hh:mi:ss') as rdate FROM dual;
RDATE              
-------------------
2021-09-29 04:05:01

SELECT TO_DATE('2021-09-29 16:05:01', 'yyyy-mm-dd hh24:mi:ss') as rdate FROM dual;
RDATE              
-------------------
2021-09-29 04:05:01   <- Tool 설저에 따라서 다르게 출력됨.

SELECT TO_DATE('2021-09-29 04:05:01', 'yyyy-mm-dd') as rdate FROM dual;  -- X

SELECT TO_DATE('2021-09-29', 'yyyy-mm-dd') as rdate FROM dual; 
RDATE              
-------------------
2021-09-29 12:00:00


15. TO_CHAR
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh:mi:ss') as rdate FROM dual;
RDATE              
-------------------
2021-09-29 05:07:08
 
SELECT TO_CHAR(sysdate, 'yyyy-mm-dd hh24:mi:ss') as rdate FROM dual;
RDATE              
-------------------
2021-09-29 17:07:29

-- 나머지 문자열 0으로 채움, 9: 숫자
SELECT TO_CHAR(1500, '0999999') FROM dual;
 
-- 천단위 구분자 출력
SELECT TO_CHAR(150000, '999,999') as sale FROM dual;
SALE    
--------
 150,000
 
-- 출력 형식보다 값이 크면 '# 출력
SELECT TO_CHAR(150000, '9,999') as sale FROM dual;
SALE  
------
######

-- 부호 출력
SELECT TO_CHAR(150000, 'S999,999') as sale FROM dual;
SALE    
--------
+150,000

SELECT TO_CHAR(-150000, 'S999,999') as sale FROM dual;
SALE    
--------
-150,000

SELECT TO_CHAR(1500.55, '9,999.99') as sale FROM dual;
SALE     
---------
 1,500.55
 
-- 소수점 자리수가 작으면 자동 반올림
SELECT TO_CHAR(1500.55, '9,999.9') as sale FROM dual;
SALE    
--------
 1,500.6
 
-- 소수점 자리수가 작으면 0으로 채워짐.
SELECT TO_CHAR(1500.5, '9,999.999') as sale FROM dual;
SALE      
----------
 1,500.500
 
16. NVL 함수
SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0              300000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0            null   
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0          null 

-- null 컬럼은 산술연산을해도 null임, 수당 못받는 사람 발생
SELECT payno, sawon, address, gdate, bonbong, tax, bonus + 300000
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG      TAX     BONUS+300000
---------- --------------- ------------------------------ ------------------- ---------- ---------- ------------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67        300000
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0            600000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0          null    
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0        null     
 
-- null이 아니면 컬럼 값을 그대로 사용하나 null이면 값을 0으로 변경
SELECT payno, sawon, address, gdate, bonbong, tax, NVL(bonus, 0) + 500000 as bonus
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG      TAX   BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67      500000
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0          800000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0        500000
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0      500000
 
 
16. TRUNC() 함수를 이용한 소수점 이하 삭제
 
-- 정수만 출력
SELECT tax, TRUNC(tax, 0) as tax
FROM pay;
       TAX        TAX
---------- ----------
  12345.67      12345
         0          0
         0          0
         0          0
 
-- 소수 첫째 자리만 출력, 반올림 안됨
SELECT tax, TRUNC(tax, 1) as tax
FROM pay;
 
-- 10의자리부터 출력, 1의자리 이하 삭제, 반올림 안됨
SELECT TRUNC(tax, -1) as tax
FROM pay;
       TAX
----------
     12340
         0
         0
         0
         
-- 함수의 중첩, 12,340
SELECT tax, TRUNC(tax, -1), TO_CHAR(TRUNC(tax, -1), '9,999,999') as tax
FROM pay;
       TAX     TRUNC(TAX,-1)    TAX       
----------      -------------         ----------
  12345.67         12340          12,340
         0             0                 0
         0             0                 0
         0             0                 0
         
17. CASE 문
SELECT payno, sawon, address, gdate, bonbong, tax,
       CASE WHEN bonbong <= 2000000   THEN bonbong * 0.5
                WHEN bonbong <= 3000000  THEN bonbong * 0.4
                WHEN bonbong <= 4000000  THEN bonbong * 0.3
       ELSE bonbong*0.1 END xmasbonus -- xmas-bonus: 컬럼명 지정 불가능
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX  XMASBONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동               경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67     840000
         2 나길순              경기도 성남시                  2021-09-26 03:42:59    2890000          0        1156000
         3 Lee Jung Jae      경기도 부천시                  2021-09-28 03:42:59    4070000          0          407000
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0        1184000


SELECT payno, sawon, address, gdate, bonbong, tax,
       CASE part WHEN '개발팀'     THEN bonbong * 0.5
                     WHEN 'DB설계팀' THEN bonbong * 0.4
                     WHEN '디자인팀' THEN bonbong * 0.3
       ELSE bonbong*0.1 END xmasbonus -- xmas-bonus: 컬럼명 지정 불가능
FROM pay;
 
18. null 컬럼값의 검색

SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0             300000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0           null
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0         null
 
-- 인센티브를 받지 못하는 직원 출력, null 비교 안됨
SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE bonus = null;

-- is 명령어 
SELECT payno, sawon, address, gdate, bonbong, tax, bonus
FROM pay
WHERE bonus is null;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000           0           null
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0           null
 
-- bonus 컬럼의 값중에 null은 카운트 안됨
SELECT COUNT(bonus) as cnt
FROM pay;
       CNT
----------
         2
 
-- 인센티브를 받지 못하는 직원의 수, null  컬럼의 수, *: 특정 컬럼의 영향을 받지 않음. 
SELECT COUNT(*) as cnt
FROM pay
WHERE bonus is null;
       CNT
----------
         2
  
  
  
  
-------------------------------------------------------------------------------------