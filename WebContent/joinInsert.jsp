<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>



<%@ page import="java.sql.*"%>

<%@ page import="javax.sql.*"%>

<%@ page import="javax.naming.*"%>

<%@ page import=" java.util.regex.*"%>



<%

String name = request.getParameter("name");

String id = request.getParameter("id");

String pass = request.getParameter("pass");

String gender = request.getParameter("gender");

String hobby= request.getParameter("hobby");

String edu = request.getParameter("edu");

 



 

try {

	DataSource ds = null;

	Connection conn = null;

 

	//final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
	final String DATASOURCE = "orcl";

 

	InitialContext ic = new InitialContext();

	ds = (DataSource) ic.lookup(DATASOURCE);

	conn = ds.getConnection();

	out.println("Oracle Database DataSource Connection Success!!");

 

	/*String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.		 

	String url = "jdbc:oracle:thin:@localhost:1521:ORCL"; //접속 URL정보와 포트번호(oracle포트), sid(oracle버전) 

	Class.forName(driverName);

	Connection con = DriverManager.getConnection(url, "scott",

			"tiger"); // getCo... : 계정정보 url, id, pw	 

	out.println("Oracle Database Connection Success!!");*/

 

	PreparedStatement pstmt = null;		


//	String sql = "INSERT INTO MEMBER3 VALUES (?, ?, ?, ?, ?, ?)";
	String sql = "INSERT INTO MEMBER3 VALUES (?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);

	pstmt.setString(2, id);

	pstmt.setString(3, pass);

	pstmt.setString(4, gender);

	pstmt.setString(5, hobby);
	
	pstmt.setString(6, edu);
	
	pstmt.executeUpdate();

	conn.close();

 

} catch (Exception e) {

 

	out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");

	out.println(e.getMessage());

	e.printStackTrace();

} finally {

 

	out.print("<script>location.href='loginForm.jsp';</script>");

 

}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Donghoon's Model1 Board - Board_Insert</title>

</head>

<body>



</body>



</html>
