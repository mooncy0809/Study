<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/form/output_form3.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String trips = "오스트리아/베트남/아이슬란드/스위스/캐나다";
String[] trips_array=trips.split("/");
%>
여행할 국가<br>
<%
for(int i=0; i<trips_array.length; i++){
%>
<label style='cursor: pointer;'> <input type="radio" name="festival" value="<%=trips_array[i] %>"><%=trips_array[i] %> </label>
<br>
<%
}
%>
<br>
여행할 국가(스위스)
<br>
<%
for(int i=0; i<trips_array.length; i++){
%>
<label style='cursor: pointer;'> 
<input type="radio" name="festival" value="<%=trips_array[i] %>"<%=(trips_array[i].equals("스위스"))?"checked='checked'":"" %>>
<%=trips_array[i] %> 
</label>
<br>
<%
}
%>
</body>
</html>