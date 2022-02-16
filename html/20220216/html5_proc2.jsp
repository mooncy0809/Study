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
 
String shopping_begin = request.getParameter("shopping_begin");
String shopping_end = request.getParameter("shopping_end");
%>
구입 내역 검색 기간: <%=shopping_begin %> ~ <%=shopping_end %>
</body>
</html>
