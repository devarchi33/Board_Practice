<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import=" javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Donghoon's Model1 Board - Board_Search</title>
</head>
<%
	String idx = request.getParameter("idx");

		DataSource ds = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
		//final String DATASOURCE = "orcl";
		
	try {

		InitialContext ic = new InitialContext();
		ds = (DataSource) ic.lookup(DATASOURCE);
		conn = ds.getConnection();
		out.println("Oracle Database DataSource Connection Success!!");

		/*String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
		ResultSet rs = null;		
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(url,"scott","tiger");
		out.println("Oracle Database Connection Success!!");*/

		stmt = conn.createStatement();
		
		//my pc
		//String sql = "select * from scott.board2 where scott.board2.\"idx\" ="
		//		+ idx;
		String sql ="select *from board2";
		
		/*String sql = "select * from scott.board2 where scott.board2.\"idx\" ="
				+ idx;*/
		rs = stmt.executeQuery(sql);

		while (rs.next()) {
%>
<body>
	<h1>
		<p align="center">게시글 조회</p>
	</h1>
	<table border="1" align="center">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate")%></td>
			<th>조회수</th>
			<td><%=rs.getString("count")%></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content")%></td>
		</tr>
	</table>
	<p align="center">
		<a href='delete.jsp?idx=<%=rs.getString("idx")%>'>게시글 삭제</a> <a
			href="index.jsp">목록으로</a>
	</p>
	<%
		}
			conn.close();
		} catch (Exception e) {
			out.println("Oracle Database Connection Something Problem. <br>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
</body>
</html>