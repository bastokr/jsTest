<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<style> 
table {border-collapse:collapse;width:500px;}
table td {border:1px solid #ccc; padding:10px; width:25%; box-sizing:border-box; }
table td:hover { border:1px solid #000; }
</style>
<h3>로그인</h3>  
 <form action="loginOk.jsp"  method="post"> 
<table style="border:1px;border-color:red" >
<tr><td>ID</td><td><input type="text" name="login_id" value="" ></td>
</tr>
<tr><td>PASSWORD</td><td><input type="password" name="login_pw" value=""></td>
</tr> 
</table>
<br>
<input type="submit" name="" value="로그인" />
 
 </form>
</body>
</html>