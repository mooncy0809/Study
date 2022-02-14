<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<form name='frm' action="./output_proc.jsp" method='GET'>
 <%
  String title = "가을";
  String content = "신청 날짜:\n신청 인원:\n결재 금액:\n";
  int price1 = 1500000;
  String passwd = "1234";
  String btn = "업로드";
  int gdp = 32000;
  %>
  <input type="text" name="title" style="width:30%;" autofocus="autofocus" value="<%=title %>"><br>
  <br>
  <textarea name="content" rows="5" style="width:50%;"><%=content %> </textarea><br>
  <br>
  <input type="number" name="price1" value="<%=price1 %>" min="0" max="10000000" step="100" style="width:40%;">원
  <button type="submit"><%=btn %></button>
  <br><br>
  <%
  DecimalFormat df = new DecimalFormat("#,###,##0");
  %>
  <input type="number" name="price2" value="<%=df.format(price1) %>" style="width:40%;"> 원 ERROR
  <br>
  <input type="text" name="price3" value="<%=df.format(price1) %>" style="width:40%;"> 원 
  <br>
  <input type="text" name="gdp" value="<%=df.format(gdp) %>" style="width:40%;"> $ 
  <button type="submit"> 등록</button>
</form>
</body>
</html>