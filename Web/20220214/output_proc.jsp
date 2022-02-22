<%@ page contentType="text/html; charset=UTF-8" %>

<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String price1 = request.getParameter("price1");
String price2 = request.getParameter("price2");
String price3 = request.getParameter("price3");
%> 
price1: <%=price1 %><br>
price2: <%=price2 %><br>
price3: <%=price3 %><br>

<%-- ","가 있으면 형변환 불가능 --%>
<%-- price3 정수로 변환: <%=Integer.parseInt(price3) %><br> --%>
<%
price3 = price3.replace(",", ""); // comma 제거
%>
comma 제거 price3: <%=price3 %><br>
<%
int price4 = Integer.parseInt(price3) + 100000; // 정수로 형변환
%>
수당 추가 price4: <%=price4 %><br>

<%
// 한줄로 결합한 경우
int gdp = Integer.parseInt(request.getParameter("gdp").replace(",", ""));
gdp = gdp + 3000;
%>
gdp: <%=gdp %> ＄
</body>
</html>