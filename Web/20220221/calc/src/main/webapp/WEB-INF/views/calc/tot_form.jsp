<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>tot_form.jsp</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 30px;}
</style>
</head> 
 
<body>
<DIV class='container_main'>
<DIV class='content'>
  <H1>tot_form.jsp</H1>
 
  <div class='panel'>
    <H2>계산기</H2>
    <!-- @RequestMapping(value = "/calc/add3.do", method = RequestMethod.POST) -->
    <form name='frm' action="/calc/add3.do" method='post'>
      수1: <input type='number' name='no1' value='100' autofocus="autofocus"><br><br>
      수2: <input type='number' name='no2' value='50'><br><br>
      <button type='submit'>합계</button>
    </form>
  </div>
</DIV> <!-- content END -->
</DIV> <!-- container END -->  
</body>
 
</html>
 
 
 
