<%@ page contentType="text/html; charset=UTF-8" %>
 
<% 
request.setCharacterEncoding("utf-8"); 
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/javascript/basic/input_proc.html</title>
<link href="/css/style.css" rel='Stylesheet' type='text/css'> <!-- /static -->
</head>
<body>
<DIV class='container'>
  <DIV class='content'>
    객실: <%=request.getParameter("rname") %><br>
    크기: <%=request.getParameter("py") %> 평<br>
    인원: <%=request.getParameter("cnt") %> 명<br>
  </DIV>
</DIV>
</body>
</html>
 
 