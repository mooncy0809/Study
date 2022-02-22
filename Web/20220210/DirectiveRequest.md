## Page 지시자(Directive)
   - contentType: jsp의 출력 형식 지정, 문자 셋을 지정합니다. 
     . 형식: contentType="text/html; charset=UTF-8" 
       예) <%@ page contentType="text/html; charset=UTF-8" %> 
     . JSP처리 결과가 HTML임으로 MIME Type을 'text/html'과
      문자 코드(UTF-8)를 선언.
     . MIME Type: browser가 인식하는 인터넷으로부터 전송된 내용의 타입으로 
       브러우저가 인식하는 데이터의 종류를 나타낸 코드값 
       예) image/jpg는 browser가 홈페이지로부터 전송된 내용을 이미지로 인식함.
     . 대소문자 상관 없음.

   - import: 패키지의 import, 중복 사용가능 합니다. 
     . 자바에서 패키지를 사용하겠다고 import 선언하는 것과 같습니다. 
     . 예) <%@ page import="java.text.DecimalFormat" %> 


## JSP 내부 객체의 이해
   - out 내부 객체를 생성하지 않고 사용할 수 있는 이유는 내부적으로 자동으로 객체가 생성되기 때문 
   - 개발자가 객체를 생성하지 않아도 jsp페이지가
     서블릿 컨테이너(Tomcat)로 로딩되면 Tomcat등 서버가 자동으로 생성하는 객체를 말합니다. 
     따라서 개발자는 반복적인 작업을 줄이고 필요한 작업만 할 수 있게 됩니다. 
 
   - jsp페이지는 Web서버 및 Servlet Container라고 하는 복잡한 server 환경에서 실행이 되기 때문에, 
     실행중에 여러가지 상태정보를 가지고 있어야 하는데 이런 경우에 사용되는 객체들이 내부 객체들입니다.
     . Web서버: HTML, CSS, JS, Image 등을 Browser로 전송 예) Apache HTTP server등
     . Servlet Container: JSP를 JAVA로 변환하고 컴파일 및 실행하여 HTML, CSS, JS등을 만드는 서버이고
       대부분의 Servlet Container들은 Web Server의 기능도 가지고 있음.
       예) Tomcat, Resin, JBoss, JEUS등
 
   - 내부 객체로 인해 개발자는 좀더 쉽게 JSP 프로그래밍이 가능함. 
 
### ▶request 내부 객체 
   
  
   - javax.servlet 
     Interface ServletRequest
       extended by  javax.servlet.http.HttpServletRequest Interface를 Tomcat등 
          서버가 구현한 객체, 자동화된 객체, 개발자는 사용만함. 

   - <FORM> 태그에 입력된 데이터를 읽어오는 역활을 함. 

   - <FORM>에서 입력되어 브러우저(크롬)가 전송한 데이터를 Tomcat 서버의
      JSP에서 처리할수 있도록 객체로 가져오는 역활을 합니다.

   - 접속한 클라이언트에 대한 정보도 알 수 있습니다. 
 
   - URL 상에 직접 값을 명시한 경우
     . http://localhost:9091/request.jsp?code=1&city=seoul
     . ?: 보내는 값을 명시한다는 뜻
     . &: 접속자가 보내는 값이 2개 이상인 경우 분리 기호 
 
   - request.getParameter("code"): URL 또는 <FORM> 태그에서 서버로 전송된 값을 문자열로 가져옴,
     폼 태그에서 숫자를 전달해도 문자열 형태로 읽어옴.

   - 값을 전달하지 않은 상태에서 변수의 값을 읽어오면 'null'이 전달됩니다.
     예) out.println(request.getParameter("index")); --> null

   - 기상청의 GET 방식 데이터 전송
     http://www.kma.go.kr/weather/forecast/digital_forecast.jsp?x=60&y=127
