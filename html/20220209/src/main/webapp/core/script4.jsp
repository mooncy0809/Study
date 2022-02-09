<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/script4.jsp</title>
</head>
<body>
<% // 스크립틀릿
String name = "왕눈이";
int kor = 90;
int eng = 70;
int mat = 80;
int tot = kor + eng + mat;
int avg = tot / 3; 
%>
성적 조회: <%out.println(name); %>script4.jsp

<OL>
	<LI>국어:<%=kor%></LI>
	<LI>영어:<%=eng%></LI>
	<LI>수학:<%=mat%></LI>
</OL>

총점: <%=tot%><br>
평균: <%=avg%>

</body>
</html>