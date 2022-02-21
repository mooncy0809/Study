<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>http://localhost:9091/el/param.jsp?money=300000&month=36</title> 
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 20px;}
</style>
</head> 
 
<body>
스크립틀릿 출력<br>
<%
 int money = Integer.parseInt(request.getParameter("money"));
int month = Integer.parseInt(request.getParameter("month"));
%>
월 입금액: <%=money %> 원<br>
입금 기간: <%=month %> 개월<br>
수령 금액: <%=money * month %> 원<br><br>
 
<hr>
EL 출력<br>
월 입금액: ${param.money} 원<br>
입금 기간: ${param.month} 개월<br>
수령 금액: ${param.money*param.month} 원<br><br>

 
</body>
</html>