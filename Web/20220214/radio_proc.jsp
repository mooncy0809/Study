<%@ page contentType="text/html; charset=UTF-8" %>

<% 
request.setCharacterEncoding("utf-8"); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>축제</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
  축제 예약<br>
  ----------------------------------------<br>
  축제: <%=request.getParameter("festival") %><br>
  참가인원: <%=request.getParameter("count") %> 명<br>
  통신사: 
  <%
  if(request.getParameter("mobile")==null){
  %>
  <label style='color:red'>통신사를 선택해주세요.</label> <br>
  <%
  }else{
  %>
  <%=request.getParameter("mobile") %><br>
  <%
  }
  %>
  번호: <%=request.getParameter("mobileno") %><br>
  <br>
  <A href='./radio_form.html'>예약 계속</A>
</body>
</html>