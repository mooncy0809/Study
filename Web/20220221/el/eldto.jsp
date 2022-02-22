<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ page import = "dev.el.ELDTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/el/eldto.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 20px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  
  스크립틀릿 출력<br>
  <%
  ELDTO dto = new ELDTO();
  request.setAttribute("dto", dto);
  
  ELDTO eldto = (ELDTO)request.getAttribute("dto");
  %>
  <% System.out.println("--> Scriptlet"); %>
  영화명: <%=eldto.getMovie() %><br>
  주   연: <%=eldto.getName() %><br> 
  <br>
  <% System.out.println("--> EL"); %>
  EL 출력<BR>
  영화명: ${dto.movie}<br>
  주   연: ${dto.name}<br> 
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>