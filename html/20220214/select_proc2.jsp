<%@ page contentType="text/html; charset=UTF-8" %>
 
<% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 28px;}
</style>
</head>
<body>
  <%
  String  travel1 = request.getParameter("travel1");
  String[]  travel2 = request.getParameterValues("travel2");
  %>
  
  1박2일 국내 여행: <%=travel1 %><br><br>
  3박4일 해외 여행: <%=travel2.length %> 곳 선택 
 <%-- <UL style="list-style-type: circle;">: 원 --%>
 <%-- <UL style="list-style-type: square;">: 사각형 --%>
<%--  <UL style="list-style-type: decimal;">: 번호 --%>
 <UL style="list-style-type: disc;">
 <% 
 for(int i=0; i<travel2.length; i++){
    out.println("<LI>" + travel2[i] + "</LI>");
  }
 %>
 </UL>
  
  <A href='./select_form2.html'>다시 조회하기</A>
</body>
</html>
 