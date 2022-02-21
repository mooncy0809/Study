## EL(표현 언어, Expression Language)
   - EL은 JSP 객체의 출력을 단순화하는 용도에 사용됩니다. 
   - JSP 스크립틀릿(<%%>)보다 사용법이 간단합니다. 
   - 값이 없는 경우 "null"값을 출력하지 않습니다. 자동으로 null 체크함.
   - EL은 JSP 내부 객체(request, response, session...)에 접근하여 출력을
     단순화 합니다. 
   - 기본적으로 자바의 문법이 적용됩니다.    
   - 표현 방법: ${expr}
   - EL은 3항 연사자외에 제어문을 사용할 수 없어 JSTL을 같이 이용해야 합니다. 

### MVC 처리 흐름
   
① Controller로 'http://127.0.0.1:9091/controller2/spring.do2' 요청<Br>
② Controller는 관련 클래스(Model)를 실행, DBMS 자료 처리, 알고리즘을 처리<Br>
③ Controller는 Model class 처리 결과를 받아 View JSP 페이지로 전달(forwarding, RequestDispatcher)<Br>
④ View JSP는 Controller에서 보낸 데이터를 EL, JSTL등을 이용하여 출력<Br>
 
### 1. 표현 언어의 연산자   
 
▷ 연산자  
-------------------------------------------------------------------------------------
        .                  빈의 프로퍼티나 맵(Map)의 엔트리 접근 
        []                  배열이나 리스트(List) 엘리먼트 접근 
        ()                  괄호, 표현식의 연산 순서를 바꿔서 연산하게 할 때 
        a?b:c             조건 테스트 - 조건(a)? true일때 리턴 값(b),false일때 리턴값(c) 
        + , -, *           사칙 연산 :  더하기, 배기, 곱하기  
        / 또는 div       나누기 
        % 또는 Mod   나머지 
        == 또는 =      같다. =은 권장 아님 
        !=                 다르다  
        < 또는 lt         보다 작다 
        > 또는 gt        보다 크다 
        <= 또는 le       작거나 같다 
        >= 또는 ge      크거나 같다. 
        && 또는 and    논리 AND 
        || 또는 or          논리 OR 
        ! 또는 not         단항 not(true를 false로 false를 true로) 
        empty              빈 변수 값 체크, null, 빈 문자열,  
                             빈 배열등 인지를 테스트  
        func(args)        함수 호출, func 함수 이름이고 args는 인자로 없을 
                            수도 있고, 한 개 혹은 쉼표(,)로 분리된 여러 개의 
                            함수 인자를 가질 수도 있다. 
-------------------------------------------------------------------------------------
 
▷ 삼항연산자 : 조건 ? 참 : 거짓
    '''
    ${colors == null ? "transparent" : colors} 
    ,
    ${status == 'A001' ? "checked='ckecked'" : "" } 
    ,
    ${msg1 != null ? img : "" } ${msg1}
   '''
   - SELECT 태그
  '''
     <select name='visible'>
       <option value='Y' ${categrpVO.visible == 'Y' ? "selected='selected'" : "" }>Y</option>
       <option value='N' ${categrpVO.visible == 'N' ? "selected='selected'" : "" }>N</option>
     </select>
  '''
▷ 그 외 예약어 : true, false, null, instanceof, empty( null이거나 공백일때 ) 
  
  
### 2. JSP 내부 객체(request, response, session, application등)에 
   접근하기위해 EL에서 제공하는 객체 
   - pageContext      : PageContext 객체 
   - pageScope        : page 영역에 포함된 객체 
   - requestScope     : request 영역에 포함된 객체 
   - sessionScope     : session 영역에 포함된 객체 
   - applicationScope: application 영역에 포함된 객체 
   - param              : HTTP의 파라미터들 
   - paramValues      : 하나의 파라미터의 값들 
   - header             : 헤더 정보들 
   - headerValues     : 하나의 헤더의 값들 
   - cookie              : 쿠키들 
   - initParam          :컨텐츠의 초기화 파라미터들 
 
 
### 3. EL 객체의 사용예 
   '''
   1) ${pageContext.request.requestURI}: request URI 
   2) ${sessionScope.profile}                : session 영역에서 profile이라는 이름으로 
                                                     저장된 객체 
   3) ${param.productId}                      : productId라는 이름의 파라미터 값 
   4) ${paramValues.productId}             : productId라는 이름의 파라미터 값들 
   5) ${pageContext.request.contextPath}: Context Path 추출(request.getContextPath()과 동일)  
   '''
 
### 4. request 접근
   - http://localhost:9091/el/request.jsp

### 5. GET 방식 파라미터의 접근
   - http://localhost:9091/el/param.jsp?money=100000&month=24

### 6. 객체의 접근 
  - ${} EL 선언은 기본적으로 request 객체에 접근해서 데이터를 찾으며,
    없으면 session에 접근하여 데이터를 찾아옵니다.
    
### 7. EL 문자열 함수의 사용
'''
  1. ${fname.length() }<br>
  2. ${fname.substring(0, 3) }<br>
  3. ${fname.toUpperCase() }<br>
  4. ${fname.equals("winter.jpg") }<br>
  5. ${fname.equalsIgnoreCase("Winter.jpg")}<br>
'''

## Controller(Action) 구현

1) ModelAndView: 최종 결과를 출력할 JSP 파일명과 출력할 데이터를 가지고 있는 클래스입니다.
    - JSP 출력시 파일명이 자동 조합됨: /src/main/resources/application.properties 설정
       spring.mvc.view.prefix=/WEB-INF/views/
       spring.mvc.view.suffix=.jsp

      예) mav.setViewName("/calc/add");   ← /WEB-INF/views/calc/add.jsp
           mav.setViewName("/pds/create");   ← /WEB-INF/views/pds/create.jsp
           mav.setViewName("/pds/list");   ← /WEB-INF/views/pds/list.jsp
 

2) JSP로 전달할 데이터의 저장, forward action 태그 기능 자동 실행 
   - Servlet: request.setAttribute("no1", no1)
   - Spring: mav.addObject("no1", no1)
 
   - Forward 자동 지원: request, response 객체를 계속 가지고 이동
     RequestDispatcher dispatcher = request.getRequestDispatcher(view);
     dispatcher.forward(request, response);
     Spring은 자동 지원합니다.    
 
3) @Controller: 접속자의 URL 요청을 처리 선언, GET, POST 요청 처리 

4) 실행 주소의 자동 추출
   @RequestMapping(value="/calc/add.do",
                             method=RequestMethod.GET)
   - 사용자가 입력한 URL에서 ContextPath(프로젝트 실행 이름)을 제외한
     URI를 추출합니다.
     예)
     http://localhost:9091/calc/add.do?no1=100&no2=50 
     --> /calc/add.do: 프로젝트명을 제외한 순수한 폴더와 파일명만 자동 추출됨

5) 파라미터의 자동 산출: public ModelAndView add(int no1, int no2) { ... }
    int no1 = Integer.parseInt(request.getParameter("no1"));
    int no2 = Integer.parseInt(request.getParameter("no2"));

▷ /src/main/java/dev.mvc.calc.CalcCont.java 
'''
package dev.mvc.calc;
 
 
public class CalcCont {
  public CalcCont() {
    System.out.println("-> CalcCont created.");
  }
}    
'''
## View 구현 
   - 값의 추출: request.getAttribute("no1");
   - em: 1em: 16 px 기준, 부모 글꼴에 따라 % 처럼 가변적인 크기가 됨.
    - JSP 출력시 파일명이 자동 조합됨: /src/main/resources/application.properties 설정
       spring.mvc.view.prefix=/WEB-INF/views/
       spring.mvc.view.suffix=.jsp
   - WEB-INF 폴더는 시스템 영역으로 외부에서 접근 불가능, jsp 접근 불가능
     . http://localhost:9091/WEB-INF/views/calc/calc1.jsp X

1) Scriptlet 사용의 경우
▷ /src/main/webapp/WEB-INF/views/calc/calc1.jsp 
'''
<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc1.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>Scriptlet calc1.jsp</H1>
  계산기<br>
  수1: <br>
  수2: <br>
  결과: <br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>
''' 
  

2) EL 사용의 경우
▷ /src/main/webapp/WEB-INF/views/calc/calc2.jsp 
'''
<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc2.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>EL calc2.jsp</H1>
  계산기<br>
  수1: <br>
  수2: <br>
  결과: <br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>
'''
### 실행 프로세스

① http://localhost:9091/calc/add.do?no1=100&no2=50 입력

② Spring DispatcherServlet이 Web 요청을 받음

③ Spring Handler Mapping: Controller에서 일치하는 주소를 검색, 전송 method 확인
    - /calc/add.do: 존재하는 파일이 아님, 명령어임.
    @RequestMapping(value="/calc/add.do", method=RequestMethod.GET)

④ Controller의 메소드 실행
    public ModelAndView add(int no1, int no2){... 

⑤ ModelAndView 준비하여 jsp 파일명 및 데이터 저장
    - 최종 view jsp 조합 파일명: /WEB-INF/views/calc/calc1.jsp
      mav.setViewName("/calc/calc1"); // 폴더 + 파일명
    - jsp로 보낼 데이터
      mav.addObject("msg", "더하기");
      mav.addObject("no1", no1);
 
⑥ Spring DispatcherServlet이 주어진 jsp 페이지로 request, response객체를 forward
    - 개발자가 선언하지 않아도 자동 forward됨.
 
⑦ jsp 파일은 결과를 출력합니다. /WEB-INF/views/calc/calc1.jsp, /WEB-INF/views/calc/calc2.jsp
   ${msg } 계산기<br><br> 
