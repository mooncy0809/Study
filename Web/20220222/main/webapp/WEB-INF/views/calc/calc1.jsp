<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <title>http://localhost:9091/WEB-INF/views/calc/calc1.jsp</title>  -->
<title>http://localhost:9091/calc/add.do?no1=100&no2=50</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>Scriptlet calc1.jsp</H1>
  <%=request.getAttribute("msg") %>
  계산기<br>
  수1: <%=request.getParameter("no1") %><br>
  수2: <%=request.getParameter("no2") %><br>
  결과:<%=request.getAttribute("result") %> <br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>