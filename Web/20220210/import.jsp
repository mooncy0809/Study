<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/import.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 32px;}
</style>
</head>
<body>
  <SPAN style='color: #FF0000'>R #FF0000</SPAN><br>
  <SPAN style='color: #00FF00'>G #00FF00</SPAN><br>
  <SPAN style='color: #0000FF'>B #0000FF</SPAN><br>
  <SPAN style='color: #FF00FF'>#FF00FF</SPAN><br>
  <SPAN style='color: #FFFF00'>#FFFF00</SPAN><br>
  <SPAN style='color: #00FFFF'>#00FFFF</SPAN><br>
 
  <SPAN style='color: #00FF00'>G #00FF00</SPAN><br>
  <SPAN style='color: #00CC00'>G #00CC00</SPAN><br>
  <SPAN style='color: #00AA00'>G #00AA00</SPAN><br>
  <SPAN style='color: #008800'>G #008800</SPAN><br>
  <SPAN style='color: #005500'>G #005500</SPAN><br>
  <br>
  
  <%
  DecimalFormat df = new DecimalFormat("￦ #,###");
  Date date= new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat time = new SimpleDateFormat("hh시 mm분 ss초");
  %>
 
  2021년 매출액: <%=df.format(10000000000L) %>
  <br>
  처리 날짜: <%=sdf.format(date) %>
  <br>
  처리 시간: <%=time.format(date) %>   
</body>
</html>