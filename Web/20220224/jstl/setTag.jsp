<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>/webapp/jstl/setTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head> 
 
<body>
   <!-- JSTL -->
   <c:set var='img' value="<IMG src='./images/url4.png'>"/>
   
   ${img } JAVA<BR>
   ${img } JSP<BR>
   ${img } SPRING<BR>
   ${img } MyBATIS<BR>
   ${img } R<BR>
   ${img } Python<BR>
   ${img } Crawling<BR>
   ${img } Analysis<BR>
   ${img } Machine Learning<BR> 
   
   <br>
   <!-- Scriptlet을 값으로 할당 -->
    <% request.setAttribute("tot",(2021+1)); %>
    <c:set var="total" value="${tot}" />
    합계 : ${total }<br><br>
   <!-- 천단위 구분자 콤마 출력 -->
   <%
   int pay = 2500000;
   request.setAttribute("pay", pay);
   %>
   급여: <fmt:formatNumber value="${pay }" pattern="￦ #,###" />
   
</body>
 
</html>