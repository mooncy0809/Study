<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 <!-- 
 [실행 화면]
적금 온라인 계산기
월 입금액: ￦ 200,000 원     ◁─ DecimalForamt class
적금 기간: 24 개월
납입 원금: ￦ 4,800,000 원  ◁─ 월 입금액 * 적금 기간
이자(%): ￦ 48,000 원 (1.0 %)      ◁─ 1%(0.01)
총 수령액: ￦ 4,848,000 원  ◁─ 납입 원금 + 발생 이자
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 계산기 예제</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px; }
</style>
</head>
<body>
<%
//http://localhost:9091/core/request3.jsp?amount=200000&period=24&ijaper=1.0
DecimalFormat df = new DecimalFormat("￦ #,### 원");
int amount = Integer.parseInt(request.getParameter("amount")); 
int period = Integer.parseInt(request.getParameter("period")); 
int won = amount*period;
double ijaper = Double.parseDouble(request.getParameter("ijaper")); 
double ija = won*ijaper/100;
int year = period/12;
int tot = won+(int)ija*year;
%>
 
<H2>적금 온라인 계산기</H2>
<DIV>
  월 입금액: <%=df.format(amount) %><BR>
  적금 기간: <%=period %> 개월 (<%=year%>년)<BR>
  납입 원금: <%=df.format(won) %><BR>
  이자(%): <%=df.format(ija)%> (연 <%=ijaper %> %)<BR>
  총수령액: <%=df.format(tot) %><BR>
</DIV>
 
</body>
</html>