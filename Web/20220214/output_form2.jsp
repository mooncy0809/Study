<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/form/output_form2.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String trips = "오스트리아/베트남/아이슬란드/스위스/캐나다";
String[] trips_array=trips.split("/");
%>
여행할 국가 순위<br>
 <UL style="list-style-type: decimal;">
 <% 
 for(int i=0; i<trips_array.length; i++){
    out.println("<LI>" + trips_array[i] + "</LI>");
  }
 %>
 </UL>
여행할 국가:
<select name=travel1> 
 <% 
 for(int i=0; i<trips_array.length; i++){
    out.println("<option value="+ trips_array[i]+">" + trips_array[i] + "</option>");
  }
 %>
</select>
<br>
여행 국가 기본 선택 1(스위스):
<select name=travel2> 
 <% 
 for(int i=0; i<trips_array.length; i++){
 %>
    <option value='<%=trips_array[i] %>' <%=(trips_array[i].equals("스위스"))?"selected='selected'":"" %>><%=trips_array[i] %></option>
 <%
  }
 %>
</select>

<br>
여행 국가 기본 선택 2(아이슬란드):
<select name=travel1> 
 <% 
 for(int i=0; i<trips_array.length; i++){
     if(trips_array[i].equals("아이슬란드")){
 %>
        <option value='<%=trips_array[i] %>' selected="selected"> <%=trips_array[i] %></option>
 <%
     }else{
         %>
        <option value='<%=trips_array[i] %>'><%=trips_array[i] %></option>    
         <%
     }
 }
 %>
</select>
</body>
</html>