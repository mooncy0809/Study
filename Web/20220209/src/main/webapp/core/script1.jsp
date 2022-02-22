<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/script1.jsp</title>
</head>
<body>
<% // 스크립틀릿
String name = "왕눈이";
int kor = 90;
int eng = 70;
int mat = 80;
int tot = kor + eng + mat;
int avg = tot / 3;
 
// System.out: 표준 출력 장치, 모니터 콘솔
System.out.println("성명: " + name);
// out: web 출력
out.println("WEB");
out.println("성명: " + name);
out.println("국어: " + kor);
out.println("영어: " + eng);
out.println("수학: " + mat);
out.println("총점: " + tot);
out.println("평균: " + avg);
%>
</body>
</html>