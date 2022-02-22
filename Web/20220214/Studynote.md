## SELECT ~ OPTION 태그의 활용
- 한글 변환: <% request.setCharacterEncoding("utf-8"); %>
- TEXT로 입력을 받으면 사용자가 다양한 값을 입력하여
  처리 규칙을 만들기가 힘듬, 따라서 지정된 데이터만 입력받도록
  제한을 가하는 기능이 있음. 
- 사용 예: process jsp로 값이 전달됨.
    <select name="travel2">
      <option value="값">레이블</option>  
      <option value="Vietnam">베트남</option>
      <option value="Australia">호주</option>
      <option value="Swiss" selected="selected">스의스</option>
    </select>

## RADIO 태그 
- 여러개의 선택 항목중 하나만 선택 가능
- checked="checked": 기본 선택 속성 
  예) 주소, 성별, 부서의 선정등
- <label> radio 태그과 문자열 레이블을 그룹화하여 클릭 이벤트 지원
- checked="checked": 기본 선택  
- null 체크 방법
  <% if (license1 != null){ %>
         <LI><%=license1 %></LI>
  <% } %>
- 사용예
  <label style="cursor: pointer;">
    <input type='radio' name='license' value='정보처리 관련 자격증' checked="checked">
    정보처리 기사/산업기사/기능사
  </label><br>

## CHECKBOX, FIELDSET 태그
    - 선택 항목 중 여러개를 선택 가능 합니다.
      예) 취미, 개발 가능 분야, 취득 자격증 종류등
    - 선택하지 않으면 null이 출력됩니다. 
    - checked="checked": 기본 선택  
    - null 체크 방법
     <% if (license1 != null){ %>
           <LI><%=license1 %></LI>
     <% } %>

    - Checkbox가 다수일 경우 문자열 배열로 값 처리
      String[] hobby = request.getParameterValues("hobby");

      for(int i=0; i<hobby.length; i++){
        out.println("<LI>" + hobby[i] + "</LI>");
      }
