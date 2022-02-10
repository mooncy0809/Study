##Page 지시자(Directive)
   - contentType: jsp의 출력 형식 지정, 문자 셋을 지정합니다. 
     . 형식: contentType="text/html; charset=UTF-8" 
       예) <%@ page contentType="text/html; charset=UTF-8" %> 
     . JSP처리 결과가 HTML임으로 MIME Type을 'text/html'과
      문자 코드(UTF-8)를 선언.
     . MIME Type: browser가 인식하는 인터넷으로부터 전송된 내용의 타입 
       브러우저가 인식하는 데이터의 종류를 나타낸 코드값 
       예) image/jpg는 browser가 홈페이지로부터 전송된 내용을 이미지로 인식함.
     . 대소문자 상관 없음.

   - import: 패키지의 import, 중복 사용가능 합니다. 
     . 자바에서 패키지를 사용하겠다고 import 선언하는 것과 같습니다. 
     . 예) <%@ page import="java.text.DecimalFormat" %> 
