<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>CSS 테스트 http://localhost:9091/css/style.jsp</title>
<!-- 
/webapp/css/style1.css 기준
http://localhost:9091/css/style1.css
 -->
<!-- <link href="../css/style1.css" rel="Stylesheet" type="text/css">
 -->
 <link href="/css/style1.css" rel="Stylesheet" type="text/css">
 
<!-- /static 기준 -->
<link href="/css/style2.css" rel="Stylesheet" type="text/css">

</head>
<body>
  <div>CSS 연동 이미지 출력 테스트</div>
  <img src="/restest/images/Meryl_Streep.jpg" style="width: 30%;">
</body>
</html>