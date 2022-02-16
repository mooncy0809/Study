<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
 
String rest = request.getParameter("rest");
String java = request.getParameter("java");
// id="heat"는 가져올 수 없음.
String heat = request.getParameter("heat");
String reser_date = request.getParameter("reser_date");
String reser_time = request.getParameter("reser_time");
String food = request.getParameter("food");
%>
이자: <%=rest %><br>
JAVA: <%=java %><br>
현재온도: <%=heat %><br>
예약날짜: <%=reser_date %><br>
예약시간: <%=reser_time %><br>
메뉴: <%=food %><br>
</body>
</html>