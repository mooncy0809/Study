<%@ page contentType="text/html; charset=UTF-8" %>
 <!--
메소드 선언문
   - Scriptlet에는 메소드를 선언할 수 없음.
   - 메소드(함수) 선언:< %! ...JAVA 메소드... % >
   - out.println("Test"): JSP가 아닌 JAVA의 메소드로 인식, out cannot be resolved 에러 발생
   - 이런 메소드 선언은 빈즈라는 클래스로 분리되어 개발됨. 
 -->
<%!
 //파일명을 전달받아 이미지인지 검사하여 리턴
 public boolean isImage(String fname) { 
    fname = fname.toLowerCase();
    if(fname.endsWith("jpg") || fname.endsWith("gif") || fname.endsWith("png")){
        return true;
    }
    else{
        return false;
    }
}
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이미지인지 검사</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px;}
</style>
</head>
<body>
<%
if (isImage("COFFEE06.JPG") == true){
    out.println("<IMG src='./images/coffee06.jpg'>");
}else{
    out.println("이미지가 아닙니다.");
}
%>
<br>
<% 
if (isImage("coffee07.JPG") == true){
%>
    <IMG src='./images/coffee07.jpg'>
<%
}else{
%>
    이미지가 아닙니다.
<%
}
%>

<br>
<%
   if(isImage("coffee08.JPGx") == true){
%>
      <IMG src ='./images/coffee08.jpg'>
<% 
   }
%>

</body>
</html>
