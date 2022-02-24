## Amateras ERD 툴을 이용한 DBMS 모델링
```
1. 테이블 설계
① 업무 분석
② 테이블명 명사 도출
③ 테이블의 레코드를 고유하게 구분할 Primary Key 컬럼 산출
④ 테이블간 종속 관계 설정: 1 대 다
    종속: PK 컬럼(1) <---> 피 종속: FK 컬럼(*)
⑤ 일반 컬럼 추가
⑥ SQL 생성 및 테스트
 
 
2. 테이블 종류
   - 종류 1: 데이터를 나타내는 테이블  예) 상품
   - 종류 2: 데이터의 운영에의해서 발생하는 테이블 예) 쇼핑카트, 구입, 주문, 배송
   - 종류 3: 다른 시스템에서 상품을 가져오는 경우 예) 다음 쇼핑/네이버 쇼핑 --> Auction, 쿠팡

   1) categrp: 카테고리 그룹
   2) category: 카테고리 그룹에 속한 카테고리
   3) contents: 블로그, 상품
   4) reply    : 댓글, 상품평
   5) cart      : 쇼핑 카트
   6) reservation: 예약
   7) resitem  : 예약 항목
   8) point    : 포인트  
   9) member: 회원
   10) admin  : 사원
   11) auth    : 권한(직책)
   12) url      :접속 가능 주소 
   13) urlauth: 권한별 접근 URL
   14) survey : 설문 조사
   15) surveyitem : 설문 조사 항목
   16) surveyparti : 설문 참여
   17) log     : 로그
   18) gallery: 갤러리
   19) qna: 질문답변

3. 그룹의 사용: 영화
   1) 장르: genre
       - SF, 스릴러, 드라마, 유머, 가족...
   2) 장르에 속한 영화: movie
       - SF 속한 영화: 인터스텔라, AI
       - 드라마: 맘마미아, 월터의 상상은 현실이된다., 악마는 프라다를 입는다.

4. 그룹의 사용: 여행
   1) 여행 카테고리 그룹: tripcategrp
      - 국내, 해외, 화성...
   2) 여행 카테고리: tripcate
       - 국내에 속한 카테고리: 서울/인천, 경기도, 강원도, 충청북도, 충청남도...
   3) 여행 후기: trip
       - 강원도에 속한 여행: 카페산 카페, 대관령 삼양목장, 선돌관광지

5. 다양한 형태의 대응 구조
   1) 카테고리 그룹: categrp
       - 영화, 여행, 이용후기, Q/A...
   2) 카테고리: cate
       - 영화에 속한 장르: SF, 스릴러, 드라마...
       - 여행에 속한 구분: 국내, 해외...
       - 이용후기에속한 구분: 객실, 식당, 게임장, 노래방, 슈퍼마켓...
   3) 컨텐츠: contents
       - SF에 속한 영화 소개
       - 국내에 속한 여행지 안내: 선돌관광지
       - 식당에 속한 이용 후기
   4) 첨부파일: attachfile
       - 선돌관광지에 속한 첨부 파일 200장...
   5) 댓글: reply
       - 선돌관광지에 속한 댓글
   6) 회원: memeber
       - 글을 쓸수 있는 권한
   7) 관리자: admin
      - 문제 컨텐츠의 관리
```      
### 모델링
■ 개념적 모델링
   - 전체적인 업무의 흐름을 파악하는 모델링으로 생략하는 경우가 많음.<br>
   ![image](https://user-images.githubusercontent.com/84116509/155483873-51a6be78-e179-4491-82ec-1c038885829f.png)
<br>
■ 논리적 모델링 테이블: 실제 생성되는 테이블명이 아니라 저장되는 내용을 참고하여 이름 지정, 데이터베이스 결정되지 않아도 상관 없음.
<br>
■ 물리적 테이블: 실제 물리적으로 DBMS 디스크상에 생성해야할 테이블명, DBMS가 결정되어 있어야함.

# DBMS 설계, SQL
```
1. 컬럼명 설계의 규칙 결정
① 기본적인 컬럼명 명시(권장)
    - 간결해서 개발자에게 편리함을 제공합니다.
    - 일부 컬럼들이 Join시에 컬럼명 충돌이 발생할 수 있음으로
       as등의 키워드를 이용하여 컬럼명을 새로 지정함.
   CREATE TABLE categrp(
       categrpno       NUMBER(7)       NOT NULL    PRIMARY KEY,
       name             VARCHAR2(50)  NOT NULL,
       seqno             NUMBER(7)       DEFAULT 0     NOT NULL
   );

② 테이블명을 결합한 컬럼명 명시
   - 고유한 테이블명이 결합됨으로 Join 시에 충돌이 발생하지 않습니다.
   - 개발자가 코딩시에 코딩량이 많이 증가합니다.
   CREATE TABLE categrp(
       categrpno       NUMBER(7)       NOT NULL    PRIMARY KEY,
       cagegrpname   VARCHAR2(50)  NOT NULL,
       categrpseqno   NUMBER(7)       DEFAULT 0     NOT NULL
   );
 
③ 테이블명 + '_'를 결합한 컬럼명 명시
   - 고유한 테이블명이 결합됨으로 Join 시에 충돌이 발생하지 않습니다.
   - 개발자가 코딩시에 코딩량이 많이 증가합니다.
   CREATE TABLE categrp(
       categrp_no       NUMBER(7)       NOT NULL    PRIMARY KEY,
       cagegrp_name   VARCHAR2(50)  NOT NULL,
       categrp_seqno   NUMBER(7)       DEFAULT 0     NOT NULL
   );
  
  
2. PK(Primary Key) 설계
- PK 컬럼명은 프로젝트 전체에서 고유하게 해야함, 중복되면 join시 문제 발생.
- 숫자일경우: 테이블명 + no
- 문자일경우: 테이블명 + id

3. FK(Foreign Key: 외부키) 설계
   - 일반적인 테이블은 PK가 반드시 있어야하며, 테이블 안에서 레코드를 고유하게 구분하는 역활을 함.
   - Foreign Key(FK): 현재 레코드가 어느 테이블의 PK, Unique에 속하는지의 정보를 나타냄, 속하는 그룹을 명시
   - 관계형 데이터베이스(RDBMS)는 테이블간에 종속(부모/자식, 그룹/구성원) 관계가 FK로 선언됨
   - FK 컬럼은 INSERT SQL 실행시 다른 테이블의 PK/Unique 컬럼의 값을 사용함.
   - 테이블간에 논리적으로 정상적인 관계(relationship) 설정이되어야 JAVA등의 application 개발자가 혼동이 줄어듬. 
   - FK 컬럼의 판단 여부는 테이블간에 포함 여부를 파악하여 결정할 필요가 있음.
```

## EL&JSTL의 사용
- JSTL 선언 : \<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

1. 변수지원 태그 
- 천단위 구분자 출력
  ```
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <fmt:formatNumber value="${pay }" pattern="￦ #,###" /> 
  ```

▷ /webapp/jstl/setTag.jsp 
<HR>
```<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>http://localhost:9091/jstl/setTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head> 
 
<body>
   <!-- JSTL -->

   
   ${img } JAVA<BR>
   ${img } JSP<BR>
   ${img } SPRING<BR>
   ${img } MyBATIS<BR>
   ${img } R<BR>
   ${img } Python<BR>
   ${img } Crawling<BR>
   ${img } Analysis<BR>
   ${img } Machine Learning<BR> 
   
   <br>
   <!-- Scriptlet을 값으로 할당 -->

   <!-- 천단위 구분자 콤마 출력 -->
   <%
   int pay = 2500000;
   request.setAttribute("pay", pay);
   %>
   급여: <fmt:formatNumber value="${pay }" pattern="￦ #,###" />
   
</body>
 
</html>```
<HR>
    
2. if 흐름제어 태그의 사용 
   - test: 조건을 명시하며, 'test'란 속성명은 변경 할 수 없습니다, test는 변수가 아님.
   - else문은 현재 지원하지 않습니다. 
   - JSTL상에서의 제어문은 태그를 오히려 식별하기 어렵게 할 수 있음으로 
     최소로 사용해야 합니다. 
   - param.name: request.getParameter("name");와 동일
   - param.age : Integer.parseInt(request.getParameter("age"));와 동일, 자동 형변환
   - IE는 주소 표시줄에 한글 직접 입력시 깨짐으로 크롬을 이용하세요.
     <FORM>태그에서의 데이터 입출력은 정상적으로 이루어짐.  
   - 사용예
    ``` 
     <c:if test="${vo.name == 'kim' && vo.nickname == 'kim'}">...</c:if> 
     <c:if test="${vo.name == 'kim' || vo.nickname == 'kim'}">...</c:if> 
     ```
<hr>
```
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/ifTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
    <c:if test="true">
        무조건 실행 <br>
     </c:if> <%-- if(true)랑 같음 --%>
 
    <c:set var="score" value="85"/>
    <c:if test="${score >= 60 }">
        ${score } 점 합격 <br>
     </c:if> 
     
     <%-- if(request.getParameter("code").equals("AO1")) --%>
     <c:if test="${param.code == 'A01' }">
        ${param.code }은 서울을 나타냅니다.<br>
     </c:if>
     
     <%-- if(request.getParameter("code").equals("AO1") == false) --%>
     <c:if test="${param.code != 'A01' }">
        ${param.code }은 서울이 아닙니다.<br>
     </c:if>
     
     <%-- if(request.getParameter("code").equals("AO1") == false) --%>
     <c:if test="${param.code.toUpperCase() == 'A01' }">
        ${param.code }은 서울을 나타냅니다.<br>
     </c:if>
     
    <!-- IE 11은 URL에 직접 한글 입력시 에러 발생,
         아래처럼 변환 코드 사용, <FROM>에서는 자동으로 변경됨. 
  IE:
http://localhost:9091/jstl/ifTag.jsp?code=a01&lang=%EC%9E%90%EB%B0%94&year=6&cpu=intel&calc=6.0
  -->
  <c:if test="${param.lang == '자바'}">
    개발 분야: ${param.lang }<br>
  </c:if>
  
  <c:if test="${param.year >= 6 }">
    중급 개발자<br>
  </c:if>

  권장 AI 개발 Device: ${param.cpu } CUDA ${param.calc }<br>
  <c:if test="${param.cpu == 'intel' and param.calc >= 6.0 }">
    GPU 기반 개발 가능<br>
  </c:if> 
  <br>
    
</body>
</html>
```
[실행 화면]
무조건 수행
a01는 서울이 아닙니다.
a01는 서울입니다.(대문자 변환)
개발 분야: 자바
개발 경력: 5 중급 개발자
권장 AI 개발 Device: intel CUDA 3.0
GPU 기반 개발 가능
<hr>

3. choose Tag 
   - when tag는 조건이 true이면 실행합니다. 
   - if ~ else ~ 문과 같은 역활을 함. 
<hr>
```
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/chooseTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
<c:choose>
        <c:when test="${param.year >= 0 and param.year <= 5 }"> <!-- if -->
            초급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 6 and param.year <= 10 }"> <!--  else if -->
            중급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 11 and param.year <= 15 }">
            고급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 16 }">
            특급 개발자<br><br>
        </c:when>
        <c:otherwise>  <!-- else -->
            개발 등급이 없습니다.
        </c:otherwise>
    </c:choose>a

</body>
</html>
```        
[실행 화면]
- http://localhost:9091/jstl/chooseTag.jsp
개발 등급이 없습니다.        
<hr> 
4. forEach 태그 
   - Collection, Map에 저장되어 있는 값에 순차적으로 접근시에 사용합니다. 
   - var="item": 객체나 배열의 값이 하나씩 추출되어 저장될 변수나 객체명. 
   - items="${datas }": mav.addObject("datas", ...)으로 저장된 객체, 배열, ArrayList등 저장.  
   - varStatus="info": 순환문에서 변화하는 순서값등을 제공 "info"등의 문자열은 변경 가능
   - info.index: 0 부터 시작
   - info.count: 1 부터 시작
 
1) JSTL을 이용한 고유한 ID의 생성과 JS 함수로의 전달
- 하나의 JSP 페이지에서 id값은 고유해야합니다. 중복을 방지하기위하여 '${info.count}'등을
  사용합니다.
``` 
<input type="number" id="cnt${info.index }" name="cnt">
→
<input type="number" id="cnt0" name="cnt">
<input type="number" id="cnt1" name="cnt">
<input type="number" id="cnt2" name="cnt">
              
<A href="javascript:proc(frm.cnt${info.count}.value)">
→
<A href="javascript:proc(frm.cnt1.value)">
<A href="javascript:proc(frm.cnt2.value)">
<A href="javascript:proc(frm.cnt3.value)">
```   
2) 마지막 요소의 처리 
```
<c:forEach items="${fileList}" var="current" varStatus="info">
   { id: 1001, data: [ "<c:out value="${current.fileName}" />", "<c:out value="${current.path}" />" ] }
   <c:if test="${!info.last}">,</c:if>
</c:forEach>
```
3) 일련번호의 출력: 1 ~ 레코드수
``` 
<c:forEach items="${fileList}" var="current" varStatus="info">
   <TR>
     <TD>${info.count}</TD>
     <TD>${vo.title}</TD>
   </TR>
</c:forEach>     
```
<hr>
```
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.el.ELDTO" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/forEachTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
<fieldset>
    <legend>EL/JSTL</legend>
    <c:forEach var="index" begin="1" end="5" step="1">
    ${index }
  </c:forEach>
  
  <br><br>
  <%
  request.setAttribute("datas", new String[]{"JAVA", "JSP", "SPRING"});
  %>
  <c:forEach var="item" items="${datas }" varStatus="info">
    ${info.count }.${item }<br>
  </c:forEach>
  <br> 
  <c:forEach var="item" items="${datas }" varStatus="info">
    ${info.index }.${item }<br>
  </c:forEach>
</fieldset>
 
 <fieldset>
    <legend>Scriptlet</legend>
     <%
  String[] datas = (String[])request.getAttribute("datas");
  for(int i=0;i<datas.length;i++){
  %>
    <%= i+1 %>.<%=datas[i] %><br>
  <%   
  }
  %>
  
 </fieldset>

  <hr>

  
  <%
  ArrayList<ELDTO> list = new ArrayList<ELDTO>();
  
  ELDTO eldto = new ELDTO("암살", "전지현");
  list.add(eldto);
  eldto = new ELDTO("골목식당", "백종원");
  list.add(eldto);
  eldto = new ELDTO("숨바꼭질", "이유리");
  list.add(eldto);
  
  request.setAttribute("list", list);
  %>
  
  <fieldset>
    <legend>Scriptlet list</legend>
    <%
  int size = list.size(); // 객체의 수
  for (int index = 0; index < size; index++) {
    ELDTO vo = list.get(index); // 객체 추출
    out.print((index+1) + ". " + vo.getMovie() + "(" + vo.getName() + ")<br>");
  }
  %>  
  </fieldset>
  
 <fieldset>
    <legend>EL/JSTL list</legend>
    <c:forEach var="vo" items="${list}" varStatus="info">
        ${info.count}.${vo.movie } (${vo.name })<br>
    </c:forEach>
    
 </fieldset>


</body>
</html>    
```
[실행 화면]
![image](https://user-images.githubusercontent.com/84116509/155487245-e02fb463-6736-4ef5-9466-1c754ec859a7.png)
<hr>
