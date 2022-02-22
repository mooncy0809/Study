<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>뉴스 등록 처리</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
DecimalFormat df = new DecimalFormat("￦ #,### 원");
String  title = request.getParameter("title");
String  content = request.getParameter("content");
int donate = Integer.parseInt(request.getParameter("donate")); 
String  passwd = request.getParameter("passwd");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
String date = sdf.format(new Date());
%>
<H1>주요 뉴스</H1>
<UL>
  <LI>제목: <%=title %></LI>
  <LI>내용: <%=content %></LI>
  <LI>기부금: <%=df.format(donate) %></LI>
  <LI>패스워드: <%=passwd %></LI>
  <LI>등록일: <%=date %></LI>
</UL>
</body>
</html>