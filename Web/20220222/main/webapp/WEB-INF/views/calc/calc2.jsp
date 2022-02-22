<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc2.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 24px;}
</style>
</head>
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>EL calc2.jsp</H1>
  ${msg }계산기<br>
  수1: ${param.no1 }<br>
  수2: ${param.no2 }<br>
  결과:${result} <br><br>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>