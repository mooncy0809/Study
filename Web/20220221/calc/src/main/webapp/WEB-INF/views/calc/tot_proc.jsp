<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>tot_proc.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head>
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>tot_proc.jsp</H1>
 
  <DIV class='panel'>
    <H1>${calcVO.msg }</H1>
    수1: ${calcVO.no1 }<br>
    수2: ${calcVO.no2 }<br>
    결과: ${calcVO.result }<br>
  </DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>
