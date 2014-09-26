<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.info.*" %>    
<%@ page import="board.login.*" %>    
<%
	request.setCharacterEncoding("UTF-8");

	UserDao userDao = UserDao.getInstance();
	User user = null;

	String id = request.getParameter("id");
	System.out.println("request : " + id);
	
	String pass = request.getParameter("pass");
	System.out.println("request : " + pass);
	System.out.println();
	//System.out.println("User Init : " + user.getId());
	
	
	user = userDao.login(id, pass);
	//System.out.println("user ID : " + user.getId());
	
	if (user != null) {
		session.setAttribute("user", user);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("./");
	}
%>