<%@ page contentType="text/html; charset=UTF-8" %>
<!--
    메소드의 개선 (script7 길고 복잡)
 -->
<%!
 //파일명을 전달받아 이미지인지 검사하여 리턴
 public String isImage(String fname) { 
    fname = fname.toLowerCase();
    if(fname.endsWith("jpg") || fname.endsWith("gif") || fname.endsWith("png")){
        return "<IMG src='./images/"+fname+"'>";       
    }
    else{
        return "이미지가 아닙니다.";
    }
}
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이미지인지 검사(메소드 개선)</title>
<style type="text/css">
  *{ font-family: 맑은 고딕; font-size: 26px;}
</style>
</head>
<body>
<% out.println(isImage("coffee06.JPG")); %>
<br>
<% out.println(isImage("COFFEE07.jpg")); %>
<br>
<% out.println(isImage("COFFEE08.jpg")); %>
</body>
</html>
