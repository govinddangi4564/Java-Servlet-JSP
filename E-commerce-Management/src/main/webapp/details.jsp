<%@page import="model.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
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
	%>

	<%@ include file="navbar.jsp"%>

	<%
	Products pr = (Products) request.getAttribute("SingleProduct");
	%>

	<div class="container">
		<div class="row">
			<div class="col-5">
				<img alt="" class="img-fluid" src="files/<%=pr.getImage()%> ">
			</div>
			<div class="col-5">
				<h1>
					Price :
					<%=pr.getPrice()%>
				</h1>
				<p>
					<%=pr.getDescription()%>
				</p>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>