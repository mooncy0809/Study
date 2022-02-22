<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>calc_vo.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head>
<body>
<DIV class='container'>
<DIV class='content'>
  <H1>EL calc_vo.jsp</H1>
${calcVO.msg }<br>
수1: ${calcVO.no1  }<br>
수2: ${calcVO.no2 }<br>
결과: ${calcVO.result}<br>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>