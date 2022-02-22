<%@ page contentType="text/html; charset=UTF-8"%>
<!-- [과제 1] 이미지 목록을 배열에 저장한 후 출력하는 스크립트를 작성하세요. -->
<!-- http://localhost:9091/core/arrayimage.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for문 실습</title>
</head>
<body>
    <%
        //문자열 10개 저장하는 배열 선언
    String[] images = new String[10];
    images[0] = "./images/tu01.jpg";
    images[1] = "./images/tu02.jpg";
    images[2] = "./images/tu03.jpg";
    images[3] = "./images/tu04.jpg";
    images[4] = "./images/tu05.jpg";
    images[5] = "./images/tu06.jpg";
    images[6] = "./images/tu07.jpg";
    images[7] = "./images/tu08.jpg";
    images[8] = "./images/tu09.jpg";
    images[9] = "./images/tu10.jpg";

    //System.out.println("-> length: "+images.length);
    for (int i = 0; i < images.length; i++) {
        if (i % 5 == 0) {
            out.println("<br>");
        }
       // out.println("<a href='"+images[i]+"'><IMG src='" + images[i] + "' style='width:150px; height:100px;'></a>");
    %>
      <a href='<%=images[i] %>'><IMG src='<%=images[i]%>' style='width:150px;height:100px;'></a>
    <%
    }
    %>
</body>
</html>