<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>http://localhost:9091/</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
 <DIV class='content'>
 <%
 request.setAttribute("name","Spring boot 개발자");
 %>
 1. Scriptlet : 
 <% 
 if (request.getAttribute("name") != null){
     out.println(request.getAttribute("name")); 
 }else{
     out.println("");
 }
%>
<br>
2. EL(requestScope) : ${requestScope.name}
<br>
3. EL : ${name}
 </DIV>
</body>
</html>