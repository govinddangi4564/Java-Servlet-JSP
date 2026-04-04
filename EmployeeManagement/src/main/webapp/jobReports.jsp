<%@page import="com.Employee.model.Jobs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">
		<a href="viewReports.jsp" style="text-decoration: none"><i
			class="bi bi-arrow-left"> Back</i></a>
		<h1 class="my-4">Job Reports :</h1>
	</div>

	<%
	List<Jobs> list = (List<Jobs>) request.getAttribute("jobReport");
	%>

	<div class="main-content">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Job Title</th>
					<th scope="col">Role</th>
					<th scope="col">Deadline</th>
					<th scope="col">Status</th>
					<th scope="col">View</th>
				</tr>
			</thead>

			<tbody>

				<%
				for (Jobs j : list) {
				%>

				<tr>
					<th scope="row"><%=j.getTitle()%></th>
					<th scope="row"><%=j.getRole()%></th>
					<th scope="row"><%=j.getDeadline()%></th>
					<th scope="row"><%=j.getStatus()%></th>
					<th><a class="btn btn-warning" href="viewJobDetails?id=<%=j.getId() %>">View</a></th>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>