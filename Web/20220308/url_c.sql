/**********************************/
/* Table Name: 즐겨찾기 내용 */
/**********************************/
DROP TABLE url CASCADE CONSTRAINTS;
CREATE TABLE url(
		urlno                         		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		url                           		VARCHAR2(1000)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		urlgrpno                      		NUMBER(7)		 NOT NULL,
  FOREIGN KEY (urlgrpno) REFERENCES urlgrp (urlgrpno)
);

COMMENT ON TABLE url is '즐겨찾기 내용';
COMMENT ON COLUMN url.urlno is '즐겨찾기 번호';
COMMENT ON COLUMN url.title is '즐겨찾기 이름';
COMMENT ON COLUMN url.url is '주소';
COMMENT ON COLUMN url.rdate is '날짜';
COMMENT ON COLUMN url.urlgrpno is 'urlgrpno';

CREATE SEQUENCE url_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

INSERT INTO url(urlno,title,url,rdate,urlgrpno)
VALUES(url_seq.nextval,'강화도 카페','http://www.naver.com',sysdate,6);


