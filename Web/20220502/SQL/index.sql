- PURGE 테이블 삭제시 휴지통에 버리지 말것, 즉시 삭제, 개발자 버전은 휴지통기능 지원 안함. 
DROP TABLE itpay2 PURGE;
 
CREATE TABLE itpay2(
    payno   NUMBER(7)   NOT NULL,  -- 1 ~ 9999999
    part    VARCHAR(20) NOT NULL,  -- 부서명
    sawon   VARCHAR(10) NOT NULL,  -- 사원명
    age     NUMBER(3)   NOT NULL,  -- 나이, 1 ~ 999
    address VARCHAR(50) NOT NULL,  -- 주소
    month   CHAR(6)     NOT NULL,  -- 급여달, 200805
    gdate   DATE        NOT NULL,  -- 수령일
    bonbong NUMBER(8)   DEFAULT 0, -- 본봉  
    tax     NUMBER(7, 2)   DEFAULT 0, -- 세금, 전체 자리, +-99999.99
    bonus   NUMBER(7)       NULL,  -- 보너스
    family  NUMBER(7)       NULL,  -- 가족 수당
    PRIMARY KEY(payno)
);

1) 기존 레코드 삭제
DELETE FROM itpay2;
 
2) sample용 레코드 추가
INSERT INTO itpay2(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(1, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(2, '디자인팀', '나길동', 30, '인천시 계양구','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(3, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(4, '개발팀', '라길동', 36, '경기도 부천시','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(5, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(6, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(7, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(8, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(9, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus) 
VALUES(10, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(11, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(12, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(13, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(14, '디자인팀', '나길동', 30, '인천시 계양구', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(15, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(16, '개발팀', '라길동', 36, '경기도 부천시', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(17, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(18, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(19, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(20, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(21, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(22, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(23, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(24, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(25, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(26, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(27, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(28, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(29, '개발팀', '마길순', 27, '서울시 종로구', '200804', sysdate, 2200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(30, '개발팀', '바길순', 28, '서울시 종로구', '200804', sysdate, 2200000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(31, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address,month, gdate, bonbong, tax, bonus)
VALUES(32, '디자인팀', '나길동', 30, '인천시 계양구','200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(33, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(34, '개발팀', '라길동', 36, '경기도 부천시','200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(35, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(36, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(37, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(38, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(39, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(40, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(41, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(42, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(43, '디자인팀', '가길동', 27, '경기도 성남시', '200801', sysdate, 1530000, 12345.67, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(44, '디자인팀', '나길동', 30, '인천시 계양구', '200801', sysdate-5, 1940000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(45, '개발팀', '다길동', 34, '경기도 성남시', '200801', sysdate-3, 2890000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(46, '개발팀', '라길동', 36, '경기도 부천시', '200802', sysdate-1, 4070000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(47, 'DB설계팀', '마길동', 38, '경기도 부천시', '200802', sysdate-0, 2960000, 0, 0);
  
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(48, '기획설계팀', '바길동', 40, '서울시 강서구', '200802', sysdate-0, 3840000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(49, '개발팀', '사길동', 42, '인천시 계양구', '200803', sysdate-0, 4230000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(50, 'DB설계팀', '김길동', 42, '경기도 부천시', '200803', sysdate-1, 4010000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(51, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(52, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(53, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(54, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(55, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(56, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(57, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(58, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(59, '개발팀', '마길순', 27, '서울시 종로구', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(60, '개발팀', '바길순', 28, '서울시 종로구', '200804', sysdate, 2200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(61, 'DB설계팀', '이길동', 42, '서울시 강서구', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(62, '개발팀', '신길동', 33, '서울시 관악구', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(63, '개발팀', '최길동', 31, '서울시 관악구', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(64, '개발팀', '마길동', 29, '서울시 관악구', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(65, '개발팀', '가길순', 23, '경기도 고양시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(66, '개발팀', '나길순', 24, '경기도 파주시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(67, '개발팀', '다길순', 25, '경기도 안양시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(68, '개발팀', '라길순', 26, '서울시 종로구', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(69, '개발팀', '마길순', 27, '서울시 구로구', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(70, '개발팀', '바길순', 28, '경기도 안양시', '200804', sysdate, 2200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(71, 'DB설계팀', '이길동', 42, '경기도 과천시', '200803', sysdate-1, 3500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(72, '개발팀', '신길동', 33, '경기도 시흥시', '200804', sysdate, 3500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(73, '개발팀', '최길동', 31, '경기도 부천시', '200804', sysdate, 4500000, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(74, '개발팀', '마길동', 29, '경기도 고양시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax)
VALUES(75, '개발팀', '가길순', 23, '경기도 구리시', '200804', sysdate, 3200000, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(76, '개발팀', '나길순', 24, '경기도 포천시', '200804', sysdate, 3200000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(77, '개발팀', '다길순', 25, '경기도 파주시', '200804', sysdate, 2500000, 0, 0);
 
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(78, '개발팀', '라길순', 26, '서울시 양주시', '200804', sysdate, 2300000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(79, '개발팀', '마길순', 27, '서울시 의왕시', '200804', sysdate, 2200000, 0, 0);
       
INSERT INTO itpay2(payno, part, sawon, age, address, month, gdate, bonbong, tax, bonus)
VALUES(80, '개발팀', '바길순', 28, '서울시 과천시', '200804', sysdate, 2200000, 0, 0);

SELECT COUNT(*) FROM itpay2;
        
3) index가 없는 address 컬럼의 검색, 0.124 초
SELECT * FROM itpay2 WHERE address = '서울시 종로구';
  
4) index 생성: 테이블명_컬럼명_idx
-- CREATE INDEX index 이름 ON 테이블명(컬럼명);
CREATE INDEX itpay2_address_idx ON itpay2(address);
 
5) index 사용, 별다른 선언 필요 없음, 0.055 초
SELECT * FROM itpay2 WHERE address = '서울시 종로구';

6) index를 사용하지 못하는 사례, 데이터 변형, 0.072초
SELECT * FROM itpay2 WHERE SUBSTR(address, 1, 7) = '서울시 종로구';

7) index 삭제
DROP INDEX itpay2_address_idx;
 
8) 영어로된 이름을 대문자로 변경하여 함수기반 인덱스를 생성한 경우
CREATE INDEX emp_sawon_idx ON itpay2(UPPER(sawon));
