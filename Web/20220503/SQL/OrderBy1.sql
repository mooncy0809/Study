-- 1. 정렬 문제 1
DROP TABLE player;
CREATE TABLE player(
  player_name VARCHAR(15),
  position    VARCHAR(10),
  back_no     NUMBER(3)
);

INSERT INTO player(player_name, position, back_no) VALUES('나길동', 'MF', 7);
INSERT INTO player(player_name, position, back_no) VALUES('가길동', 'GK', 3);
INSERT INTO player(player_name, position, back_no) VALUES('가길동', 'FW', 5);
INSERT INTO player(player_name, position, back_no) VALUES('가길동', 'FW', 9);

SELECT player_name, position, back_no FROM player;
commit;

SELECT player_name 선수명, position 포지션, back_no 백넘버
FROM player
ORDER BY player_name, position, back_no DESC;

선수명             포지션               백넘버
--------------- ---------- ----------
가길동          FW                  9
가길동          FW                  5
가길동          GK                  3
나길동          MF                  7

SELECT player_name 선수명, position 포지션, back_no 백넘버
FROM player
ORDER BY 선수명 ASC, 포지션, 3 DESC; -- 3번째 SELECT 컬럼

선수명             포지션               백넘버
--------------- ---------- ----------
가길동          FW                  9
가길동          FW                  5
가길동          GK                  3
나길동          MF                  7


-- 2. 정렬 문제 2
-- RANK(): 순위, 같은 점수에 대해서 같은 순위가 부여되고 누락된 등수가 발생함.
SELECT RANK() OVER(ORDER BY player_name) as 순위, player_name as 선수명, position, back_no FROM player;
        순위 선수명             POSITION      BACK_NO
---------- --------------- ---------- ----------
         1 가길동          GK                  3
         1 가길동          FW                  9
         1 가길동          FW                  5
         4 나길동          MF                  7
         
SELECT RANK() OVER(ORDER BY player_name DESC) as 순위, player_name as 선수명, position, back_no FROM player;
        순위 선수명             POSITION      BACK_NO
---------- --------------- ---------- ----------
         1 나길동          MF                  7
         2 가길동          FW                  5
         2 가길동          FW                  9
         2 가길동          GK                  3

-- 등수 누락이 발생되지 않음.
SELECT DENSE_RANK() OVER(ORDER BY player_name) as 순위, position, back_no FROM player;
        순위 POSITION      BACK_NO
---------- ---------- ----------
         1 GK                  3
         1 FW                  9
         1 FW                  5
         2 MF                  7

SELECT DENSE_RANK() OVER(ORDER BY player_name, position) as 순위,  
       player_name as 선수명, position, back_no FROM player;
        순위 선수명           POSITION      BACK_NO
---------- --------------- ---------- ----------
         1  가길동           FW                  5
         1  가길동           FW                  9
         2  가길동           GK                  3
         3  나길동           MF                  7
         
SELECT DENSE_RANK() OVER(ORDER BY player_name, position, back_no DESC) as 순위, 
       player_name as 선수명, position, back_no FROM player;
        순위 선수명             POSITION      BACK_NO
---------- --------------- ---------- ----------
         1 가길동          FW                  9
         2 가길동          FW                  5
         3 가길동          GK                  3
         4 나길동          MF                  7

-- 무조건 고유한 등수 할당         
SELECT ROW_NUMBER() OVER(ORDER BY player_name) as 순위, player_name as 선수명, position, back_no FROM player;
        순위 선수명             POSITION      BACK_NO
---------- --------------- ---------- ----------
         1 가길동          GK                  3
         2 가길동          FW                  9
         3 가길동          FW                  5
         4 나길동          MF                  7

commit;         