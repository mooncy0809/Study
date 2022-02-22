<%@ page contentType="text/html; charset=UTF-8" %>
<%
String title = (String)request.getAttribute("title");
String fname = (String)request.getAttribute("fname");
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://127.0.0.1:9091/season/view.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<!-- 경로는 모두 절대 경로 지정 -->
<DIV style='text-align: center;'>
  <H1>Controller 2</H1>
  <A href='/controller2/spring.do2'>Spring</A> | 
  <A href='/controller2/summer.do2'>Summer</A> |
  <A href='/controller2/fall.do2'>Fall</A> |
  <A href='/controller2/winter.do2'>Winter</A>
  <br>
  <H2><%=title %></H2> 
  <IMG src='<%=fname %>' style="width: 90%;">
</DIV>
</body>
</html>