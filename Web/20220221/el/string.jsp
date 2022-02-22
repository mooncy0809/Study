<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/el/string.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <%
  String fname = "winter.jpg";
  request.setAttribute("fname", fname);
  %>
  
  1. ${fname.length() }<br>
  2. ${fname.substring(0, 3) }<br>
  3. ${fname.toUpperCase() }<br>
  4. ${fname.equals("winter.jpg") }<br>
  5. ${fname.equalsIgnoreCase("Winter.jpg")}<br>
 
  6. ${fname == null ? "이름이 없습니다.":fname }<br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>
 