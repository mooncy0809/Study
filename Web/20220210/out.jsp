<%@ page contentType="text/html; charset=UTF-8" %>
 <!-- 
 System.out.println(), out.println(), out.print()의 사용
    - System.out.println("겨울"): DOS 콘솔에 출력합니다.
    - out.println("봄"): HTML로 변환된 소스의 줄을 변경합니다.
    - out.print("봄"): HTML로 변환된 소스가 한줄로 출력됩니다.
  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/out.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 32px;}
</style>
</head>
<body>
<%
System.out.println("요청 처리됨.");
out.println("<DL>");
out.println("<DT>인공지능 영화</DT>");
out.println("<DD>AI 2001</DD>");
out.println("<DD>트랜센던스 2014</DD>");
out.println("<DD>엑스마키나 2015</DD>");
out.println("<DD>이미테이션게임 2015</DD>");
out.println("</DL>");
 
out.print("<DL>");
out.print("<DT>영어 학습 영화</DT>");
out.print("<DD>맘마미아</DD>");
out.print("<DD>러브 액츄얼리</DD>");
out.print("<DD>악마는 프라다를 입는다.</DD>");
out.print("<DD>김씨네 편의점(캐나다)</DD>");
out.print("</DL>");
%>
</body>
</html>