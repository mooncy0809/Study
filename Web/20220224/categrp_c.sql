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


/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE cate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		categrpno                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
);

COMMENT ON TABLE cate is '카테고리';
COMMENT ON COLUMN cate.cateno is '카테고리 번호';
COMMENT ON COLUMN cate.categrpno is '카테고리 그룹 번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';


/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NULL ,
		memberno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES cate (cateno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.cateno is '카테고리 번호';
COMMENT ON COLUMN contents.memberno is '회원 번호';


