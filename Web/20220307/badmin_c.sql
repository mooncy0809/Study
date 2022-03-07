/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE badmin(
    badminno         NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                   VARCHAR2(20)     NOT NULL
);

COMMENT ON TABLE badmin is '관리자';
COMMENT ON COLUMN badmin.badminno is '관리자 번호';
COMMENT ON COLUMN badmin.id is '아이디';

DROP SEQUENCE badmin_seq;

CREATE SEQUENCE badmin_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

INSERT INTO badmin(badminno, id)
VALUES(badmin_seq.nextval, 'admin1');

INSERT INTO badmin(badminno, id)
VALUES(badmin_seq.nextval, 'admin2');

INSERT INTO badmin(badminno, id)
VALUES(badmin_seq.nextval, 'admin3');

SELECT badminno, id FROM badmin ORDER BY badminno ASC;

commit;
  