<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
String id=request.getParameter("login_id");

String passwd=request.getParameter("login_pw");
out.println(id+" //// "+passwd);

Boolean isLoginOK=false; 
 
%> 
<%@ include file="./dbconnect.jsp" %>

  
 <%
 
  int i = 0;
  try {
   // DB 서버에 connection
   Connection Con = DriverManager.getConnection(url,
     db_id, db_pw);
   Statement stmt = Con.createStatement();
   // select 문장을 문자열 형태로 구성
  // String sql = "INSERT INTO  BOARD (SEQ,TITLE, CONTS) VALUES(board_idx.nextval,'"+title+"','"+conts+"')";
   
   
   String sql = "SELECT * FROM EMP WHERE ID='"+id+"' AND  PASSWD='"+passwd+"'" ;
   		   
   out.println(sql);
  ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) { 
  	     id =rs.getString("id");
 	     passwd=rs.getString("passwd");
 	    out.println("정상적으로 로그인 되었습니다."+id);
 	    
 	   isLoginOK=true;
     }
   out.println(isLoginOK);	
 %>
 
 
<%
  // 사용한 자원을 반납
   stmt.close();
   Con.close();
 %>
 <h4>DB에서 정상적으로 출력되었습니다!!!</h4>
 <%
  } catch (SQLException e) {
	  System.out.print(e.getErrorCode()+e.getMessage());
 %>
 
 <%
  }
 %>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
 <% if(isLoginOK==true) { 
	 String      str=" alert(\"정상적으로 로그인되었습니다.\"); ";
			 str=str+" window.location.href=\"index.jsp\";  ";
			 
	         out.println(str);
	  
	  
  } %> 
  
  
  <% if(isLoginOK==false) { %>
 		 alert("로그인 정보가 잘못되었습니다.");
   		 history.back();

   <% } %> 
   
   
//window.location.href="./index.jsp";
</script>
 
 

</body>
</html>
