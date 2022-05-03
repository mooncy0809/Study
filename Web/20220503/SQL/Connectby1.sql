-- Connect By 문제 1
DROP TABLE connect1;
CREATE TABLE connect1(
  남성의류 varchar(15) NULL,
  여성의류 varchar(15) NULL,
  의류번호 number(3)   NULL
);

INSERT INTO connect1(남성의류, 여성의류, 의류번호) VALUES('아웃솔더', '양말', 1);
INSERT INTO connect1(남성의류, 여성의류, 의류번호) VALUES('가디건', '아웃솔더', 2);
INSERT INTO connect1(남성의류, 여성의류, 의류번호) VALUES('겨울외투', '가디건', 3);
INSERT INTO connect1(남성의류, 여성의류, 의류번호) VALUES('자켓', '겨울외투', 4);
INSERT INTO connect1(남성의류, 여성의류, 의류번호) VALUES(NULL, '자켓', 5);

SELECT * FROM connect1;

남성의류           여성의류        의류번호
--------------- --------------- ----------
아웃솔더           양말                     1
가디건            아웃솔더                 2
겨울외투           가디건                   3
자켓              겨울외투                 4
null             자켓                     5
-- Chain식 연결
SELECT * FROM connect1
START WITH 남성의류 IS NULL  -- 최우선 출력
CONNECT BY PRIOR 여성의류= 남성의류; -- 레코드가 순서가 여성의류가 먼저 출력됨.

남성의류           여성의류         의류번호
--------------- --------------- ----------
null             자켓                   5
자켓              겨울외투                4
겨울외투           가디건                  3
가디건            아웃솔더                2
아웃솔더          양말                    1

SELECT * FROM connect1
START WITH 남성의류 IS NULL
CONNECT BY 남성의류 = PRIOR 여성의류;

남성의류            여성의류        의류번호
--------------- --------------- ----------
null            자켓                   5
자켓            겨울외투                 4
겨울외투         가디건                  3
가디건           아웃솔더                2
아웃솔더         양말                    1

- ERROR: SQL 오류: ORA-00908: 누락된 NULL 키워드
SELECT * FROM connect1
START WITH 남성의류 IS '가디건'
CONNECT BY PRIOR 여성의류= 남성의류;


SELECT * FROM connect1
START WITH 남성의류 IS NULL
CONNECT BY PRIOR 남성의류= 여성의류;

남성의류            여성의류        의류번호
--------------- --------------- ----------
                  자켓              5
                
                
-- Connect By 문제 2
DROP TABLE connect2;
CREATE TABLE connect2(
  부서번호 number(3) NULL,
  부서코드 number(3) NULL,
  상위부서코드 number(3)   NULL
);

INSERT INTO connect2(부서번호, 부서코드, 상위부서코드) VALUES(10, 50, 0);
INSERT INTO connect2(부서번호, 부서코드, 상위부서코드) VALUES(20, 100, 50);
INSERT INTO connect2(부서번호, 부서코드, 상위부서코드) VALUES(30, 150, 100);
INSERT INTO connect2(부서번호, 부서코드, 상위부서코드) VALUES(40, 200, 150);
INSERT INTO connect2(부서번호, 부서코드, 상위부서코드) VALUES(50, 250, 200);

SELECT * FROM connect2;

부서번호       부서코드  상위부서코드
---------- ---------- ----------
        10         50          0
        20        100         50
        30        150        100
        40        200        150
        50        250        200
        
SELECT 상위부서코드        
FROM connect2
START WITH 상위부서코드 = 0
CONNECT BY PRIOR 부서코드 = 상위부서코드;

    상위부서코드
----------
         0
        50
       100
       150
       200

SELECT 상위부서코드        
FROM connect2
WHERE 부서코드 = 100
START WITH 상위부서코드 = 0
CONNECT BY PRIOR 부서코드 = 상위부서코드;

    상위부서코드
----------
        50    

부서번호       부서코드  상위부서코드
---------- ---------- ----------
        10         50          0
        20        100         50
        30        150        100
        40        200        150
        50        250        200
        
SELECT 상위부서코드        
FROM connect2
WHERE 부서코드 >= 150
START WITH 상위부서코드 = 0
CONNECT BY PRIOR 부서코드 = 상위부서코드;

    상위부서코드
----------
       100
       150
       200

부서번호       부서코드  상위부서코드
---------- ---------- ----------
        10         50          0
        20        100         50
        30        150        100
        40        200        150
        50        250        200
        
SELECT 부서번호, 상위부서코드        
FROM connect2
WHERE 부서코드 >= 150
START WITH 상위부서코드 = 0
CONNECT BY PRIOR 부서코드 = 상위부서코드;

      부서번호     상위부서코드
---------- ----------
        30        100
        40        150
        50        200

commit;
