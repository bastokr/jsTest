<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>

<HTML>
<HEAD>
<TITLE>�а� ���̺� ��� ���α׷�</TITLE>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
</HEAD>

<BODY>
 <%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url = "jdbc:oracle:thin:@localhost:1521:gonjiam";
  int i = 0;
  try {
   // DB ������ connection
   Connection Con = DriverManager.getConnection(url,
     "scott", "tiger");
   Statement stmt = Con.createStatement();
   // select ������ ���ڿ� ���·� ����
   String sql = "SELECT SEQ,TITLE,CONTS FROM BOARD order by seq desc";

   // select���� �����ϸ� ������������ resultset Ŭ���� �ν��Ͻ��� ����
   ResultSet rs = stmt.executeQuery(sql);
 %>

 <h3>Department ���̺�</h3>
 
 
����ڸ� : 
<%
out.println(session.getAttribute("name"));
 
%>
 
 <table border="1">
  <tr>
   <td>����</td>
   <td>����</td>
   <td>����</td>
  </tr>
  <%
   // ������ �����ͱ��� �ݺ�
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
  // ����� �ڿ��� �ݳ�
   rs.close();
   stmt.close();
   Con.close();
 %>
 <h4>DB���� ���������� ��µǾ����ϴ�!!!</h4>
 <%
  } catch (SQLException e) {
	  System.out.print(e.getErrorCode()+e.getMessage());
 %>
 
 <%
  }
 %>


<a  href="write.jsp" >  ���� </a>
</BODY>
</HTML>
<button onclick="Mywrite()">����</button>
 
<script>

function  Mywrite(){
 window.location.href="write.jsp";
}
 
 
 <%  if(session.getAttribute("id")==null){ %>
	window.location.href="login.jsp";

<%  }  %>
 

</script>
