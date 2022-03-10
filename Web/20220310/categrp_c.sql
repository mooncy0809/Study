/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';

DROP SEQUENCE categrp_seq;

CREATE SEQUENCE categrp_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- Create, 등록
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '영화', 1, 'Y', sysdate);
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '여행', 2, 'Y', sysdate);
INSERT INTO categrp(categrpno, name, seqno, visible, rdate)
VALUES(categrp_seq.nextval, '음악', 3, 'Y', sysdate);

commit;

SELECT categrpno,name,seqno,visible,rdate
FROM categrp 
ORDER BY categrpno ASC;

 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-02-24 12:07:01
         2 여행                                                        2 Y 2022-02-24 12:07:01
         3 음악                                                        3 Y 2022-02-24 12:07:01

-- Read, 조회
SELECT categrpno, name, seqno, visible,rdate
FROM categrp
WHERE categrpno = 1;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         5 영화                                                        1 N 2022-02-25 12:01:58
        12 알림                                                        1 Y 2022-02-25 01:09:01
         8 업무 양식                                                   3 Y 2022-02-25 12:12:02
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 영화                                                        1 Y 2022-02-24 12:07:01

-- 수정
UPDATE categrp
SET name='업무 양식', seqno = 3, visible='Y'
WHERE categrpno = 8;

commit;
 
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;

-- 출력 순서에따른 전체 목록
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY seqno ASC;
 
-- 출력 순서 올림(상향), 10 ▷ 1
UPDATE categrp
SET seqno = seqno - 1
WHERE categrpno=1;
 
-- 출력순서 내림(하향), 1 ▷ 10
UPDATE categrp
SET seqno = seqno + 1
WHERE categrpno=1;

commit;

delete from categrp;
commit;