<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="beans.SungjukVO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/beans/sungjuk.jsp</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
 
<body>
<DIV class='container_main'>
<DIV class='content_body'>
<H2>sungjuk.jsp</H2> 
<% 
 SungjukVO vo = new SungjukVO();
vo.setName("왕눈이");
vo.setJava(90);
vo.setJsp(90);
vo.setSpring(90);

int tot = vo.getJava() + vo.getJsp() + vo.getSpring();
int avg = tot/3;
%>
 
신입 직원 성명: <%=vo.getName() %><br> 
--------------------------------<br>
JAVA: <%=vo.getJava() %><br>
JSP: <%=vo.getJsp() %><br>
SPRING: <%=vo.getSpring() %><br>    
총점: <%=tot %><br>
평균: <%=avg %><br>
 
</DIV> <!-- content_body END -->
</DIV> <!-- container_main END -->
</body>
 
</html>