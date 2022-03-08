/**********************************/
/* Table Name: 즐겨찾기 그룹 */
/**********************************/
CREATE TABLE urlgrp(
		urlgrpno                      		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		visible                       		VARCHAR2(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE urlgrp is '즐겨찾기 그룹';
COMMENT ON COLUMN urlgrp.urlgrpno is '즐겨찾기 번호';
COMMENT ON COLUMN urlgrp.title is '즐겨찾기 주제';
COMMENT ON COLUMN urlgrp.cnt is '관련 자료 수';
COMMENT ON COLUMN urlgrp.visible is '출력 모드';
COMMENT ON COLUMN urlgrp.rdate is '등록일';

commit;

CREATE SEQUENCE burlgrp_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
INSERT INTO urlgrp(urlgrpno, title, cnt, visible, rdate)
VALUES(burlgrp_seq.nextval, '추천 e북 도서', 0, 'Y', sysdate);

delete from urlgrp;