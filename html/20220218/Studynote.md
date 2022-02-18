## Spring project의 주요 폴더 구조

1. /src/main/java: 자바 소스 폴더

2. /src/main/java/dev.boot.mvc.MvcApplication.java
   1) main 메소드가 존재하는 자바 class
   2) 구성과 최초 실행을 담당

3. /src/main/resources/static (Spring Legacy: /src/main/webapp/resources)
   1) Image, CSS, Javascript등 정적 파일들 저장

4. /src/main/resources/application.properties
   1) 환경 설정에 사용할 properties 정의

5. Project and External Dependencies
   1) gradle에 명시한 라이브러리 목록

6. src
   1) JSP등 리소스 디렉토리

7. build.gradle
   1) gradle build 명세, 프로젝트에 필요한 라이브러리 정의, 빌드 및 배포 설정
   2) 스프링 부트의 버전을 명시
   3) 자바 버전 명시
   4) JAR library 의존성 옵션
       implementation: 소스 수정시 의존 라이브러리이며 재컴파일(재빌드)을 진행함
       compileOnly: compile시에만 빌드하고 빌드 결과물(war, jar)에는 포함하지 않음
                         runtime(실행)시 필요없는 라이브러리인 경우 
       runtimeOnly: 실행(runtime)시에만 필요한 라이브러리인 경우
       providedRuntime: Tomcat 서버등 실행시 제공되는 library
       testImplementation: 테스트시 관련 library 제공
   5) JSP 파일을 Servlet으로 변환하는 library 추가
      ① https://mvnrepository.com 접속 -> tomcat-embed-jasper
      ② // https://mvnrepository.com/artifact/org.apache.tomcat.embed/tomcat-embed-jasper
          implementation 'org.apache.tomcat.embed:tomcat-embed-jasper:9.0.52'
          또는
          implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
      ③ build.gradle 편집
 8. /src/main/webapp
     - JSP 파일 폴더
  
 9. /src/main/webapp/WEB-INF/classes
     - JAVA class 배포 폴더

 10. /src/main/webapp/WEB-INF/lib
     - jar 파일 배포 폴더

## Servlet원리
     - JSP는 실행시 서블릿 Class로 변경되어 실행됩니다.
       JSP -> Tomcat(WAS:Web Application Server, Resin, JBoss...) -> Servlet JAVA code 생성
       -> compile된 class로 변경되어 JAVA JVM에서 실행 과정이 자동으로 처리됨.
     - 개발자가 서블릿을 직접 생성해도 JSP 처럼 Form의 GET, POST 방식의 요청을 받아 처리가 가능.
 
1. Servlet Architecture
1) javax.servlet.GenericServlet class는 서블릿관련 인터페이스를 구현하여
   서블릿 기본 초기화등 개발자의 부담을 감소시켜줍니다.
    - 선언: public abstract class GenericServlet extends java.lang.Object  implements Servlet, ServletConfig, java.io.Serializable

2) javax.servlet.http.HttpServlet class
  - 메소드가 대부분 protected 접근 제한자라 서블릿 제작시 상속받아
    doGet(), doPost()등을 구현합니다.
  - protected는 상속시에만 사용할 수 있다.<br>
![image](https://user-images.githubusercontent.com/84116509/154664621-da75c7c5-deb5-4d2f-b19e-56d1d99a18ec.png)
2. 서블릿의 생명주기(약속된 메소드가 자동 실행: CallBack method)
   - init() ---> service() ---> doGet(), doPost() ---> destroy()
   ![image](https://user-images.githubusercontent.com/84116509/154664679-471022ad-dcf0-4078-91dc-c2ad3d69817d.png)

   - 서블릿에서 Web으로의 출력
     response.setContentType("text/html;charset=utf-8");
     request.setCharacterEncoding("utf-8");
     PrintWriter out =  response.getWriter();
     out.println("\<h2>문자열 출력\</h2>");

   - service() 메소드는 GET/POST 방식을 모두 구분하지 않고 처리하는 기능을하며,
     선언시 doGet(), doPost()가 호출되지 않습니다. 따라서 초기화 코드는 init() 메소드를
     사용합니다.
 
   - 서블릿의 경우 부모 클래스의 메소드를 호출하면 GET/POST 방식의 기능이 인식이 안됨
     super.doGet(request, response); // 삭제 필요
     super.doPost(req, resp);           // 삭제 필요
     
## JSP Model 2 개발 패턴

1. 소프트웨어공학에서의 개발 패턴인 기본적인 MVC 패턴
   - 클라이언트의 요청, 처리, 출력을 구성 요소별로 분리하여 개발함으로써
     대규모 프로젝트 개발에 최적화된 방법론
      예) 최근의 언어들은 대부분 MVC 기반의 구조를 가지고 있음.
           Java Spring, Python Django, NodeJS등

   - Model: DBMS 접근 SQL 실행 java 로직, DTO(VO), DAO,
               Helper class(Tool, Utility, DBOpen, DBClose, SearchDTO)
               , Manager class(Process, Service class, 제어문 구성 로직), 일반적인 클래스, Beans.

   - View: Web publisher(HTML5, CSS3, JavaScript, jQuery, Bootstrap, Vue),
             JSP, EL, JSTL, Thymeleaf 등 브러우저에 값을 나타내는 역활.

   - Controller: Java Servlet, 접속자의 주소를 전송받아 GET/POST 방식을 구분하여
                   로직을 실행하는 기능, 관련 로직을 호출하는 기능, 로깅, 보안등 공통 로직을
                   실행하는 기능.
   ![image](https://user-images.githubusercontent.com/84116509/154664862-3ad4a3c9-fd2a-421d-b9d4-2281d1e2498f.png)

2. 자바 서블릿 기반  MVC(JSP Model 2) 패턴
   1) Client로부터 전송된 주소를 받을 수 있는 자바 기술은?
       - JSP: 파일명과 일치하는 하나의 요청만 받을 수 있음, 파일명이 다르면 404 발생
         예) form.jsp --> proc.jsp
       - Servlet: 설정에따라 무한대의 요청을 받아 처리 가능, 실제 존재하지 않는 파일 지정 가능,
         접근 주소를 명령어로 이용, URI Command Pattern 이라고 함. <br>
![image](https://user-images.githubusercontent.com/84116509/154664949-131afe11-74fb-47a9-b42f-246313eb3d7d.png)
1) BROWSER: 접속자, Chrome등 브러우저
2) Servlet(Controller): 사용자의 요청을 받아 주소를 분석하여 해당하는 빈을 실행합니다.
                            JSP 처럼 GET, POST 방식 요청 접수 처리
3) Java Beans(Model): 데이터를 처리하며, SQL을 실행합니다. DAO
4) JSP(View): 처리 결과를 출력 합니다.
                 <Form>태그등을 이용하여 사용자와 입출력을 담당합니다.
5) Data Sources: Oracle, MariaDB, MySQL, ...


3. JSP Model 2(MVC) 패턴
   - 실제 파일명이 아닌 명령어 기반 요청 처리 프로세스를 가지고 있습니다. 
    . 서버로 특정 주소를 보낼때 그 주소는 실제 존재하는 파일이 아닙니다.
      Model 1 처럼 404에러가 나야하나 발생이 안됨.
    . 파일명의 형식등으로 구성된 인터넷 주소를 명령어로 사용합니다.
    . 확장자를 생략하는 경우도 많음.
    . 객체 설계 디자인 패턴에서 인터넷 주소를 명령어로 사용하는 패턴을
      URI Command Pattern 이라고 합니다.
