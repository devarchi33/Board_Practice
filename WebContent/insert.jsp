<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<%@ page import="java.sql.*"%>

<%@ page import="javax.sql.*"%>

<%@ page import="javax.naming.*"%>

<%@ page import=" java.util.regex.*"%>



<%

String title = request.getParameter("title");

String writer = request.getParameter("writer");

String regdate = request.getParameter("regdate");

String content = request.getParameter("content");

 

if (title == "" || title == null)

	out.println("title�� null�Դϴ�.");

 

if (writer == "" || writer == null)

	out.println("writer�� null�Դϴ�.");

else if (!Pattern.matches(

		"^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))

	out.println("�̸��� ������ �ƴմϴ�.");

 

if (regdate == "" || regdate == null)

	out.println("regdate�� null�Դϴ�.");

else if (!Pattern.matches("^[0-9]*$", regdate))

	out.println("���������� �ƴմϴ�.");

 

if (content == "" || content == null)

	out.println("content�� null�Դϴ�.");

 

try {

	DataSource ds = null;

	Connection conn = null;

 

	final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
	//final String DATASOURCE = "orcl";

 

	InitialContext ic = new InitialContext();

	ds = (DataSource) ic.lookup(DATASOURCE);

	conn = ds.getConnection();

	out.println("Oracle Database DataSource Connection Success!!");

 

	/*String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.		 

	String url = "jdbc:oracle:thin:@localhost:1521:ORCL"; //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����) 

	Class.forName(driverName);

	Connection con = DriverManager.getConnection(url, "scott",

			"tiger"); // getCo... : �������� url, id, pw	 

	out.println("Oracle Database Connection Success!!");*/

 

	PreparedStatement pstmt = null;		


//	String sql = "INSERT INTO BOARD VALUES (BOARD_SEQ.nextval, ?, ?, ?, " + 1 + ", ?)";
	String sql = "INSERT INTO BOARD2 VALUES (BOARD_SEQ.nextval, ?, ?, ?, " + 1 + ", ?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, title);

	pstmt.setString(2, writer);

	pstmt.setString(3, regdate);

	pstmt.setString(4, content);
	
	pstmt.executeUpdate();

	/*String sql = "INSERT INTO BOARD "
			+ "VALUES (BOARD_SEQ.nextval, '" + title + "', '"
			+ writer + "', '" + regdate + "', '" + 1 + "', '"
			+ content + "')";*/

	conn.close();

 

} catch (Exception e) {

 

	out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");

	out.println(e.getMessage());

	e.printStackTrace();

} finally {

 

	out.print("<script>location.href='index.jsp';</script>");

 

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
