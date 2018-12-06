<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
 
    
    
<!DOCTYPE html>
<%
String seq=request.getParameter("seq");
String title ="";
String conts="";

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
   String sql = "SELECT SEQ,TITLE,CONTS FROM BOARD   WHERE SEQ="+seq;
   
   System.out.println(sql);
   
 

   // select문을 수행하면 데이터정보가 resultset 클래스 인스턴스로 리턴
   ResultSet rs = stmt.executeQuery(sql);
   while (rs.next()) {
	   
	     title =rs.getString("title");
	     conts=rs.getString("conts");
	     
	     System.out.println(title);
   }
   
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
 
<script>

function  delConts(){
	
	if(confirm("정말 삭제하시겠습니까?")){
		
		window.location.href="delete.jsp?seq=<%=seq%>" ;
	}
	
	 
}
 

</script>

 
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>계시판 내용</h1> 
 <form action="update.jsp"  method="post"> 

 <input type="hidden" name="seq" value="<%=seq %>">     
 
제목:<input type="text" name="title" value="<%=title %>">     
<br><br>
내용:<textarea   name="conts"  cols="80" rows="10"  >
내용:
<%=conts %></textarea>

<br><br>
<center> 
<input type="submit" value="수정" />
<input type="button"  onclick="delConts()" value="삭제" />

</center>




</form>


</body>
</html>