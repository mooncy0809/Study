<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0,
                                 maximum-scale=5.0, width=device-width" /> 
<title>이미지 출력 테스트 http://localhost:9091/restest/images.jsp</title>
</head>
<body>
  <H2>봄</H2>
  <img src="./images/swiss.jpg" style="width: 30%;">
  <img src="조진웅01.jpg" style="width: 30%;">
  <hr>
  <img src="/static/restest/images/Meryl_Streep.jpg.jpg" style="width: 30%;">
  <img src="/resources/static/restest/images/Meryl_Streep.jpg" style="width: 30%;">
  <hr>
  <img src="/restest/images/안재홍01.jpg" style="width: 30%;">
  <!-- /static/restest/images/안재홍01.jpg 접근, 자동 인식 -->
</body>
</html>