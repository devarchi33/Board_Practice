

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

border: 1px solid yellow;

}

 

th {

background-color: yellow;

color: gray;

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



final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
//final String DATASOURCE = "orcl";

 

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

 

        //String sql = "select * from scott.board2 order by scott.board2.\"idx\"";

        String sql = "select * from SALGRADE";

 

        rs = stmt.executeQuery(sql);

 

%>

 

 

 

 

 

<body>

<!-- HTML문서의 주 내용이 들어가는 부분입니다. -->

 

<h1>

	<p align="center">SALGRADE</p>

</h1>

<!-- 헤드라인 글씨를 표현하는 태그입니다. -->

 

<table align="center">

	<!-- 표 형식의 데이터를 표현하는 태그입니다. -->

 

	<tr>

		<!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
		<!-- Table Header의 약자로 table태그 내에서 -->

		<!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->

 

		<th>GRADE</th>

		

		<th>LOSAL</th>

		

		<th>HISAL</th>

 

	</tr>

 

	<%   

 

        while(rs.next()){

 

            out.print("<tr>");

 

            out.print("<td>" + rs.getString(1) + "</td>");

            

            out.print("<td>" + rs.getString(2) + "</td>");

  

            out.print("<td>" + rs.getString(3) + "</td>");

 

            out.print("</tr>");

 

        }

 

%>

 

</table>

<p align="center">

 

	<a href="index.jsp">게시판</a><br />
	<a href="emp_table.jsp">직원리스트</a><br />
	<a href="dept_table.jsp">부서리스트</a><br />

 

</p>

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
