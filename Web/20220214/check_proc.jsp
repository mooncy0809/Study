<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% 
request.setCharacterEncoding("utf-8"); 

DecimalFormat df = new DecimalFormat("￦ #,###,### 원");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(new Date());
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>check_proc.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  여행하고 싶은 국가는?<br>
  <%
  String nation1 = request.getParameter("nation1");
  if(nation1 != null){
      out.println(nation1);
  }
  
  String nation2 = request.getParameter("nation2");
  if(nation2 != null){
      out.println(nation2);
  }  
  
  String nation3 = request.getParameter("nation3");
  if(nation3 != null){
      out.println(nation3);
  } 
  
  String nation4 = request.getParameter("nation4");
  if(nation4 != null){
      out.println(nation4);
  } 
  
  String nation5 = request.getParameter("nation5");
  if(nation5 != null){
      out.println(nation5);
  }  %>
  
  <br><br>
  좋아하는 메뉴는?
  <UL style='list-style-type:circle;'>
  <%  
  String[] foods = request.getParameterValues("food");
  if(foods != null){
       for(int i=0;i<foods.length;i++){
    %>
     <LI><%=foods[i]%></LI>
    <%
     }
  }else{
      out.println("<LI>선택된 메뉴가 없습니다.</LI>");
  }
  %>
  </UL>
  <br>
  <A href='./check_form.html'>예약 계속</A>
</body>
</html>