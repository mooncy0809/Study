<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/script2.jsp</title>
</head>
<body>
<% // 스크립틀릿
String name = "왕눈이";
int kor = 90;
int eng = 70;
int mat = 80;
int tot = kor + eng + mat;
int avg = tot / 3;

out.println("성적 조회: " + name+"script2.jsp");

out.println("<OL>");
out.println("<LI>국어: " + kor+"</LI>");
out.println("<LI>영어: " + eng+"</LI>");
out.println("<LI>수학: " + mat+"</LI>");
out.println("</OL>");

out.println("총점: " + tot + "<br>");
out.println("평균: " + avg);
%>
</body>
</html>