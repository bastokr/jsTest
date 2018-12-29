 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
 <%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url = "jdbc:oracle:thin:@localhost:1521:gonjiam";
  
  String  db_id="scott";
  String  db_pw="tiger";
  
  %>
  <%
String seq=request.getParameter("seq"); 

%> 
  