<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>http://localhost:9091/form/output_form4.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%
String trips = "오스트리아/베트남/아이슬란드/스위스/캐나다";
String[] trips_array = trips.split("/");
%>
여행할 국가<br>
<%
for(int i=0; i<trips_array.length; i++){
%>
<label style='cursor: pointer;'> <input type="checkbox" name=" trip<%=i+1%>"  value='<%=trips_array[i] %>' > <%=trips_array[i] %> </label>
<br>
<%
}
%>
<br>

여행할 국가 1(오스트리아, 아이슬란드, 스위스)<br>
<%
for (int i = 0; i < trips_array.length; i++) {
    if (trips_array[i].equals("스위스") || trips_array[i].equals("아이슬란드") || trips_array[i].equals("오스트리아")) {
    %>
    <label style='cursor: pointer;'> 
    <input type="checkbox" name=" trip<%=i+1%>"  value='<%=trips_array[i]%>' checked="checked">
    <%=trips_array[i]%>
    </label>
    <br>
    <%
    }else{
    %>
    <label style='cursor: pointer;'> 
    <input type="checkbox" name=" trip<%=i+1%>" value='<%=trips_array[i]%>' >
    <%=trips_array[i]%>
    </label>
    <br>
    <%
    }
}
%>

    <br>

여행할 국가 2(오스트리아, 아이슬란드, 스위스)<br>
<%!
public String select(String select_area,String total_area){
    String sw="";
    String[] areas = total_area.split(",");
    for(int i=0;i<areas.length;i++){
        if (areas[i].trim().equals(select_area)) {
            sw="checked";
        }
    }
    return sw;
}
%>
<%
for(int i=0;i<trips_array.length;i++){
%>
    <label style='cursor:pointer;'>
    <input type="checkbox" name=" trip<%=i+1%>"  value='<%=trips_array[i]%>' 
        <%=select(trips_array[i],"오스트리아, 아이슬란드, 스위스") %>><%=trips_array[i]%>
    </label><br>
    
<%    
}
%>
<br>
여행할 국가 3(오스트리아, 아이슬란드, 스위스)<br>
  <%
  for (int i=0; i< trips_array.length; i++) { %>
     <label style='cursor: pointer;'>
       <input type="checkbox" name="festival<%=i+1 %>" value="<%=trips_array[i] %>"
       <%=("오스트리아, 아이슬란드, 스위스".indexOf(trips_array[i]) >= 0)?"checked='checked'":"" %>><%=trips_array[i] %>
     </label><br>    
  <%
  }%>
<br>


</body>
</html>
