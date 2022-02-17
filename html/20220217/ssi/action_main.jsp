<%@ page contentType="text/html; charset=UTF-8" %>

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

<!-- JAVA source가 실행되어 HTML로 포함됨 -->
<jsp:include page="./sub.jsp" flush="false" />

<%
String book = "나는 누구인가?"; // sub.jsp에도 선언됨.
String book2 = "나는 누구인가?";
%>
<H2>추천 도서 2: <%=book %></H2>
<H2>추천 도서 3: <%=book2 %></H2>

</body>
</html>