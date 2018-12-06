<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
String title=request.getParameter("title");

String conts=request.getParameter("conts");

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
   String sql = "INSERT INTO  BOARD (SEQ,TITLE, CONTS) VALUES(board_idx.nextval,'"+title+"','"+conts+"')";
   
   out.println(sql);

   // select문을 수행하면 데이터정보가 resultset 클래스 인스턴스로 리턴
   int ii= stmt.executeUpdate(sql);
 out.println(ii);
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


