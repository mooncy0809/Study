<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
 <!-- 
 [출력 화면]
급여 처리
본봉: 2,200,000 원   ◁─ URL에서 pay 입력
수당: 200,000 원     ◁─ URL에서 su 입력
총액: 2,400,000 원   ◁─ 본봉 + 수당
세금(10%): 240,000 원   ◁─ 총액의 10%
실수령액: 2,160,000 원  ◁─ 총액 - 세금
처리 시간: 2020. 3. 19 오후 12:07:16 ◁─ Date class
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여처리 예제</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px; }
</style>
</head>
<body>
<%
//http://localhost:9091/core/request2.jsp?pay=2200000&su=200000
DecimalFormat df = new DecimalFormat("#,### 원");
int pay = Integer.parseInt(request.getParameter("pay")); 
int su = Integer.parseInt(request.getParameter("su")); 
int tot = pay+su;
int tax = (int)(tot * 0.1);
Date date= new Date();
//String date_str = date.toLocaleString();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd ");
SimpleDateFormat time = new SimpleDateFormat("aa hh:mm:ss");
String date_str = sdf.format(date)+time.format(date);
%> 
<H2>급여 처리</H2>
<DIV>
  본봉: <%=df.format(pay) %><BR>
  수당: <%=df.format(su) %><BR>
  총액: <%=df.format(tot) %><BR>
  세금(10%): <%=df.format(tax) %><BR>
  실수령액: <%=df.format(tot-tax) %><BR>
  처리 시간: <%=date_str %> 
</DIV>
 
</body>
</html>