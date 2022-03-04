/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
DROP TABLE categrp CASCADE CONSTRAINTS;
CREATE TABLE categrp(
        categrpno                             NUMBER(7)         NOT NULL         PRIMARY KEY,
        name                                  VARCHAR2(50)         NOT NULL,
        seqno                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        visible                               CHAR(1)         DEFAULT 'Y'         NOT NULL,
        rdate                                 DATE         NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호 ';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';

DROP SEQUENCE categrp_seq;
CREATE SEQUENCE categrp_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 1, 'Y', sysdate);

INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '캠핑', 1, 'Y', sysdate);

SELECT * FROM categrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2021-09-29 12:39:29
         2 여행                                                        1 Y 2021-09-29 12:39:29
         3 캠핑                                                        1 Y 2021-09-29 12:39:29
         
COMMIT;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
DROP TABLE cate;
CREATE TABLE cate(
        cateno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        categrpno                             NUMBER(10)         NULL ,
        name                                  VARCHAR2(50)         NOT NULL,
        rdate                                 DATE         NOT NULL,
        cnt                                   NUMBER(10)         DEFAULT 0         NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.categrpno is '카테고리 그룹 번호 ';
COMMENT ON COLUMN cate.name is '카테고리 이름';
COMMENT ON COLUMN cate.rdate is '등록일';
COMMENT ON COLUMN cate.cnt is '관련 자료수';

DROP SEQUENCE cate_seq;

CREATE SEQUENCE cate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
INSERT INTO cate(cateno, categrpno, name, rdate, cnt)
VALUES(cate_seq.nextval, 1000, '가을', sysdate, 0);
-- 오류 보고 -
-- ORA-02291: integrity constraint (AI7.SYS_C008048) violated - parent key not found
-- ORA-02291: 무결성 제약조건(KD.SYS_C007980)이 위배되었습니다- 부모 키가 없습니다
-- FK 컬럼의 값 1000은 categrp 테이블에 없어서 에러 발생함.

SELECT * FROM categrp ORDER BY categrpno ASC;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-03-03 11:12:49
         2 여행                                                        1 Y 2022-03-03 11:12:49
         3 캠핑                                                        1 Y 2022-03-03 11:12:49
        
-- 등록
INSERT INTO cate(cateno, categrpno, name, rdate, cnt)
VALUES(cate_seq.nextval, 1, 'SF', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, rdate, cnt)
VALUES(cate_seq.nextval, 1, '드라마', sysdate, 0);

INSERT INTO cate(cateno, categrpno, name, rdate, cnt)
VALUES(cate_seq.nextval, 1, '퇴마', sysdate, 0);

SELECT * FROM cate;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         1          1 SF                                                 2022-03-03 11:41:43          0
         2          1 드라마                                             2022-03-03 11:41:43          0
         3          1 퇴마                                               2022-03-03 11:41:43          0
         
COMMIT;

-- 목록
SELECT cateno, categrpno, name, rdate, cnt
FROM cate
ORDER BY cateno ASC;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         1          1 SF                                                 2022-03-03 11:41:43          0
         2          1 드라마                                             2022-03-03 11:41:43          0
         3          1 퇴마                                               2022-03-03 11:41:43          0
         
-- categrpno 별 목록: FROM -> WHERE -> SELECT -> ORDER BY
SELECT cateno, categrpno, name, rdate, cnt
FROM cate
WHERE categrpno = 1
ORDER BY cateno ASC;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         1          1 SF                                                 2022-03-03 11:41:43          0
         2          1 드라마                                             2022-03-03 11:41:43          0
         3          1 퇴마                                               2022-03-03 11:41:43          0

-- Categrp + Cate join, 연결 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-03-03 11:12:49
         2 여행                                                        1 Y 2022-03-03 11:12:49
         3 캠핑                                                        1 Y 2022-03-03 11:12:49
----- 여기까지 -----
-- 부모 테이블의 PK 컬럼, 자식 테이블의 FK 컬럼의 값이 같으면 하나의 레코드로 결합
-- 결합시 자식 테이블의 레코드 갯수 만큼 결합(join)이 발생함.
-- as로 컬럼 별명을 선언하면 실제 컬럼명은 사용 못함.
SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno, c.categrpno, c.name, c.rdate, c.cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY categrpno ASC, cateno ASC;
PK                                PK           FK
R_CATEGRPNO R_NAME   CATENO  CATEGRPNO NAME               RDATE                      CNT
---------- ----------- ---------- ---------- ---------------------- ------------------- ----------
         1          영화            1          1              SF                    2021-04-09 10:47:26          0
         1          영화            2          1              드라마              2021-04-09 10:47:26          0
         1          영화            4          1              퇴마                 2021-04-09 12:19:26          0
         1          영화            13        1              유머                 2021-04-12 01:15:33          0
         2          여행            9          2              경기도              2021-04-12 10:19:41          0
         3          음악            14        3              드라이브           2021-04-12 02:43:59          0
 

-- 조회
SELECT cateno, categrpno, name, rdate, cnt
FROM cate
WHERE cateno=2;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         2          1 SF                                                 2021-09-29 12:41:21          0
         
-- 수정
UPDATE cate
SET categrpno=1, name='코믹', cnt=0
WHERE cateno = 3;

SELECT * FROM cate;

commit;

-- 삭제
DELETE cate
WHERE cateno = 7;

SELECT * FROM cate;

DELETE FROM cate
WHERE cateno = 6;

commit;

-- 갯수
SELECT COUNT(*) as cnt 
FROM cate;

-- 글수 증가
UPDATE cate
SET cnt = cnt + 1
WHERE cateno=2;

SELECT * FROM cate;
   CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         2          1 SF                                                 2021-09-29 12:41:21          1
         3          1 코믹                                               2021-09-29 12:41:21          0
         
commit;

-- 글수 감소
UPDATE cate
SET cnt = cnt - 1
WHERE cateno=2;

SELECT * FROM cate;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         2          1 SF                                                 2021-09-29 12:41:21          0
         3          1 코믹                                               2021-09-29 12:41:21          0
         
commit;

-- 글수 추기화
UPDATE cate
SET cnt = 0
WHERE cateno=2;

SELECT * FROM cate;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         2          1 SF                                                 2021-09-29 12:41:21          0
         3          1 코믹                                               2021-09-29 12:41:21          0
         
commit;
-- ------------------------------------------ JOIN ------------------------------------------ 
-- Categrp + Cate join, 연결 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2021-09-29 12:39:29
         2 여행                                                        2 Y 2021-09-29 12:39:29
        14 캠핑                                                        3 Y 2021-09-30 01:17:13

-- where 없는 join: 비교 조건이 없음으로 정보로서의 가치가 없음.
SELECT categrp.categrpno as r_categrpno, categrp.name as r_name,
           cate.cateno, cate.categrpno, cate.name, cate.rdate,cate.cnt
FROM categrp, cate
ORDER BY categrpno ASC, cateno ASC;

-- 2개의 테이블에 동일한 커럼명이 있는 경우 as로 컬럼명 변경
SELECT categrp.categrpno as r_categrpno, categrp.name as r_name,
           cate.cateno, cate.categrpno, cate.name, cate.rdate,cate.cnt
FROM categrp, cate
WHERE categrp.categrpno = cate.categrpno
ORDER BY categrpno ASC, cateno ASC;

-- 부모 테이블의 PK 컬럼, 자식 테이블의 FK 컬럼의 값이 같으면 하나의 레코드로 결합
-- 결합시 자식 테이블의 레코드 갯수 만큼 결합(join)이 발생함.
-- as로 컬럼 별명을 선언하면 실제 컬럼명은 사용 못함.
-- FROM categrp r, cate c: 테이블명을 간단한 약자로 사용함, categrp는 r로 인식됨, cate는 c로 인식됨.
SELECT r.categrpno as r_categrpno, r.name as r_name,
           c.cateno, c.categrpno, c.name, c.rdate, c.cnt
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno
ORDER BY categrpno ASC, cateno ASC;
PK                                PK           FK
R_CATEGRPNO R_NAME   CATENO  CATEGRPNO NAME               RDATE                      CNT
---------- ----------- ---------- ---------- ---------------------- ------------------- ----------
         1          영화            1          1              SF                    2021-04-09 10:47:26          0
         1          영화            2          1              드라마              2021-04-09 10:47:26          0
         1          영화            4          1              퇴마                 2021-04-09 12:19:26          0
         1          영화            13        1              유머                 2021-04-12 01:15:33          0
         2          여행            9          2              경기도              2021-04-12 10:19:41          0
         3          음악            14        3              드라이브           2021-04-12 02:43:59          0
 
