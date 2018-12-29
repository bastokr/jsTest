<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>

<HTML>
<HEAD>
<TITLE>학과 테이블 출력 프로그램</TITLE>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
</HEAD>

<BODY>
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
   String sql = "SELECT SEQ,TITLE,CONTS FROM BOARD order by seq desc";

   // select문을 수행하면 데이터정보가 resultset 클래스 인스턴스로 리턴
   ResultSet rs = stmt.executeQuery(sql);
 %>

 <h3>Department 테이블</h3>
 
 
사용자명 : 
<%
out.println(session.getAttribute("name"));
 
%>
 
 <table border="1">
  <tr>
   <td>순번</td>
   <td>제목</td>
   <td>내용</td>
  </tr>
  <%
   // 마지막 데이터까지 반복
    while (rs.next()) {
  %>
  <tr>
   <td><a href="view.jsp?seq=<%=rs.getString(1)%>" ><%=rs.getString(1)%></a></td>
   <td><a href="view.jsp?seq=<%=rs.getString(1)%>" ><%=rs.getString("title")%></a></td>
   <td><%=rs.getString(3)%></td>
  </tr>
  <%
   }
  %>
 </table>
 <%
  // 사용한 자원을 반납
   rs.close();
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


<a  href="write.jsp" >  쓰기 </a>
</BODY>
</HTML>
<button onclick="Mywrite()">쓰기</button>
 
<script>

function  Mywrite(){
 window.location.href="write.jsp";
}
 
 
 <%  if(session.getAttribute("id")==null){ %>
	window.location.href="login.jsp";

<%  }  %>
 

</script>
