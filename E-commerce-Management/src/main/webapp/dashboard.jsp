<%@page import="model.Users"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>

	<%
	HttpSession session = request.getSession(false);
	String username = (String) session.getAttribute("username");

	if (username == null) {
		response.sendRedirect("login");
		return;
	}

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	UserDao dao = new UserDao();
	Users u = dao.getUserByUsername(username);
	%>

	<%@ include file="navbar.jsp"%>

	<h1>
		Welcome :
		<%=username%></h1>
	<h1>
		Name :
		<%=u.getName()%></h1>
	<h1>
		Email :
		<%=u.getEmail()%></h1>

	<a href="logout" class="btn btn-primary"> logout </a>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>