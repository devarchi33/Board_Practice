<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Donghoon's Model1 Board - Board_delete</title>
</head>
<%
		String idx = request.getParameter("idx");
		DataSource ds = null;
		Connection conn = null;
		
		//final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
		final String DATASOURCE = "orcl";
		
	try{		
		InitialContext ic = new InitialContext();
		ds = (DataSource)ic.lookup(DATASOURCE);
		conn = ds.getConnection();
		out.println("Oracle Database DataSource Connection Success!!");
		
		/*String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:ORCL";		
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(url,"scott","tiger");
		out.println("Oracle Database Connection Success!!");*/
		
		Statement stmt = conn.createStatement();
		String sql = "delete from scott.board2 where scott.board2.\"idx\" = " +idx;              //삭제 쿼리
		//String sql = "delete from scott.board where scott.board.\"idx\" = " +idx;              //삭제 쿼리
		stmt.executeQuery(sql);
		conn.close();
		
		
	}catch(Exception e){
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<script>
	alert("게시글이 삭제 되었습니다."); //게시글이 삭제 되었다고 경고창 띄워 주고 
	location.href = "redirect.jsp"; //리스트 페이지로 이동합니다.
</script>
<body>

</body>
</html>