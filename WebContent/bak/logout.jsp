<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.info.*" %>
<%	
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("./");
		return;
	}
%>