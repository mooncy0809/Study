<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
 <!-- 
 급여 처리
본봉: ￦ 2,400,000 원
수당: ￦ 300,000 원
총액: ￦ 2,700,000 원      <- 본봉 + 수당
세금(10%): ￦ 270,000 원 <- 총액 * 0.1
실수령액: ￦ 2,430,000 원 <- 총액 - 세금
근무일: 2021-09
년봉: ￦ 28,800,000 원     <- 본봉 * 12
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
DecimalFormat df = new DecimalFormat("￦ #,### 원");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
String date = sdf.format(new Date());

int pay = Integer.parseInt(request.getParameter("pay")); 
int su = Integer.parseInt(request.getParameter("su")); 
int tot = pay+su;
int tax = (int)(tot*0.1);
int year = pay*12;
 
%> 
<H2>급여 처리</H2>
<DIV>
  본봉: <%=df.format(pay) %><BR>
  수당: <%=df.format(su) %><BR>
  총액: <%=df.format(tot) %><BR>
  세금(10%): <%=df.format(tax) %><BR>
  실수령액: <%=df.format(tot-tax) %><BR>
  근무일: <%=date %><br>
  연봉: <%=df.format(year) %>
</DIV>
 
</body>
</html>