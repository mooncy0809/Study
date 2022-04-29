1. WHERE문에 서브쿼리의 사용

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

 
-- 개발팀의 평균 급여
SELECT AVG(bonbong) as bonbong
FROM pay2
WHERE part='개발팀';

   BONBONG
----------
4523333.33
 
 
-- 개발팀의 평균 급여보다 급여가 많은 직원 출력
-- 개발팀의 평균 급여를 산출한다. -> 평균 급여보다 높은 직원을 출력한다.
-- Application 개발자가 Subquery를 알고 있다면 1번의 SQL 요청으로 결과를 산출할 수 있음.
-- Application 개발자가 Subquery를 사용하지 않는다면 2번의 SQL 요청을 처리해야함.
SELECT payno, part, sawon, bonbong
FROM pay2
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM pay2
                  WHERE part='개발팀'
);

     PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         4 개발팀               가길동             7000000
         5 분석팀               나길순             5000000

        
 
-- 개발팀의 평균 급여보다 급여가 낮은 직원들의 급여를
-- 20% 추가 지급 
SELECT part, sawon, bonbong, bonbong * 0.2 as 추가금액, bonbong * 1.2 as 최종급여
FROM pay2
WHERE bonbong < (
                  SELECT AVG(bonbong)
                  FROM pay2
                  WHERE part='개발팀'
);
 
PART                 SAWON          BONBONG  추가금액   최종급여
-------------------- --------------- ----------   ----------  ----------
개발팀               이정재             2500000     500000    3000000
분석팀               정호연             3500000     700000    4200000
개발팀               이정재             4070000     814000    4884000

 
 
-- 개발팀의 평균 급여보다 급여가 많은 직원들의 급여를
-- 10% 삭감 출력 
SELECT part, sawon, bonbong, bonbong * 0.1 as 삭감금액, bonbong * 0.9 as 최종급여
FROM pay2
WHERE bonbong >= (
                  SELECT AVG(bonbong)
                  FROM pay2
                  WHERE part='개발팀'
);
 
PART                 SAWON          BONBONG  삭감금액   최종급여
-------------------- --------------- ---------- ---------- ----------
개발팀               가길동             7000000     700000    6300000
분석팀               나길순             5000000     500000    4500000
 
 
2. 조건의 중첩
 
-- 가길동의 부서 출력
   SELECT part
   FROM pay2
   WHERE sawon='정호연'

PART                
--------------------
분석팀

 
-- 정호연과 같은 부서의 평균 급여 출력
   SELECT TRUNC(AVG(bonbong)) as bonbong
   FROM pay2
   WHERE part = (SELECT part
                 FROM pay2
                 WHERE sawon='정호연');
                 
   BONBONG
   ----------
   4250000
    
   SELECT sawon, bonbong
   FROM pay2
   WHERE sawon='정호연'    
SAWON          BONBONG
--------------- ----------
정호연            3500000
 
-- 정호연과 같은 부서에 근무하면서(AND) 그 부서의 평균급여 보다 급여가 많은 직원 출력
   SELECT payno, part, sawon, bonbong 
   FROM pay2
   WHERE 
         (
         part = (
                  SELECT part  -- 분석팀
                  FROM pay2
                  WHERE sawon='정호연'
                  )
         )     
         AND
         (
         bonbong > (
                     SELECT AVG(bonbong)  -- 디자인팀의 평균 본봉 2200000
                     FROM pay2
                     WHERE part = (
                                          SELECT part  -- 분석팀
                                          FROM pay2
                                          WHERE sawon='정호연'
                                          )
                     )
         );
         
     PAYNO PART                 SAWON        BONBONG
---------- -------------------- --------------- ----------
         5   분석팀                나길순           5000000

         
   -- Subquery의 최종 실행 형태
   -- Application 개발자가 Subquery를 알고 있다면 1번의 SQL 요청으로 결과를 산출할 수 있음.
   -- Application 개발자가 Subquery를 사용하지 않는다면 3번의 SQL 요청을 처리해야함.
   SELECT payno, part, sawon, bonbong 
   FROM pay2
   WHERE part = '분석팀' AND bonbong > 4250000;

     PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         5 분석팀               나길순             5000000
  
   
3. Subquery + ROWNUM 컬럼을 이용한 레코드 추출, select 시에 자동으로 일련번호가 추가됨.
 
SELECT payno, part, sawon, rownum
FROM pay2;
     PAYNO PART                 SAWON               ROWNUM
---------- -------------------- --------------- ----------
         1 개발팀               이정재                   1
         2 분석팀               정호연                   2
         3 개발팀               이정재                   3
         4 개발팀               가길동                   4
         5 분석팀               나길순                   5
         
-- rownum이 생성되고 난후 정렬됨으로 정보로서의 가치가 떨어짐
SELECT payno, part, sawon, rownum
FROM pay2
ORDER BY sawon;
     PAYNO PART                 SAWON               ROWNUM
---------- -------------------- --------------- ----------
         4 개발팀               가길동                   4
         5 분석팀               나길순                   5
         1 개발팀               이정재                   1
         3 개발팀               이정재                   3
         2 분석팀               정호연                   2
 
-- sawon 명으로 먼저 정렬을 수행하고 rownum을 추가합니다.
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon 
       FROM pay2
       ORDER BY sawon
);
     PAYNO PART                 SAWON                    R
---------- -------------------- --------------- ----------
         4 개발팀               가길동                   1
         5 분석팀               나길순                   2
         1 개발팀               이정재                   3
         3 개발팀               이정재                   4
         2 분석팀               정호연                   5
         
-- rownum 컬럼 값에 따른 레코드 추출, ERROR, r 인식 안됨, SQL 오류: ORA-00904: "R": 부적합한 식별자
-- FROM -> WHERE -> SELECT
SELECT payno, part, sawon, rownum as r
FROM (
       SELECT payno, part, sawon
       FROM pay2
       ORDER BY sawon
)
WHERE r >= 1 AND r <= 3; 
 
-- rownum 컬럼 값에 따른 레코드 1~3 추출, 페이징 가능 유형
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM pay2
            ORDER BY sawon
    )
)
WHERE r >= 1 AND r <= 3;     
     PAYNO PART                 SAWON             R
---------- -------------------- --------------- ----------
         4 개발팀               가길동                   1
         5 분석팀               나길순                   2
         1 개발팀               이정재                   3
          
-- rownum 컬럼 값에 따른 레코드 4~6 추출
SELECT payno, part, sawon, r
FROM(
     SELECT payno, part, sawon, rownum as r
     FROM (
            SELECT payno, part, sawon
            FROM pay2
            ORDER BY sawon
    )
)
WHERE r >= 4 AND r <= 6;   
     PAYNO PART                 SAWON             R
---------- -------------------- --------------- ----------
         3 개발팀               이정재                   4
         2 분석팀               정호연                   5
     
     
4. IN의 사용: Subquery의 결과가 2개 이상일 경우 사용
   - 급여가 400만원 넘는 사람과 같은 나이를 가지고
     있는 직원의 급여 내역을 출력하세요.
 
-- 급여가 400만원이 넘는 직원의 성명(sawon) 출력합니다.     
SELECT sawon 
FROM pay2
WHERE bonbong >= 2500000;

SAWON          
---------------
이정재
정호연
이정재
가길동
나길순
 
-- 중복된 값의 제거
SELECT DISTINCT sawon 
FROM pay2
WHERE bonbong >= 2500000;

SAWON          
---------------
이정재
가길동
정호연
나길순
 
-- 부서가 중복되어 출력
SELECT part
FROM pay2;
PART                
--------------------
개발팀
분석팀
개발팀
개발팀
분석팀
 
-- 중복된 부서의 제거 출력
SELECT DISTINCT part
FROM pay2;

PART                
--------------------
개발팀
분석팀

-- '이정재', '정호연' 직원만 조회 
SELECT payno, part, sawon, bonbong
FROM pay2
WHERE sawon IN('이정재', '정호연');

     PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         1 개발팀               이정재             2500000
         2 분석팀               정호연             3500000
         3 개발팀               이정재             4070000

-- '이정재', '정호연' 직원만 제외하고 조회 
SELECT payno, part, sawon, bonbong
FROM pay2
WHERE sawon NOT IN('이정재', '정호연');

    PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         4 개발팀               가길동             7000000
         5 분석팀               나길순             5000000
         
SELECT payno, part, sawon, bonbong 
FROM pay2
WHERE bonbong IN(2500000, 3500000);

     PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         1 개발팀               이정재             2500000
         2 분석팀               정호연             3500000        
         
SELECT payno, part, sawon, bonbong 
FROM pay2
WHERE bonbong NOT IN(2500000, 3500000);
     PAYNO PART              SAWON          BONBONG
---------- -------------------- --------------- ----------
         3 개발팀               이정재             4070000
         4 개발팀               가길동             7000000
         5 분석팀               나길순             5000000
         
 
-- 급여가 400만원이 넘는 직원의 부서와 일치하는 직원의 정보를 모두 출력합니다.
SELECT DISTINCT part
FROM pay2
GROUP BY part
HAVING AVG(bonbong) >= 4500000

PART                
--------------------
개발팀
                    
SELECT payno, part, sawon, bonbong
FROM pay2
WHERE part IN(
                    SELECT DISTINCT part
                    FROM pay2
                    GROUP BY part
                    HAVING AVG(bonbong) >= 4500000
                   )
ORDER BY part ASC;                   

     PAYNO PART                 SAWON              BONBONG
---------- -------------------- --------------- ----------
         1 개발팀               이정재             2500000
         3 개발팀               이정재             4070000
         4 개발팀               가길동             7000000
     