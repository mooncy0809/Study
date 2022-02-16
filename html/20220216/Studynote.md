## <DIV> 태그를 의미(시멘틱) 기반으로 세분화 시킨 HTML5 신규 태그
     - HTML4에서 HTML5로 넘어가면서 태그에 의미가 부여되는 기능이
       추가되었습니다.
     - DIV의 기능과 많이 비슷합니다.

1. \<HEADER>
- 화면 상단의 제목을 의미
 
 
2. \<NAV>
- 메뉴를 의미
 
 
3. \<ASIDE>
- 서브 메뉴를 의미하며 화면 우측등에 출력.
    
  
4. \<SECTION>
- 내용을 분할함을 의미, 미디어 뉴스의 분야등을 의미 
- <SECTION> 태그로 다시 분할될 수 있습니다.
  
   
5. \<ARTICLE>
- <SECTION> 태그에 속해서 출력되는 내용을 의미
- 한건의 기사등
 
 
6. \<FOOTER>
- 화면 하단에 출력되는 내용을 의미
  
## TABLE 관련 태그
      - <TABLE>, <CAPTION>, <COLGROUP>, <TR>, <TD>, <THEAD>, <TBODY>, <TFOOT> 태그
      - 행과 열의 구조를 갖는 양식 제작시 사용합니다.
      - 게시판 형태의 컨텐츠 출력에 사용합니다.
      - 테이블 사용예)
        . Google '이력서, web 재고 관리' 이미지 검색
        . 기상청 예보 
 
 
1. \<TABLE>
- 행과 열의 구조를 출력하는 태그


2. \<COLGROUP>
- 컬럼의 그룹으로 지정하여 공통으로 속성 적용
- 전체 \<TH>\<TD> 태그에 공통적으로 적용됨.
- 생략 가능 
 

3. \<CAPTION>
- 테이블 제목 출력
- 생략 가능

 
4. \<TR>: Table Row
- 행을 출력하는 태그
 
 
5. \<TH>: Table Header
- 컬럼의 제목을 출력하는 태그
- 강조 효과(Bold)와 가운데 정렬(Text-align: center)을 지원합니다.
- <TR> 태그의 구성 요소
 
  
6. \<TD>: Table Data
- 열을 출력하는 태그, 데이터 출력
- <TR> 태그의 구성 요소
 
 
7. \<THEAD>
- 테이블 머리말을 출력하는 태그
- 생략 가능
 
 
8. \<TBODY>
- 테이블 내용을 출력하는 태그
- 생략 가능
 
 
9. \<TFOOT> 태그
- 테이블 하단을 출력하는 태그
- 생략 가능
 
 
10. colspan 속성
- 열 합치기


11. rowspan 속성
- 행 합치기
  
## HTML5 신규 지원 태그
1. input type='number'
    - 사용법: \<input type='number' name='interest' min='0.0' max='20.9' step='0.1' value='15.0'>
    - type='number': 숫자만 입력 가능
    - min: 최소값
    - max: 최대값
    - step: 값의 변화 단위
    - value: 초기값
 
 
2. input type="range": 입력값의 수직선 UI 지원, 특정 범위의 입력값의 제한
   - size: 속성 작동
 
 
3. \<METER>
   - 현재 상태값을 그래프로 출력
   - 입력을 받을 수 없고 현재 상태만 출력합니다.
   - MS IE 지원 안함, Windows 10 엣지는 정상 출력.
   - 예) 온도
     
  
4. \<PROGRESS>
   - 진행중인 상태값을 그래프로 출력
   - 입력을 받을 수 없고 현재 상태만 출력합니다.
    예) 다운로드 진행 사항  
 
 
5. input type='date'
   - value 속성의 값을 생략하면 현재 날짜가 선택됨.
   - 날짜 입력 및 출력 지원
   - DBMS 컬럼은 문자열 형태로 저장을 권장: 2020-11-15
   - 기간 SQL: WHERE shopping_begin >= '2020-11-05' AND shopping_end <= '2020-11-15'
 
 
6. input type='time'
   - 시간 입력 및 출력 UI 지원
   - value 값에따라 오전오후 자동 변경 value='09:30',  value='15:30'
   - DBMS 컬럼은 문자열 형태로 저장을 권장: 15:30
 
 
7. \<OPTGROUP>: option 태그의 그룹화 태그
    \<label>
      예약 메뉴:
      <select name="food">
        <optgroup label="김밥류">
          <option value='야채 김밥'>야채 김밥</option>
          <option value='참치 김밥'>참치 김밥</option>
          <option value='김치 김밥'>김치 김밥</option>
        </optgroup>
        <optgroup label="면류">
          <option value='라면'>라면</option>
          <option value='짬뽕라면'>짬뽕라면</option>
          <option value='해물라면'>해물라면</option>
        </optgroup>
        <optgroup label="밥">
          <option value='김치찌게'>김치찌게</option>
          <option value='참치찌게'>참치찌게</option>
          <option value='부대찌게'>부대찌게</option>
        </optgroup>
      </select>
    \</label>
 
 
8. \<BUTTON>: 버튼 기능 지원
   1) submit: 전송, <input type='submit'...
   2) reset: 초기값인 value 속성의 값으로 재설정, <input type='reset'...
   3) button: onclick으로 자바 스크립트를 연결해야 기능이 작동합니다., <input type='button'...
