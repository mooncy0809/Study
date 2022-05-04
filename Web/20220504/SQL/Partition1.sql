DROP TABLE 매출;
CREATE TABLE 매출( 
  영업사원 varchar2(10),
  판매월 char(5),
  매출 number(5)
);

INSERT INTO 매출 VALUES('갑순이','1',1000);
INSERT INTO 매출 VALUES('갑순이','2',1000);
INSERT INTO 매출 VALUES('갑순이','3',1000);
INSERT INTO 매출 VALUES('홍길동','1',1000);
INSERT INTO 매출 VALUES('홍길동','2',1000);
INSERT INTO 매출 VALUES('홍길동','3',1000);

COMMIT;

SELECT * FROM 매출;

영업사원   판매월      매출
---------- ----- ----------
갑순이     1           1000
갑순이     2           1000
갑순이     3           1000
홍길동     1           1000
홍길동     2           1000
홍길동     3           1000

-- 구획을 나누어 합을 계산
SELECT 영업사원, 판매월, SUM(매출) OVER (PARTITION BY 영업사원) 누적매출 FROM 매출;

영업사원     판매월    누적매출
---------- ----- ----------
갑순이      1           3000
갑순이      2           3000
갑순이      3           3000
홍길동      1           3000
홍길동      2           3000
홍길동      3           3000

-- 영업사원변 그룹화, 그안에서 판매월 내림차순 정렬: 매출 합계
SELECT 영업사원, 판매월, SUM(매출) OVER (PARTITION BY 영업사원 ORDER BY 판매월 ASC) 누적매출 FROM 매출;
영업사원     판매월     누적매출
---------- -----  ----------
갑순이       1           1000  <- 갑순이의 1월 매출 총액
갑순이       2           2000  <- 갑순이의 1~2월 매출 총액
갑순이       3           3000  <- 갑순이의 1~3월 매출 총액
홍길동       1           1000
홍길동       2           2000
홍길동       3           3000

SELECT 영업사원, 판매월,
       SUM(매출) OVER (PARTITION BY 영업사원 ORDER BY 판매월 RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 누적매출 FROM 매출;

영업사원       판매월         누적매출
---------- ----- ----------
갑순이       1           1000  <- 갑순이의 1월 매출 총액
갑순이       2           2000  <- 갑순이의 1~2월 매출 총액
갑순이       3           3000  <- 갑순이의 1~3월 매출 총액
홍길동       1           1000
홍길동       2           2000
홍길동       3           3000


SELECT 영업사원, 판매월, 
SUM(매출) OVER (PARTITION BY 영업사원 ORDER BY 판매월 RANGE BETWEEN PRECEDING AND CURRENT ROW) 누적매출 FROM 매출;  -- X

SELECT 영업사원, 판매월, 
SUM(매출) OVER (PARTITION BY 영업사원 ORDER BY 판매월 RANGE UNBOUNDED PRECEDING AND CURRENT ROW) 누적매출 FROM 매출;  -- X

SELECT 영업사원, 판매월, 
SUM(매출) OVER (PARTITION BY 영업사원 ORDER BY 판매월 RANGE BETWEEN UNBOUNDED PRECEDING) 누적매출 from 매출; -- X

SELECT 영업사원, 판매월, 
SUM(매출) OVER (PARTITION BY 판매월 RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 누적매출 from 매출;  -- X
