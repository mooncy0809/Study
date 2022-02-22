<%@ page contentType="text/html; charset=UTF-8" %>
<%
String title = (String)request.getAttribute("title");
String fname = (String)request.getAttribute("fname");
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://127.0.0.1:9091/movie/viewex.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<!-- 경로는 모두 절대 경로 지정 -->
<DIV style='text-align: center;'>
  <H1>영화 장르 선택</H1>
  <A href='/controller2/img1.do2ex'>애니메이션</A> | 
  <A href='/controller2/img2.do2ex'>코미디</A> |
  <A href='/controller2/img3.do2ex'>로맨스</A> |
  <A href='/controller2/img4.do2ex'>공상과학</A>
  <br>
  <H2><%=title %></H2> 
  <IMG src='<%=fname %>' style="width: 90%;">
</DIV>
</body>
</html>