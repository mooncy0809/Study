1. 실습 테이블 생성
DROP TABLE notice;
 
CREATE TABLE notice(
  noticeno NUMBER(7)     NOT NULL,
  title       VARCHAR(100) NOT NULL,
  rname    VARCHAR(15)  NOT NULL,
  rdate     DATE                     NULL,
  PRIMARY KEY(noticeno)
);
 
 
2. INSERT
INSERT INTO notice
VALUES((SELECT NVL(MAX(noticeno), 0)+1 as noticeno FROM notice), '알림1', '관리자', sysdate);
INSERT INTO notice
VALUES((SELECT NVL(MAX(noticeno), 0)+1 as noticeno FROM notice), '알림2', '관리자', sysdate);
INSERT INTO notice
VALUES((SELECT NVL(MAX(noticeno), 0)+1 as noticeno FROM notice), '알림3', '관리자', sysdate);    
 
SELECT noticeno, title, rname, rdate 
FROM notice
ORDER BY noticeno ASC;
 
 NOTICENO TITLE RNAME RDATE
 -------- ----- ----- ---------------------
        1 알림1   관리자   2020-02-23 13:40:12.0
        2 알림2   관리자   2020-02-23 13:40:37.0
        3 알림3   관리자   2020-02-23 13:40:38.0
 
        
3. 테이블 생성과 모든 컬럼의 데이터 입력처리
DROP TABLE notice_bak1;

-- SELECT 결과가 새로운 테이블로 생성됨. 
CREATE TABLE notice_bak1 
AS
SELECT *
FROM notice;
 
SELECT noticeno, title, rname, rdate 
FROM notice_bak1
ORDER BY noticeno ASC;
 
 NOTICENO TITLE RNAME RDATE
 -------- ----- ----- ---------------------
        1 알림1   관리자   2018-02-23 13:40:12.0
        2 알림2   관리자   2018-02-23 13:40:37.0
        3 알림3   관리자   2018-02-23 13:40:38.0
        
        
4. 테이블 생성과 필요한 컬럼의 데이터 입력처리
DROP TABLE notice_bak2;
-- rdate 컬럼을 제외하고 테이블 생성 
CREATE TABLE notice_bak2 
AS
SELECT noticeno, title, rname 
FROM notice;
 
-- 에러 발생, rdate 컬럼이 없음
SELECT noticeno, title, rname, rdate 
FROM notice_bak2
ORDER BY noticeno ASC;        
 
SELECT noticeno, title, rname
FROM notice_bak2
ORDER BY noticeno ASC;   
 
 NOTICENO TITLE RNAME
 -------- ----- -----
        1 알림1   관리자
        2 알림2   관리자
        3 알림3   관리자
        
        
5. SELECT 결과를 INSERT 하기
 
DROP TABLE notice2;

CREATE TABLE notice2(
  noticeno NUMBER(7)     NOT NULL,
  title       VARCHAR(100) NOT NULL,
  rname    VARCHAR(15)  NOT NULL,
  rdate     DATE                     NULL,
  PRIMARY KEY(noticeno)
);

-- SQL 실행전에 필요한 테이블을 먼저 생성할 것.
-- notice 테이블의 레코드를 notice2 테이블로 복사 
INSERT INTO notice2
SELECT *
FROM notice;
 
SELECT noticeno, title, rname, rdate 
FROM notice2
ORDER BY noticeno ASC;        
 
 NOTICENO TITLE RNAME RDATE
 -------- ----- ----- ---------------------
        1 알림1   관리자   2018-02-23 13:47:06.0
        2 알림2   관리자   2018-02-23 13:47:07.0
        3 알림3   관리자   2018-02-23 13:47:08.0
 
        
6. 필요한 컬럼만 SELECT한 결과를 INSERT 하기
DROP TABLE notice3;

CREATE TABLE notice3(
  noticeno NUMBER(7)     NOT NULL,
  title       VARCHAR(100) NOT NULL,
  rname    VARCHAR(15)  NOT NULL,
  PRIMARY KEY(noticeno)
);

-- rdate는 notice3에 없음으로 제외됨. 
INSERT INTO notice3
SELECT noticeno, title, rname
FROM notice;
 
또는
 
INSERT INTO notice3(noticeno, title, rname)
SELECT noticeno, title, rname
FROM notice;
 
SELECT noticeno, title, rname
FROM notice3
ORDER BY noticeno ASC;  
 
 
 NOTICENO TITLE RNAME
 -------- ----- -----
        1 알림1   관리자
        2 알림2   관리자
        3 알림3   관리자
 
 
7. 여러 테이블의 동시 INSERT
DROP TABLE notice4_1;

CREATE TABLE notice4_1(
  noticeno NUMBER(7)     NOT NULL,
  title       VARCHAR(100) NOT NULL,
  rname    VARCHAR(15)  NOT NULL,
  PRIMARY KEY(noticeno)
);
 
DROP TABLE notice4_2;

CREATE TABLE notice4_2(
  noticeno NUMBER(7)     NOT NULL,
  title       VARCHAR(100) NOT NULL,
  rname    VARCHAR(15)  NOT NULL,
  PRIMARY KEY(noticeno)
);
 
INSERT ALL
  INTO notice4_1(noticeno, title, rname)
  INTO notice4_2(noticeno, title, rname)  
SELECT noticeno, title, rname
FROM notice;
 
SELECT noticeno, title, rname
FROM notice4_1
ORDER BY noticeno ASC;  
 
 NOTICENO TITLE RNAME
 -------- ----- -----
        1 알림1   관리자
        2 알림2   관리자
        3 알림3   관리자
        
SELECT noticeno, title, rname
FROM notice4_2
ORDER BY noticeno ASC;  
 
 NOTICENO TITLE RNAME
 -------- ----- -----
        1 알림1   관리자
        2 알림2   관리자
        3 알림3   관리자