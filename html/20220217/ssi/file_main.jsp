<%@ page contentType="text/html; charset=UTF-8" %>
<!-- http://localhost:9091/ssi/file_main.jsp -->

<!-- 
SSI 파일의 사용의 경우 아래의 Page Directive는
   포함되는 JSP 및 포함하는 JSP 파일 모두 대소문자 및 공백도 일치해야합니다. 
   <%@ page contentType="text/html; charset=UTF-8" %>  
   <%@ page contentType="text/html; charset=utf-8" %>  -> X
 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>

<!-- JAVA source 자체가 포함됨 -->
<%@ include file="./sub.jsp" %>

<%
// Duplicate local variable book
// String book = "나는 누구인가?";
String book2 = "나는 누구인가?";
%>
<H2>추천 도서 2: <%=book2 %></H2>
</body>
</html>