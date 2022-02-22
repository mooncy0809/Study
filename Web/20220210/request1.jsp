<%@ page contentType="text/html; charset=UTF-8" %>
 <!-- 
 request 객체 실습
- 배열 index, filename 값을 전달받아서 해당하는 이미지를 출력하는 코드를 작성
- 이미지가 없는 경우 메시지 출력: 번호에 해당하는 이미지가 없습니다.(가능번호: 1 ~10) 
- Type mismatch: cannot convert from String to int: String 타입을 int 타입으로 변환할 수 없음.
- request.getParameter("index"): String 타입 리턴
  String  javax.servlet.ServletRequest.getParameter(String name)
- java.lang.NumberFormatException: null: 숫자를 요청받겠다고 했는데 숫자를 전달받지 못한 경우
  Integer.parseInt(request.getParameter("index"))
  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/core/request1.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String[] files = new String[10];

files[0] = "./images/tu01.jpg";
files[1] = "./images/tu02.jpg";
files[2] = "./images/tu03.jpg";
files[3] = "./images/tu04.jpg";
files[4] = "./images/tu05.jpg";
files[5] = "./images/tu06.jpg";
files[6] = "./images/tu07.jpg";
files[7] = "./images/tu08.jpg";
files[8] = "./images/tu09.jpg";
files[9] = "./images/tu10.jpg";

//http://localhost:9091/core/request1.jsp?index=2
int index = Integer.parseInt(request.getParameter("index")); 
out.println("->index: "+index);
if(index >=1 && index<=10){
    out.println("<IMG src='" + files[index-1] + "' style='width:200px; height:150px;'>");
}else{
    out.println("이미지가 없습니다.");
}
%>
<br>
<!-- http://localhost:9091/core/request1.jsp?index=2&fname=tu02.jpg  -->
<%
String  fname = request.getParameter("fname");
%>
fname: <%=fname %><br>
<IMG SRC = "./images/<%=fname%>" style='width:200px; height:150px;' >

<!-- 임시 비밀번호 1234 : HTML주석(소스보기 하면 다 보임) --> 
<%-- 임시 비밀번호 4321 : JSP주석(소스보기 해도 보이지 않음) --%>

</body>
</html>