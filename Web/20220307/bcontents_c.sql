DROP TABLE attachfile;
DROP TABLE bcontents CASCADE CONSTRAINTS;
CREATE TABLE bcontents(
        bcontentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        badminno                              NUMBER(10)     NOT NULL ,
        bcateno                                NUMBER(10)         NOT NULL ,
        title                                 VARCHAR2(300)         NOT NULL,
        content                               CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
        price                                 NUMBER(10)      DEFAULT 0 NULL,  
        dc                                    NUMBER(10)      DEFAULT 0 NULL,  
        saleprice                            NUMBER(10)      DEFAULT 0 NULL,  
        point                                 NUMBER(10)      DEFAULT 0 NULL,  
        salecnt                               NUMBER(10)      DEFAULT 0 NULL,  
  FOREIGN KEY (badminno) REFERENCES badmin (badminno),
  FOREIGN KEY (bcateno) REFERENCES bcate (bcateno)
);

COMMENT ON TABLE bcontents is '컨텐츠 - 영화 상품';
COMMENT ON COLUMN bcontents.bcontentsno is '컨텐츠 번호';
COMMENT ON COLUMN bcontents.badminno is '관리자 번호';
COMMENT ON COLUMN bcontents.bcateno is '카테고리 번호';
COMMENT ON COLUMN bcontents.title is '제목';
COMMENT ON COLUMN bcontents.content is '내용';
COMMENT ON COLUMN bcontents.recom is '추천수';
COMMENT ON COLUMN bcontents.cnt is '조회수';
COMMENT ON COLUMN bcontents.replycnt is '댓글수';
COMMENT ON COLUMN bcontents.passwd is '패스워드';
COMMENT ON COLUMN bcontents.word is '검색어';
COMMENT ON COLUMN bcontents.rdate is '등록일';
COMMENT ON COLUMN bcontents.file1 is '메인 이미지';
COMMENT ON COLUMN bcontents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN bcontents.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN bcontents.size1 is ' 메인 이미지 크기';
COMMENT ON COLUMN bcontents.price is '정가';
COMMENT ON COLUMN bcontents.dc is '할인률';
COMMENT ON COLUMN bcontents.saleprice is '판매가';
COMMENT ON COLUMN bcontents.point is '포인트';
COMMENT ON COLUMN bcontents.salecnt is '수량';

DROP SEQUENCE bcontents_seq;

CREATE SEQUENCE bcontents_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

