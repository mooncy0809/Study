<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.ui.PayCode" %>
<%@ page import="dev.ui.CodeTable" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/enum.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
<%
// 사용, Controller에서 선언 할 것.
ArrayList<PayCode> list = CodeTable.getPayCode();
request.setAttribute("list", list);
%>

주문 1:<br>
  <c:forEach var="code" items="${list }" varStatus="info">
    ${info.count }. ${code.pay }: ${code.value }<br>
  </c:forEach>

<br>
주문 2:
  <select name='order'>
  <c:forEach var="code" items="${list }" varStatus="info">
      <option value="${code.value }">${code.pay }</option>
  </c:forEach>
  </select>

<br>
주문 3:
  <select name='order'>
  <c:forEach var="code" items="${list }" varStatus="info">
      <option value="${code.value }" ${code.value=='A03' ? "selected='selected'":"" }>${code.pay }</option>
  </c:forEach>
  </select>

</body>
</html>