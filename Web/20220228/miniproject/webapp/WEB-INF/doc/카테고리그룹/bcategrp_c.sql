/**********************************/
/* Table Name: 북 카테고리 그룹 */
/**********************************/
CREATE TABLE bcategrp(
		bcategrpno                    		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE bcategrp is '북 카테고리 그룹';
COMMENT ON COLUMN bcategrp.bcategrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN bcategrp.name is '이름';
COMMENT ON COLUMN bcategrp.seqno is '출력 순서';
COMMENT ON COLUMN bcategrp.visible is '출력 모드';
COMMENT ON COLUMN bcategrp.rdate is '그룹 생성일';

DROP SEQUENCE categrp_seq;
DROP SEQUENCE bcategrp_seq;


CREATE SEQUENCE bcategrp_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO bcategrp(bcategrpno, name, seqno, visible, rdate)
VALUES(bcategrp_seq.nextval, '영화', 1, 'Y', sysdate);


SELECT bcategrpno, name, seqno, visible, rdate
FROM bcategrp
ORDER BY bcategrpno ASC;

delete from bcategrp;

