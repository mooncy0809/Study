<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/el/exam2.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 20px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <%
  request.setAttribute("no1", 100);
  request.setAttribute("no2", 130);
  request.setAttribute("no3", 150);
  %>
  
  스크립틀릿<br>
  <%
  int no1 = (Integer)request.getAttribute("no1");
  int no2 = (Integer)request.getAttribute("no2");
  int no3 = (Integer)request.getAttribute("no3");
  int tot = no1 + no2 + no3;
  int avg=tot/3;
  %>
  수1: <%=no1 %><br>
  수2: <%=no2 %><br>
  수3: <%=no3 %><br>
  총점: <%=tot %><br>
  평균: <%=avg %><br>
  <br>
  EL<br>
  수1: ${no1}   <br>
  수2: ${no2}   <br>
  수3: ${no3}  <br>
  총점: ${no1+no2+no3}  <br>
  평균: ${(no1+no2+no3)/3} <br>
  
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>