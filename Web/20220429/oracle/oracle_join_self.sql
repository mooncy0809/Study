-- 첫번째 레코드 등록시 생성될 PK 값을 FK 값으로 사용해야 최초 등록 가능. 
-- 두번째부터는 FK값으로 생성될 PK를 지정.
           
DROP TABLE position;

CREATE TABLE position(
  positionno NUMBER(5) NOT NULL,
  name       VARCHAR(30) NOT NULL, 
  employee  VARCHAR(30) NOT NULL,
  officer     NUMBER(5) NOT NULL,
  PRIMARY KEY(positionno),
  FOREIGN KEY(officer) REFERENCES position(positionno)
);

COMMENT ON TABLE position is '직책';
COMMENT ON COLUMN position.positionno is '직책 번호';
COMMENT ON COLUMN position.name is '직책 이름';
COMMENT ON COLUMN position.employee is '사원명';
COMMENT ON COLUMN position.officer is '상급 직책 사원명';

SELECT MAX(positionno) as positionno FROM position;
positionno
-----------
null

SELECT MAX(positionno) + 1 as positionno FROM position;
positionno
-----------
null

SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position;
POSITIONNO
----------
         1

-- FK가 생성될 PK를 값으로하는 경우, 첫번째 레코드만 예외적으로 최초 등록 가능
SELECT positionno,name, employee, officer
FROM position
ORDER BY positionno ASC;

선택된 행 없음

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대표이사', '아로미', 1);
            
SELECT positionno,name, employee, officer
FROM position
ORDER BY positionno ASC;

 POSITIONNO   NAME     EMPLOYEE   OFFICER
 ---------------- -------     -------------  ----------
          1          대표이사  아로미            1
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '이사', '피어스', 10);
-- ORA-02291: integrity constraint (AI3.SYS_C007082) violated - parent key not found
-- ORA-02291: 무결성 제약조건(KD1.SYS_C008097)이 위배되었습니다- 부모 키가 없습니다

-- 이사의 상관은 대표이사           
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '이사', '왕눈이', 1);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1

-- 상무의 상관은 이사     
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '상무', '가길동', 2);

SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2

-- 부장의 상관은 상무            
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '부장', '나길동', 3);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '차장', '다길동', 4);

-- 차장의 상관은 부장   
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4

-- 과장의 상관은 차장
INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '과장', '라길동', 5);
            
INSERT INTO position(positionno,
                                 name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '과장2', '휴잭맨', 5);            
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨            5          

-- 대리의 상관은 과장
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대리', '마길동', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨            5                    
          8         대리        마길동            6

INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '대리', '홍길순', 6);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨            5          
          8         대리        마길동            6
          9         대리        홍길순            6
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '주임', '강하늘', 9);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨            5          
          8         대리        마길동            6
          9         대리        홍길순            6
          10       주임        강하늘            9
          
INSERT INTO position(positionno,
                              name, employee, officer)
VALUES((SELECT NVL(MAX(positionno), 0) + 1 as positionno FROM position),
            '사원', '공효진', 10);
       
SELECT * FROM position ORDER BY positionno ASC;

 POSITIONNO NAME     EMPLOYEE OFFICER
 --------------- ----------  ------------ ----------
          1         대표이사  아로미            1
          2         이사        왕눈이            1
          3         상무        가길동            2
          4         부장        나길동            3
          5         차장        다길동            4
          6         과장        라길동            5
          7         과장2      휴잭맨            5                
          8         대리        마길동            6
          9         대리        홍길순            6
         10        주임        강하늘            9
         11        사원        공효진            9
          
-- Self join
SELECT p.positionno, p.name, p.employee, p.officer,
          c.name, c.employee
FROM position p, position c
WHERE p.officer = c.positionno 
ORDER BY positionno ASC;

 POSITIONNO NAME EMPLOYEE OFFICER NAME EMPLOYEE
 ---------- ---- -------- ------- ---- --------
          1 대표이사 아로미            1 대표이사 아로미
          2 이사       왕눈이            1 대표이사 아로미
          3 상무       가길동            2 이사   왕눈이
          4 부장       나길동            3 상무   가길동
          5 차장       다길동            4 부장   나길동
          6 과장       라길동            5 차장   다길동
          7 과장2     휴잭맨            5 차장   다길동
          8 대리       마길동            6 과장   라길동
          9 대리       홍길순            6 과장   라길동
         10 주임      강하늘            9 대리   홍길순
         11 사원      공효진          10 주임   강하늘
         
-- ANSI
SELECT p.positionno, p.name, p.employee, p.officer,
          c.name, c.employee
FROM position p INNER JOIN position c
ON p.officer = c.positionno 
ORDER BY positionno ASC;

DELETE FROM position;

COMMIT;