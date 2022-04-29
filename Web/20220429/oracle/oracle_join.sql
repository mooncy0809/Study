-- FK를 무시하고 부모 테이블 삭제
-- DROP TABLE categrp CASCADE CONSTRAINTS;

1) 데이터 준비
SELECT * FROM categrp;
DELETE FROM categrp WHERE categrpno=1;
-- ORA-02292: 무결성 제약조건(KD1.SYS_C008063)이 위배되었습니다- 자식 레코드가 발견되었습니다.

SELECT * FROM cate;
SELECT * FROM cate WHERE categrpno=1;
DELETE FROM cate WHERE cateno=1;
ORA-02292: 무결성 제약조건(KD1.SYS_C008076)이 위배되었습니다- 자식 레코드가 발견되었습니다

SELECT * FROM contents;
DELETE FROM contents; -- 자식을 먼저 삭제
COMMIT;

SELECT * FROM cate ORDER BY cateno ASC;
DELETE FROM cate WHERE cateno > 3;
SELECT * FROM cate;
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         1          1 분식                                               2022-04-29 10:35:02          0
         2          1 한식                                               2022-04-29 10:35:10          0
         3          1 양식                                               2022-04-29 10:35:16          0
         
SELECT * FROM categrp;
DELETE FROM categrp WHERE categrpno > 1;
SELECT * FROM categrp ORDER BY categrpno ASC;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 푸드 코트                                                   1 Y 2022-04-29 10:34:36

2) 부모 테이블 생성 후 SELECT 결과
SELECT categrpno, name, seqno, visible, rdate
FROM categrp
ORDER BY categrpno ASC;
 CATEGRPNO NAME                                                    SEQNO V RDATE              
---------- -------------------------------------------------- ---------- - -------------------
         1 푸드 코트                                                   1 Y 2022-04-29 10:34:36

3) 자식 테이블 생성 후 SELECT 결과         
SELECT cateno, categrpno, name, rdate, cnt
FROM cate
ORDER BY cateno ASC;     
    CATENO  CATEGRPNO NAME                                               RDATE                      CNT
---------- ---------- -------------------------------------------------- ------------------- ----------
         1          1 분식                                               2022-04-29 10:35:02          0
         2          1 한식                                               2022-04-29 10:35:10          0
         3          1 양식                                               2022-04-29 10:35:16          0
         
4) Cross Join
- 정보로서 가치가 없음.
- 부모(PK) 테이블 레코드 2 건 x 자식(FK) 테이블 레코드 2건 = 6건
SELECT categrp.categrpno, categrp.name, categrp.seqno, cate.cateno, cate.name
FROM categrp, cate
ORDER BY categrp.categrpno ASC, cate.cateno ASC;
 CATEGRPNO NAME                                                    SEQNO     CATENO NAME                                              
---------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
         1 푸드코트                                                    1          1 분식                                              
         1 푸드코트                                                    1          2 한식                                              
         1 푸드코트                                                    1          3 양식                                              
         3 여행                                                        1          1 분식                                              
         3 여행                                                        1          2 한식                                              
         3 여행                                                        1          3 양식                                                                             


-- 테이블 별명
SELECT r.categrpno, r.name, r.seqno, c.cateno, c.name
FROM categrp r, cate c
ORDER BY r.categrpno ASC, c.cateno ASC;
 CATEGRPNO NAME                                                    SEQNO     CATENO NAME                                              
---------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
         1 푸드코트                                                    1          1 분식                                              
         1 푸드코트                                                    1          2 한식                                              
         1 푸드코트                                                    1          3 양식                                              
         3 여행                                                        1          1 분식                                              
         3 여행                                                        1          2 한식                                              
         3 여행                                                        1          3 양식                                            


-- 컬럼 별명, 동일한 컬럼명 NAME이 존재하는 경우
SELECT r.categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r, cate c
ORDER BY r.categrpno ASC, c.cateno ASC;
 CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
---------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
         1 푸드코트                                                    1          1 분식                                              
         1 푸드코트                                                    1          2 한식                                              
         1 푸드코트                                                    1          3 양식                                              
         3 여행                                                        1          1 분식                                              
         3 여행                                                        1          2 한식                                              
         3 여행                                                        1          3 양식                                     
                                   


-- ANSI(결과는 동일)
-- FROM 부모테이블 INNER JOIN 자식 테이블 ON 비교 조건
SELECT r.categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r CROSS JOIN cate c
ORDER BY r.categrpno ASC, c.cateno ASC;
 CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
---------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
         1 푸드코트                                                    1          1 분식                                              
         1 푸드코트                                                    1          2 한식                                              
         1 푸드코트                                                    1          3 양식                                              
         3 여행                                                        1          1 분식                                              
         3 여행                                                        1          2 한식                                              
         3 여행                                                        1          3 양식                

5) Equal JOIN(INNER JOIN)
- 2개의 테이블에서 categrpno 컬럼의 값이 일치하는 레코드만 병합하여 출력
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno,
       c.cateno, c.categrpno as c_categrpno, c.name as c_name
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno  -- PK = FK 비교
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_CATEGRPNO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- ----------- --------------------------------------------------
          1 푸드 코트                                                   1          1           1 분식                                              
          1 푸드 코트                                                   1          2           1 한식                                              
          1 푸드 코트                                                   1          3           1 양식                                              
                                       

          
-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r INNER JOIN cate c ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                            SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드 코트                                                       1          1 분식                                              
          1 푸드 코트                                                       1          2 한식                                              
          1 푸드 코트                                                       1          3 양식            

-- 테이블 순서를 변경해도 결과는 같음.          
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno,
       c.cateno, c.categrpno as c_categrpno, c.name as c_name
FROM cate c, categrp r 
WHERE c.categrpno = r.categrpno   -- FK = PK 비교
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_CATEGRPNO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- ----------- --------------------------------------------------
          1 푸드 코트                                                   1          1           1 분식                                              
          1 푸드 코트                                                   1          2           1 한식                                              
          1 푸드 코트                                                   1          3           1 양식        

-- ANSI, 테이블 순서를 변경해도 결과는 같음.   
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM cate c INNER JOIN categrp r ON c.categrpno = r.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드 코트                                                   1          1 분식                                              
          1 푸드 코트                                                   1          2 한식                                              
          1 푸드 코트                                                   1          3 양식               

★ FK 레코드 갯수 만큼 부모테이블의 레코드가 대응함 ★

-- ANSI + WHERE
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r INNER JOIN cate c ON r.categrpno = c.categrpno
WHERE c.name = '한식'
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드 코트                                                   1          2 한식                                              
                          
          
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r, cate c
WHERE (r.categrpno = c.categrpno) AND c.name = '분식'  -- 'sf' Error
ORDER BY r.categrpno ASC, c.cateno ASC;

R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          2 여행                                                        1          1 분식                                          


5. LEFT Outer join(부모 테이블 레코드 모두 출력), 일치하지않는 레코드의 출력, +: +의 반대편 테이블은 모든 레코드 출력
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r, cate c
WHERE r.categrpno = c.categrpno(+) -- 부모 PK = 자식 FK +
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드코트                                                    1          1 분식                                              
          1 푸드코트                                                    1          2 한식                                              
          1 푸드코트                                                    1          3 양식                                              
          3 여행                                                          1                                          
                                                   
          
-- ANSI
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r LEFT OUTER JOIN cate c ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드코트                                                    1          1 분식                                              
          1 푸드코트                                                    1          2 한식                                              
          1 푸드코트                                                    1          3 양식                                              
          3 여행                                                          1                                            

6. RIGHT Outer join(부모 테이블이 없을때 레코드가 추가된 경우)
- SELECT 결과가 없어야 정상적인 경우임, FK 값이 없는 레코드가 존재하는 비정상적인 경우
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r, cate c
WHERE r.categrpno(+) = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드코트                                                    1          1 분식                                              
          1 푸드코트                                                    1          2 한식                                              
          1 푸드코트                                                    1          3 양식                                              
                                        

         
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r RIGHT OUTER JOIN cate c ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드코트                                                    1          1 분식                                              
          1 푸드코트                                                    1          2 한식                                              
          1 푸드코트                                                    1          3 양식                                    

         
7. FULL Outer join
SELECT r.categrpno as r_categrpno, r.name as r_name, r.seqno, c.cateno, c.name as c_name
FROM categrp r FULL OUTER JOIN cate c ON r.categrpno = c.categrpno
ORDER BY r.categrpno ASC, c.cateno ASC;
R_CATEGRPNO R_NAME                                                  SEQNO     CATENO C_NAME                                            
----------- -------------------------------------------------- ---------- ---------- --------------------------------------------------
          1 푸드코트                                                    1          1 분식                                              
          1 푸드코트                                                    1          2 한식                                              
          1 푸드코트                                                    1          3 양식                                              
          3 여행                                                        1                    
          
8) 테이블 3개 join
INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
VALUES(contents_seq.nextval, 1, 1, '인터스텔라', '앤헤서웨이 주연', 0, 0, 0, '123', '우주', sysdate,
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);

INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
VALUES(contents_seq.nextval, 1, 1, '마션', '멧데이먼 주연 화성 탈출', 0, 0, 0, '123', '우주', sysdate,
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);
            
INSERT INTO contents(contentsno, adminno, cateno, title, content, recom, cnt, replycnt, passwd, word, rdate,
                              file1, file1saved, thumb1, size1, price, dc, saleprice, point, salecnt)
VALUES(contents_seq.nextval, 1, 1, 'AI', '주드로', 0, 0, 0, '123', '로봇,인공지능', sysdate,
            'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 2000, 10, 1800, 100, 500);            
            
SELECT contentsno, adminno, cateno, SUBSTR(title, 1, 20) as title FROM contents;
CONTENTSNO    ADMINNO     CATENO TITLE               
---------- ---------- ---------- --------------------
         1          1          1 인터스텔라          
         2          1          1 마션                
         3          1          1 AI                          

SELECT r.categrpno as r_categrpno, SUBSTR(r.name, 1, 10) as r_name, r.seqno,
        c.cateno, c.categrpno as c_categrpno, SUBSTR(c.name, 1, 10) as c_name,
        t.contentsno, t.adminno, t.cateno as t_cateno, SUBSTR(title, 1, 20) as title
FROM categrp r, cate c, contents t
WHERE r.categrpno = c.categrpno AND c.cateno = t.cateno
ORDER BY r.categrpno ASC, c.cateno ASC, t.contentsno;
R_CATEGRPNO R_NAME          SEQNO     CATENO C_CATEGRPNO C_NAME     CONTENTSNO    ADMINNO   T_CATENO TITLE               
----------- ---------- ---------- ---------- ----------- ---------- ---------- ---------- ---------- --------------------
          1 푸드코트            1          1           1 분식                1          1          1 인터스텔라          
          1 푸드코트            1          1           1 분식                2          1          1 마션                
          1 푸드코트            1          1           1 분식                3          1          1 AI                  
          
          
-- 축적인 조건의 명시
SELECT r.categrpno as r_categrpno, SUBSTR(r.name, 1, 10) as r_name, r.seqno,
        c.cateno, c.categrpno as c_categrpno, SUBSTR(c.name, 1, 10) as c_name,
        t.contentsno, t.adminno, t.cateno as t_cateno, SUBSTR(title, 1, 20) as title
FROM categrp r, cate c, contents t
WHERE (r.categrpno = c.categrpno AND c.cateno = t.cateno) AND title LIKE '%AI%'
ORDER BY r.categrpno ASC, c.cateno ASC, t.contentsno;
R_CATEGRPNO R_NAME          SEQNO     CATENO C_CATEGRPNO C_NAME     CONTENTSNO    ADMINNO   T_CATENO TITLE               
----------- ---------- ---------- ---------- ----------- ---------- ---------- ---------- ---------- --------------------
          1 푸드코트            1          1           1 분식                3          1          1 AI      
-- ANSI
SELECT r.categrpno as r_categrpno, SUBSTR(r.name, 1, 10) as r_name, r.seqno,
        c.cateno, c.categrpno as c_categrpno, SUBSTR(c.name, 1, 10) as c_name,
        t.contentsno, t.adminno, t.cateno as t_cateno, SUBSTR(title, 1, 20) as title
FROM categrp r INNER JOIN cate c ON r.categrpno = c.categrpno
                     INNER JOIN contents t ON c.cateno = t.cateno
WHERE title LIKE '%AI%'
ORDER BY r.categrpno ASC, c.cateno ASC, t.contentsno;
R_CATEGRPNO R_NAME          SEQNO     CATENO C_CATEGRPNO C_NAME     CONTENTSNO    ADMINNO   T_CATENO TITLE               
----------- ---------- ---------- ---------- ----------- ---------- ---------- ---------- ---------- --------------------
          1 푸드코트            1          1           1 분식                3          1          1 AI              