/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
DROP TABLE bcategrp CASCADE CONSTRAINTS;
CREATE TABLE bcategrp(
        bcategrpno                             NUMBER(7)         NOT NULL         PRIMARY KEY,
        name                                  VARCHAR2(50)         NOT NULL,
        seqno                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        visible                               CHAR(1)         DEFAULT 'Y'         NOT NULL,
        rdate                                 DATE         NOT NULL
);

COMMENT ON TABLE bcategrp is '카테고리 그룹';
COMMENT ON COLUMN bcategrp.categrpno is '카테고리 그룹 번호 ';
COMMENT ON COLUMN bcategrp.name is '이름';
COMMENT ON COLUMN bcategrp.seqno is '출력 순서';
COMMENT ON COLUMN bcategrp.visible is '출력 모드';
COMMENT ON COLUMN bcategrp.rdate is '그룹 생성일';

delete from bcategrp;
DROP SEQUENCE bcategrp_seq;
CREATE SEQUENCE bcategrp_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

INSERT INTO bcategrp(bcategrpno, name, seqno, visible, rdate)
VALUES(bcategrp_seq.nextval, '추천 e북 도서', 1, 'Y', sysdate);

INSERT INTO bcategrp(bcategrpno, name, seqno, visible, rdate)
VALUES(bcategrp_seq.nextval, '무료 e북 도서', 1, 'Y', sysdate);

INSERT INTO bcategrp(bcategrpno, name, seqno, visible, rdate)
VALUES(bcategrp_seq.nextval, '신간 e북 도서', 1, 'Y', sysdate);

SELECT * FROM bcategrp;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2021-09-29 12:39:29
         2 여행                                                        1 Y 2021-09-29 12:39:29
         3 캠핑                                                        1 Y 2021-09-29 12:39:29
         
COMMIT;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
DROP TABLE bcate;
CREATE TABLE bcate(
        bcateno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        bcategrpno                             NUMBER(10)         NULL ,
        name                                  VARCHAR2(50)         NOT NULL,
        rdate                                 DATE         NOT NULL,
        cnt                                   NUMBER(10)         DEFAULT 0         NOT NULL,
  FOREIGN KEY (bcategrpno) REFERENCES bcategrp (bcategrpno)
);

COMMENT ON TABLE bcate is '카테고리';
COMMENT ON COLUMN bcate.cateno is '카테고리 번호';
COMMENT ON COLUMN bcate.categrpno is '카테고리 그룹 번호 ';
COMMENT ON COLUMN bcate.name is '카테고리 이름';
COMMENT ON COLUMN bcate.rdate is '등록일';
COMMENT ON COLUMN bcate.cnt is '관련 자료수';

DROP SEQUENCE bcate_seq;

CREATE SEQUENCE bcate_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 등록
INSERT INTO bcate(bcateno, bcategrpno, name, rdate, cnt)
VALUES(bcate_seq.nextval, 1000, '가을', sysdate, 0);
-- 오류 보고 -
-- ORA-02291: integrity constraint (AI7.SYS_C008048) violated - parent key not found
-- ORA-02291: 무결성 제약조건(KD.SYS_C007980)이 위배되었습니다- 부모 키가 없습니다
-- FK 컬럼의 값 1000은 bcategrp 테이블에 없어서 에러 발생함.

SELECT * FROM bcategrp ORDER BY bcategrpno ASC;

        
-- 등록
INSERT INTO bcate(bcateno, bcategrpno, name, rdate, cnt)
VALUES(bcate_seq.nextval, 1, 'SF', sysdate, 0);

INSERT INTO bcate(bcateno, bcategrpno, name, rdate, cnt)
VALUES(bcate_seq.nextval, 1, '드라마', sysdate, 0);

INSERT INTO bcate(bcateno, bcategrpno, name, rdate, cnt)
VALUES(bcate_seq.nextval, 1, '퇴마', sysdate, 0);

SELECT * FROM bcate;

COMMIT;

-- 목록
SELECT bcateno, bcategrpno, name, rdate, cnt
FROM bcate
ORDER BY bcateno ASC;

         
-- bcategrpno 별 목록: FROM -> WHERE -> SELECT -> ORDER BY
SELECT bcateno, bcategrpno, name, rdate, cnt
FROM bcate
WHERE bcategrpno = 1
ORDER BY bcateno ASC;


