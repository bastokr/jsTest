<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>글쓰기</h1> 
 <form action="insert.jsp"  method="post"> 

 
제목:<input type="text" name="title"   > 
<br><br>
내용:<textarea   name="conts"  cols="80" rows="10">입력값을 넣어주세요</textarea>

<br><br>
<center> 
<input type="submit" value="저장" />
</center>




</form>


</body>
</html>