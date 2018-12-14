<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");

String passwd=request.getParameter("passwd");
out.println(id+" //// "+passwd);
 
%>


 <%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url = "jdbc:oracle:thin:@localhost:1521:gonjiam";
  int i = 0;
  try {
   // DB 서버에 connection
   Connection Con = DriverManager.getConnection(url,
     "scott", "tiger");
   Statement stmt = Con.createStatement();
   // select 문장을 문자열 형태로 구성
  // String sql = "INSERT INTO  BOARD (SEQ,TITLE, CONTS) VALUES(board_idx.nextval,'"+title+"','"+conts+"')";
   
   
   String sql = "SELECT * FROM EMP WHERE ID='"+id+"' AND  PASSWD='"+passwd+"'" ;
   		   
   out.println(sql);
  ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) { 
  	     id =rs.getString("id");
 	     passwd=rs.getString("passwd");
 	    out.println(id);
     }
     //out.println(ii);
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

//alert("저장되었씁니다.");


//window.location.href="./index.jsp";
</script>
 
 

</body>
</html>
