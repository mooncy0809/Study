<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dev.el.ELDTO" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/forEachTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
<fieldset>
    <legend>EL/JSTL</legend>
    <c:forEach var="index" begin="1" end="5" step="1">
    ${index }
  </c:forEach>
  
  <br><br>
  <%
  request.setAttribute("datas", new String[]{"JAVA", "JSP", "SPRING"});
  %>
  <c:forEach var="item" items="${datas }" varStatus="info">
    ${info.count }.${item }<br>
  </c:forEach>
  <br> 
  <c:forEach var="item" items="${datas }" varStatus="info">
    ${info.index }.${item }<br>
  </c:forEach>
</fieldset>
 
 <fieldset>
    <legend>Scriptlet</legend>
     <%
  String[] datas = (String[])request.getAttribute("datas");
  for(int i=0;i<datas.length;i++){
  %>
    <%= i+1 %>.<%=datas[i] %><br>
  <%   
  }
  %>
  
 </fieldset>

  <hr>

  
  <%
  ArrayList<ELDTO> list = new ArrayList<ELDTO>();
  
  ELDTO eldto = new ELDTO("암살", "전지현");
  list.add(eldto);
  eldto = new ELDTO("골목식당", "백종원");
  list.add(eldto);
  eldto = new ELDTO("숨바꼭질", "이유리");
  list.add(eldto);
  
  request.setAttribute("list", list);
  %>
  
  <fieldset>
    <legend>Scriptlet list</legend>
    <%
  int size = list.size(); // 객체의 수
  for (int index = 0; index < size; index++) {
    ELDTO vo = list.get(index); // 객체 추출
    out.print((index+1) + ". " + vo.getMovie() + "(" + vo.getName() + ")<br>");
  }
  %>  
  </fieldset>
  
 <fieldset>
    <legend>EL/JSTL list</legend>
    <c:forEach var="vo" items="${list}" varStatus="info">
        ${info.count}.${vo.movie } (${vo.name })<br>
    </c:forEach>
    
 </fieldset>


</body>
</html>