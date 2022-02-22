<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
 <!-- 
  A: 우대 금리 1.0% 적용
  B: 우대 금리 2.0% 적용
  C: 우대 금리 3.0% 적용 
  F: 우대 금리 없음.
  
[실행 화면] 우대 금리 A 있는 경우
적금 온라인 계산기
월 입금액: ￦ 200,000 원     ◁─ DecimalForamt class
적금 기간: 24 개월
납입 원금: ￦ 4,800,000 원  ◁─ 월 입금액 * 적금 기간
우대 금리 A 적용 이자(%): ￦ 96,000 원 (2.0 %)    ◁─ 1%(1.0) + 1%(1.0)
총 수령액: ￦ 4,896,000 원  ◁─ 납입 원금 + 발생 이자
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 계산기(우대금리) 예제</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px; }
</style>
</head>
<body>
<%
//http://localhost:9091/core/request4.jsp?amount=400000&period=36&ijaper=1.0&grade=B
DecimalFormat df = new DecimalFormat("￦ #,### 원");
String grade = request.getParameter("grade");
int amount = Integer.parseInt(request.getParameter("amount")); 
int period = Integer.parseInt(request.getParameter("period")); 
int year = period/12;
int won = amount*period;
double ijaper = Double.parseDouble(request.getParameter("ijaper")); 
double ija = 0;

//우대금리 적용을 위한 if문
if(grade.equals("A")){
    ijaper=ijaper+1.0;
    ija = won*ijaper/100;
}else if(grade.equals("B")){
    ijaper=ijaper+2.0;
    ija = won*ijaper/100;
}else if(grade.equals("C")){
    ijaper=ijaper+3.0;
    ija = won*ijaper/100;
}else{
    ija = won*ijaper/100;
    System.out.println("F->우대금리 없음");
}
int tot = won+(int)ija*year;
%>
 
<H2>우대금리 적금 온라인 계산기</H2>
<DIV>
  월 입금액: <%=df.format(amount) %><BR>
  적금 기간: <%=period %> 개월 (<%=year%>년)<BR>
  납입 원금: <%=df.format(won) %><BR>
  <%if(ijaper>1.0){ %>
        우대 금리 <%=grade %> 적용 이자(%): <%=df.format(ija)%> (연 <%=ijaper%> %)<BR>
  <%}else{%>
        이자(%): <%=df.format(ija)%> (연 <%=ijaper%> %)<BR>
  <%} %>
  총수령액: <%=df.format(tot) %><BR>
</DIV>
 
</body>
</html>