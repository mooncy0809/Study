<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/response.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String url = request.getParameter("url");
System.out.println("url: " + url);

if (url.equalsIgnoreCase("kma")) {
  response.sendRedirect("http://www.kma.go.kr"); // 주소 이동
} else if (url.equalsIgnoreCase("daum")) {
  response.sendRedirect("http://www.daum.net"); // 주소 이동
} else if (url.equalsIgnoreCase("kyobobook")) {
  response.sendRedirect("http://www.kyobobook.co.kr"); // 주소 이동
}
%> 
</body>
</html>
 
 