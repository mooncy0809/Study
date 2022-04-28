1. AVG(), MAX(), MIN(), SUM()
SELECT * FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67          0
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0     300000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0           null
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0           null
         
SELECT AVG(bonbong) as 평균, MAX(bonbong) as 최대값, MIN(bonbong) as 최소값, SUM(bonbong) as 합계
FROM pay;
        평균        최대값        최소값         합계
  ----------     ---------- ---------- ----------
   3005000    4070000    2100000   12020000
    
SELECT sawon
FROM pay;
SAWON          
---------------
가길동
나길순
Lee Jung Jae
Jung Ho Yeon

SELECT AVG(bonbong), SUM(bonbong)
FROM pay;
AVG(BONBONG) SUM(BONBONG)
------------          ------------
     3005000       12020000

-- 그룹화 함수는 일반 컬럼과 같이 사용할 수 없습니다.
-- 어떤 사원에 대한 평균과 합계인지 구분이 모호함!!! ERROR.
SELECT sawon, AVG(bonbong), SUM(bonbong)
FROM pay;
 
2. MAX(), MIN()
SELECT * FROM pay;

-- 날짜 최대 최소 
SELECT MAX(gdate), MIN(gdate) FROM pay;
MAX(GDATE)          MIN(GDATE)         
------------------- -------------------
2020-05-29 10:13:07 2020-05-24 10:12:04

-- 문자열 최대 최소
SELECT MAX(sawon), MIN(sawon) FROM pay;
MAX(SAWON)      MIN(SAWON)     
--------------- ---------------
나길순          Jung Ho Yeon  
 
3. COUNT(), NULL 컬럼은 카운트에 포함이 되지 않습니다.
 
SELECT * FROM pay;
 
SELECT COUNT(payno) FROM pay;
 
SELECT COUNT(bonus) FROM pay; -- null 카운트 안됨
 
SELECT COUNT(*) FROM pay;  -- 컬럼의 값이 null로 인해서 카운트가 안되는 것을 방지 할 수 있음.
 
-- NVL 함수를 이용하여 NULL 컬럼을 카운트 합니다.
-- bonus 컬럼의 값이 null 이면 0으로 변경합니다.
SELECT COUNT(NVL(bonus, 0)) as bonus FROM pay;

SELECT MAX(bonus) FROM pay;  -- null이 있어도 최대값 산출됨.
MAX(BONUS)
----------
    400000
    
SELECT MIN(bonus) FROM pay;  -- null이 있어도 0이 있으면 최소값으로 산출됨.    
MIN(BONUS)
----------
         0
         
-- 보너스를 받는 사람중에 최소 금액은?
UPDATE pay SET bonus=0 WHERE payno=1;
commit;
SELECT * FROM pay;
    PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX     BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67       0     
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0            300000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0          null
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0        null
         
SELECT MAX(bonus) FROM pay;      -- null이 있어도 최대값 구해짐
SELECT MIN(bonus) FROM pay;       -- null이 있어도 최소값 구해짐
      
-- 모든 직원의 보너스를 200000원씩 인상, null 컬럼은 인상안됨.
UPDATE pay SET bonus = bonus + 200000;
SELECT * FROM pay;
    PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67        200000
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0            500000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0          null 
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0        null
         
-- 보너스를 못받는 직원만 100000원 지급
UPDATE pay 
SET bonus = 100000 
WHERE bonus IS NULL; -- WHERE bonus = NULL;  X

SELECT * FROM pay;
     PAYNO SAWON           ADDRESS                        GDATE                  BONBONG        TAX      BONUS
---------- --------------- ------------------------------ ------------------- ---------- ---------- ----------
         1 가길동          경기도 성남시                  2021-09-29 03:42:59    2100000   12345.67      200000
         2 나길순          경기도 성남시                  2021-09-26 03:42:59    2890000          0         500000
         3 Lee Jung Jae    경기도 부천시                  2021-09-28 03:42:59    4070000          0       100000
         4 Jung Ho Yeon    경기도 부천시                  2021-09-29 03:42:59    2960000          0     100000
         
commit;

-- 직원들의 보너스 평균 금액은?
UPDATE pay 
SET bonus = NULL 
WHERE bonus = 100000;  -- null 값으로 변경

SELECT sawon, bonus FROM pay;
SAWON                BONUS
--------------- ----------
가길동              200000
나길순              500000
Lee Jung Jae      null        
Jung Ho Yeon    null          

SELECT AVG(bonus) FROM pay; -- 모든 직원의 bonus 평균이 350000원이라는 문제 발생, 수당을 받는 직원들만의 평균
AVG(BONUS)
----------------
    350000
    
SELECT AVG(NVL(bonus, 0)) as pay_avg FROM pay; -- null 포함 평균 산출, 모든 직원 대상으로 평균 산출
   PAY_AVG
----------
    175000
           
4. GROUP BY
DROP TABLE pay2;
CREATE TABLE pay2(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    part    VARCHAR(20) NOT NULL,  -- 부서명
    sawon   VARCHAR(15) NOT NULL,  -- 사원명
    bonbong NUMBER(8)   DEFAULT 0, -- 본봉  
    tax     NUMBER(10, 2)   DEFAULT 0, -- 세금, 전체 자리, +-99999999.99
    bonus   NUMBER(7)       NULL,  -- 보너스
    PRIMARY KEY(payno)
);

INSERT INTO pay2(payno, part, sawon, bonbong, tax, bonus)
VALUES(1, '개발팀', '이정재', 2500000, 12345.67, 0);
       
INSERT INTO pay2(payno, part, sawon, bonbong, tax, bonus)
VALUES(2, '분석팀', '정호연', 3500000, 300000, 0);
 
INSERT INTO pay2(payno, part, sawon, bonbong, tax, bonus)
VALUES(3, '개발팀', '이정재', 4070000, 0, 0);
 
INSERT INTO pay2(payno, part, sawon, bonbong, tax, bonus)
VALUES(4, '개발팀', '가길동', 7000000, 1200000, 0);

INSERT INTO pay2(payno, part, sawon, bonbong, tax, bonus)
VALUES(5, '분석팀', '나길순', 5000000, 800000, 0);

SELECT payno, part, sawon, bonbong, tax, bonus
FROM pay2;

     PAYNO PART               SAWON              BONBONG        TAX      BONUS
---------- -------------------- --------------- ---------- ---------- ----------
         1 개발팀               이정재             2500000   12345.67          0
         2 분석팀               정호연             3500000     300000          0
         3 개발팀               이정재             4070000          0          0
         4 개발팀               가길동             7000000    1200000          0
         5 분석팀               나길순             5000000     800000          0

COMMIT;

-- 부서별 평균 급여를 출력하세요.
-- 어느부서의 평균 급여인지 모름으로 정보로써 가치가 부족함.
SELECT AVG(bonbong) as bonbong
FROM pay2
GROUP BY part;

   BONBONG
   ----------
   4523333.33
   4250000
 
 
-- GROUP BY문에 명시된 컬럼은 SELECT문에 출력할 수 있습니다. -1: 10의 자리에서 반올림.
SELECT part, ROUND(AVG(bonbong), -2) as bonbong
FROM pay2
GROUP BY part;   

PART                    BONBONG
-------------------- ----------
개발팀                  4523300
분석팀                  4250000
 
SELECT * FROM pay2;
 
-- 부서별, 사원별 평균 급여를 출력하세요, 2차 그룹화
SELECT part, sawon, TRUNC(AVG(bonbong), -1) as avgpay
FROM pay2
GROUP BY part, sawon;   

PART                 SAWON           AVGPAY
-------------------- --------------- ----------
개발팀               이정재             3285000
개발팀               가길동             7000000
분석팀               정호연             3500000
분석팀               나길순             5000000

 
-- 2차 그룹의 지정 
-- 부서별, 사원별 평균 급여를 구하여 부서별, 사원별로
-- 오름차순 출력하세요.
-- FROM -> GROUP BY -> SELECT -> ORDER BY 
SELECT part, sawon, TRUNC(AVG(bonbong), -1) as bonbong
FROM pay2
GROUP BY part, sawon
ORDER BY part, sawon; 

PART                 SAWON              BONBONG
-------------------- --------------- ----------
개발팀               가길동             7000000
개발팀               이정재             3285000
분석팀               나길순             5000000
분석팀               정호연             3500000
 
-- 동일한 부서에서 급여가 내림차순(DESC)되도록 출력.
SELECT part, sawon, TRUNC(AVG(bonbong), -1) as bonbong
FROM pay2
GROUP BY part, sawon
ORDER BY part ASC, bonbong DESC;
PART                 SAWON              BONBONG
-------------------- --------------- ----------
개발팀               가길동             7000000
개발팀               이정재             3285000
분석팀               나길순             5000000
분석팀               정호연             3500000

6. GROUP BY문에 조건을 이용하기위한 HAVING절의 이용
 
-- 부서별 평균 급여가 450만원이 넘는 부서만 출력, 1의 자리 반올림
-- 그룹함수 조건에 WHERE 절을 사용할 수 없습니다.
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM pay2
GROUP BY part
HAVING AVG(bonbong) >= 4500000
-- WHERE AVG(bonbong) >= 4500000 -- ERROR
ORDER BY part; 

PART                    BONBONG
--------------------   ------------
개발팀                  4523300
 
-- ERROR, HAVING 절에 그룹화 함수 미사용 
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM pay2
GROUP BY part
HAVING bonbong >= 4000000  <-- 일반 컬럼을 명시하여 에러
ORDER BY part; 

-- HAVING 절에 그룹화 함수 미사용시는 GROUP BY 에 등장한 컬럼을 사용해야함.
SELECT part, TRUNC(AVG(bonbong), -2) as avg_bonbong
FROM pay2
GROUP BY part
HAVING part = '개발팀' -- 그룹화한후 '개발팀'에 대해서만 출력을 함.
ORDER BY part; 
PART                 AVG_BONBONG
-------------------- -----------
개발팀                   4523300

-- WHERE의 사용, 개발팀을 제외한 300만원이 넘는 부서별 평균 급여 산출
SELECT part, TRUNC(AVG(bonbong), -2) as bonbong
FROM pay2
WHERE part NOT LIKE '%개발팀%'
GROUP BY part
HAVING AVG(bonbong) >= 3000000
ORDER BY part; 
PART                    BONBONG
-------------------- ----------
분석팀                  4250000

7. 함수의 중첩
-- 부서중에 평균 급여가 가장 높은 부서의 금액을 천단위이상 출력하세요. 
SELECT TRUNC(MAX(AVG(bonbong)), -3) as bonbong
FROM pay2
GROUP BY part;

   BONBONG
----------
   4523000

SELECT part, TRUNC(AVG(bonbong), -3) as bonbong
FROM pay2
GROUP BY part;
PART                    BONBONG
-------------------- ----------
개발팀                  4523000
분석팀                  4250000

-- ERROR, max 함수는 단일값으로 처리되어 그룹화 할 수 없음.
-- 따라서 부서중에 평균 급여가 가장 높은 부서의 금액과 부서명을 출력 할 수 없다.
-- 그룹화된 부서안에서 최고 급여 출력
SELECT part, MAX(bonbong) as bonbong
FROM pay2
GROUP BY part;
PART                    BONBONG
-------------------- ----------
개발팀                  7000000
분석팀                  5000000

SELECT part, AVG(bonbong) as bonbong
FROM pay2
GROUP BY part; 
PART                    BONBONG
-------------------- ----------
개발팀               4523333.33
분석팀                  4250000

SELECT part, MAX(AVG(bonbong)) as bonbong
FROM pay2
GROUP BY part;
-- SQL 오류: ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
-- 00937. 00000 -  "not a single-group group function"

-- Subquery를 이용하여 부서중에 평균 급여가 가장 높은 부서의 금액과 부서명 출력 가능
SELECT part, AVG(bonbong) as pay
FROM pay2
GROUP BY part
ORDER BY pay DESC; -- ASC
PART                        PAY
-------------------- ----------
개발팀               4523333.33
분석팀                  4250000

SELECT part, pay, rownum as r
FROM (
    SELECT part, AVG(bonbong) as pay
    FROM pay2
    GROUP BY part
    ORDER BY pay DESC -- ASC
 );
 PART                        PAY          R
-------------------- ---------- ----------
개발팀               4523333.33          1
분석팀                  4250000          2

SELECT part, pay, r
FROM (
    SELECT part, pay, rownum as r
    FROM (
        SELECT part, AVG(bonbong) as pay
        FROM pay2
        GROUP BY part
        ORDER BY pay DESC -- ASC
     )
)
WHERE r=1;  -- 급여 평균이 3위안에 드는 부서 출력: WHERE r >= 1 AND r <= 3
PART                        PAY          R
-------------------- ---------- ----------
개발팀               4523333.33          1
