## HTML 특수 문자 Entity
- 태그의 구조와 관련된 문자는 특수문자(Entity)로 변환하여 출력해야함.
  <:＆lt;
  >: ＆gt;
   ': ＆apos;
   ": ＆quot;
  ＆: ＆amp;
- 특수 문자를 고유 name, 10, 16진수로 표현 가능
- 태그명 자체를 출력하려면 지정된 코드명으로 선언해야함.
- https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
- 10진수 ＆#32;, 16진수 : 공백으로 출력되나 웹에서는 공백은 1칸만 인정됨으로
  Entity로 선언된 ＆nbsp;을 사용 할 것.

## HTTP 상태 코드
- https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C
- 200(성공): 서버가 요청을 제대로 처리한 경우
- 400(잘못된 요청): 서버가 요청의 구문을 인식하지 못한 경우, Spring에서 정수등 서버가 값을 전달 받지 못한 경우
- 403(Forbidden, 금지됨): 폴더나 파일에 접근 권한이 없는경우(손님, 회원, 관리자등의 분류에서 자주 발생)
- 404(Not Found, 찾을 수 없음): 폴더나 파일명이 존재하지 않는경우(오타등)
- 500(내부 서버 오류): JSP 코드에 오타가 있는 경우 자주 발생, JAVA 코드 오류

## CSS(Cascading Style Sheet)의 사용 
    - HTML은 Layout 구성 및 데이터 출력의 목적을 갖으며,
      CSS는 출력되는 HTML에 시각적인 효과를 적용하는 기능을 함.
 
    - HTML에서 시각적인 부분을 CSS로 분리하면 유지보수성이 향상된
      웹사이트 개발이 가능합니다.
      . HTML이 간결해집니다.

   
     - 주석: /* */
 
     - SELECTOR{속성:값}의 형태, SELECTOR(HTML 태그 선택자)는 어느 태그에 CSS를 적용할지를 지정
       예)
          * {          <-- 모든 태그
            font-size: 20px;
          }
 
          BODY {    <-- BODY 태그에 적용
            font-size: 20px;
          }
 
          OL LI {     <-- OL태그안의 LI 태그에 적용, 공백으로 태그의 계층(자식) 구현
            font-size: 20px;
          }
 
          P, DIV {    <-- P, DIV 태그 2개를 나타냄, 각각의 태그는 ','로 구분
            font-size: 20px;
          }
 
          .table {     <-- 태그의 class 속성으로 여러 곳에서 사용 가능 
            border: solid 0px #FF0000;
          }   
 
          #java {  <-- id가 java인 태그, 하나의 페이지에서 한번만 선언 가능
            font-size: 20px;
          }
 
          #menu LI {  <-- id가 menu인 태그안의 LI 태그
            font-size: 20px;
          }
 
 
     - CSS 적용 우선순위: 태그에 기본적으로 class가 적용되며
       속성을 style에서 재정의하여 일부만 효과를 새로 줄 수 있음.
       순서: CSS 파일(가장 낮음) --> class --> style(적용되는 우선 순위가 가장 높음)
       <td width="500" class="td_left" style="height:250px" >
         <%=content%>
       </td>

       * CSS의 class는 JAVA의 class와 다릅니다.

     - 색상: #RRGGBB: R: Red, G: Green, B: Blue
              #000000: 검은색, #FFFFFF: 흰색, #FF0000: RED,
              #00FF00: Green, #0000FF: Blue
       * 10 진수: 0 ~ 9, 10에서 자리올림 발생
       * 16 진수: 0 ~ 10(A) 11(B) 12(C) 13(D) 14(E) 15(F), 16에서 자리올림 발생

     - 속성값의 단위(px, %...)는 생략하지 말것, 공백 제거: margin: 30px auto;

     - 투명도 설정: #RRGGBBOO: OO는 투명도를 나타냅니다. 

     - CSS 관련 명령어 및 색상표 지원: http://www.w3schools.com

   * Chrome에서 CSS file이 적용이 안되면 [설정 -> 인터넷 사용 기록을 삭제]하고 '새로고침' 합니다.
     - Ctrl + Shift + Del 키를 동시에 누릅니다(주로 CSS 파일에서 문제 발생).
     - 1시간전 기록만 삭제 권장

### CSS 적용 방법
1. 특정 태그에 직접 스타일을 선언하는 경우, 태그마다 값이 다른 경우 주로 사용
   <DIV style='font-size: 24px;'></DIV>
 
2. <HEAD>태그안에 스타일을 주는 경우, 태그들이 공통적인 CSS를 사용하는 경우
   <HEAD> 
     <style type="text/css"> 
       DIV{ 
         font-family: gulim; 
         font-size: 24px; 
       } 
 
       .div{ 
         font-family: gulim; 
         font-size: 24px; 
       } 

       #div{ 
         font-family: gulim; 
         font-size: 24px; 
       } 
     </style> 
   </HEAD>
 
3. 특정 파일에 기록
  - 사용:'<link href="../css/style.css" rel="Stylesheet" type="text/css">'
 
  
### Margin, Padding 사용
  ![image](https://user-images.githubusercontent.com/84116509/154057218-ccc15066-e616-4f2f-a056-4b41c04f4c34.png)

### DIV 태그의 기본 사용

1) margin
   - margin: 10px                       ▷ 시계방향으로 값이 할당됨, top -> right -> bottom -> left
   - margin: 10px 20px                ▷ top/bottom: 10px, left/right: 20px
   - margin: 10px 20px 30px 40px  ▷ top: 10px, right: 20px, bottom: 30px, left: 40px
   - margin: 20px auto                 ▷ top/bottom: 20px, 수평 가운데 정렬 
 
2) padding
   - padding: 10px                      ▷ 시계방향으로 값이 할당됨, top -> right -> bottom -> left
   - padding: 10px 20px               ▷ top/bottom: 10px, left/right: 20px
   - padding: 10px 20px 30px 40px ▷ top: 10px, right: 20px, bottom: 30px, left: 40px

3) border: 외곽선
   - border: solid 2px #000000 ▷ 선 스타일, 선의 두께, 선의 색깔

4) 문자 및 태그 정렬
   - text-align: center             ▷ 내용을 가운데로 정렬

5) radius 모서리 처리, 둥근 모서리의 상자 표현
  - border-radius: 10px;             ▷ 모든 모서리에 적용
  - border-top-left-radius: 10px;  ▷ 태그 상단 왼쪽 적용
  - border-top-right-radius: 10px;
  - border-bottom-right-radius: 10px;
  - border-bottom-left-radius: 10px;'
 
6) 크기의 지정
  - width: %, px 지원하나 %를 권장함. 반응형 웹에서 width가 자동으로 조절
  - height: px은 지원하나 특정 환경에서 %는 지원이안됨, height는 가변성 성질로
    무한 스크롤이 가능함으로 무한대의 크기가 적용됨.
  - height 속성에 %를 사용하려면, 외부 태그에서 px를 지정하고 태그 안쪽에서 %를 사용할 것.
  - 태그의 외곽선인 border 속성이 지정되어야 margin 속성이 작동함.
  - 컨텐츠의 세로 가운데 정렬 기본 코드
    . vertical-align: middle; 속성을 사용하려면 "display: table-cell;" 속성이 선언되어야 함.
    . "display: table-cell;" 속성을 사용하려면 "display: table;"이 선어되어 있어야함.
  <!-- 수직, 수평 정렬 -->
  <DIV style="width: 50%; height: 200px;
                  text-align: center; margin: 20px auto;
                  padding: 0px; border: solid 2px #FF99FF;
                  display: table;">
    <DIV style="color: #FFFFFF; background-color: #009900;
                     text-align: center; display: table-cell; vertical-align: middle;">
 
    </DIV>
  </DIV>
  - height를 사용하지 않는 경우의 새로 정렬
  <DIV style="border: solid 1px #000000;
                   width: 50%;
                   margin: 30px auto;
                   padding: 5% 5%;
                   text-align: center;">
  
### DIV 태그 Radius 적용 
 
1) 문자 및 태그 정렬
   - text-align: center ▷ 내용을 가운데로 정렬
 
2) radius 모서리 처리, 둥근 모서리의 상자 표현
  - border-radius: 10px;
  - border-top-left-radius: 10px;
  - border-top-right-radius: 10px;
  - border-bottom-right-radius: 10px;
  - border-bottom-left-radius: 10px;'
 
3) 그림자 처리
    - 형식: text-shadow: h-shadow v-shadow blur color; → text-shadow: 3px 3px 3px gray; 
    - h-shadow: 그림자의 가로위치
    - v-shadow: 그림자의 세로위치
    - blur: 그림자 번짐 정도
    - color: 그림자 색깔
    
### A 태그 CSS 적용

1) 의사 클래스(pseudo-class) 를 이용한 CSS 적용
   A:link, A:visited, A:hover, A:active

2) 선언 순서가 변경되면 작동이 안됩니다. (☆)
    link -> visited -> hover -> active

3) 사용
  A:link{  /* 방문전 상태 */
    text-decoration: none; /* 밑줄 삭제 */
    color: #555555;
  }

  A:visited{  /* 방문후 상태 */
    text-decoration: none; /* 밑줄 삭제 */
    color: #555555;
  }
  
  A:hover{  /* A 태그에 마우스가 올라간 상태 */
    text-decoration: underline; /* 밑줄 출력 */
    color: #7777FF;
  }
  
  A:active{  /* A 태그를 클릭한 상태 */
    text-decoration: underline; /* 밑줄 출력 */
    color: #7777FF;
  }
    
### HTML에 기본 설정된 태그의 margin, padding 속성을 0px로 설정하고, CSS를 적용하면
   화면에 HTML 태그를 배치할 때 태그로 인한 여백 때문에 발행할 수 있는 영역 문제를 피할 수 있음.
 
  /* 모든 태그에 적용 */
  * {
     font-family: Malgun Gothic; 
     font-size: 26px; 
     margin: 0px;  /* top right bottom left */
     padding: 0px;
     color: #555555;
  }  
  
  
5. CSS link 설정시 절대 경로의 지정
   - style.css등의 파일을 기준으로 경로를 지정합니다. 
   background: url(./images/bu6.gif) left center no-repeat;
    
  
6. 브러우저별 차이가 발생하는 기능을 통일할 경우 선언, A 태그에 CSS 태그의 버튼 설정
- -webkit-appearance: Chrome, Safari 계열(비 Internet Explorer)
- -moz-appearance: Internet Explorer 계열

* 2021부터 MS는 IE를 포기하고 크롬과 같은 플랫폼을 사용하여 엣지를 제공함.
    
1) 선언
  A.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;
  }
  
2) 사용
<A class='button' style='text-decoration: none; ' href='./create_file1_form.jsp?categoryno=<%=categoryno %>&pdsno=<%=pdsno %>'>새로운 파일 등록</A>
  
   
7. A 태그에 다양한 CSS 적용
1) 선언
.basiclink { font-size: 16px; }
.basiclink:link { color: #FF0000; }
.basiclink:visited { color: #AA0000; }
.basiclink:hover { background-color: #FFFF00; }
.basiclink:active { background-color: #FF5500; }
 
.menulink { font-size: 16px; }
.menulink:link { color: #FF0000; }
.menulink:visited { color: #AA0000; }
.menulink:hover { background-color: #FFFF00; }
.menulink:active { background-color: #FF5500; }


 
2) 사용
   <A class="basiclink" style="text-decoration: none;" href="http://www.daum.net">Daum</A>
   <A class="menulink" style="text-decoration: none;" href="http://www.kma.go.kr">기상청</A>
    
