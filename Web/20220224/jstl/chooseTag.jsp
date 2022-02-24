<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/jstl/chooseTag.jsp</title> 
<style type="text/css">
  * { font-size: 24px; }
</style>
</head>
<body>
<c:choose>
        <c:when test="${param.year >= 0 and param.year <= 5 }"> <!-- if -->
            초급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 6 and param.year <= 10 }"> <!--  else if -->
            중급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 11 and param.year <= 15 }">
            고급 개발자<br><br>
        </c:when>
        <c:when test="${param.year >= 16 }">
            특급 개발자<br><br>
        </c:when>
        <c:otherwise>  <!-- else -->
            개발 등급이 없습니다.
        </c:otherwise>
    </c:choose>

</body>
</html>