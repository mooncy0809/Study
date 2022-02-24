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