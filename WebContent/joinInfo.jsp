<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.regex.Pattern"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<style type="text/css">
table,td,th {
	border: 1px solid purple;
}

th {
	background-color: purple;
	color: white;
}

li {
	list-style: none;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Donghoon's Model1 Board - Board_List</title>
<!-- 윈도우 상단에 뜨는 내용입니다. -->

</head>

<%

	DataSource ds = null;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
	final String DATASOURCE = "orcl";

    try {
 
        /*String driverName = "oracle.jdbc.driver.OracleDriver"; 
     	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
        String url = "jdbc:oracle:thin:@192.168.0.13:1522:ORCL";
        ResultSet rs = null;
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"scott","tiger");
        out.println("Oracle Database Connection Success!!");*/
               
        InitialContext ic = new InitialContext();
        ds = (DataSource)ic.lookup(DATASOURCE);
        conn = ds.getConnection();
        out.println("Oracle Database DataSource Connection Success!!"); 
 
      
 
        stmt = conn.createStatement();        
 		
        //my pc 
        String sql = "select * from MEMBER3";
        
        //company pc
        //String sql = "select * from scott.board order by scott.board.\"idx\"";
 
        rs = stmt.executeQuery(sql);
 
%>





<body>
	
	
	<!-- HTML문서의 주 내용이 들어가는 부분입니다. -->

	<h1>
		<p align="center">회원가입 정보</p>
	</h1>
	<!-- 헤드라인 글씨를 표현하는 태그입니다. -->

	<table align="center">
		<!-- 표 형식의 데이터를 표현하는 태그입니다. -->

		<tr>
			<!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->

			<th>이름</th>
			<!-- Table Header의 약자로 table태그 내에서 -->

			<th>아이디</th>
			<!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->

			<th>성별</th>

			<th>취미</th>

			<th>학력</th>

		</tr>

		<%   
 
        while(rs.next()){
 
            out.print("<tr>");
 
            out.print("<td>" + rs.getString(1) + "</td>");
 
            out.print("<td>" + rs.getString(2) + "</td>");
 
            out.print("<td>" + rs.getString(4) + "</td>");
 
            out.print("<td>" + rs.getString(5) + "</td>");
            
            out.print("<td>" + rs.getString(6) + "</td>");
 
            out.print("</tr>");
 
        }
 
%>
	

	</table>
	
	<div align="center">
		<ul>
			<li><a href="index.jsp">처음으로</a></li>
		</ul>		
	</div>
	
	<%      
 
        conn.close();
 
    }catch (Exception e) {
 
        out.println("Oracle Database Connection Something Problem. <hr>");
 
        out.println(e.getMessage());
 
        e.printStackTrace();
 
    }
 
%>

</body>

</html>