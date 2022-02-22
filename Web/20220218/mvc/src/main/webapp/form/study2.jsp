<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8"> 
<title>http://localhost:9091/form/study.jsp</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
<br>
 
<!-- 서블릿의 경로를 사용할때는 프로젝트명 명시 -->
<!-- @WebServlet("/form/study")) -->
<form name="frm" method="GET" action="/form/study">
  현재 과목명: <input type="text" name="step" value="Analysis" size='20' /><br><br>
  다음 과목명: <input type="text" name="next" value="인공지능" size='20' />
  <br><br>  
  <input type="submit" value="서블릿으로 전송" />
</form>
 
</body>
</html>
 