<%@page import="com.Employee.model.Employee"%>
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
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">
		<h1 class="my-4">Read Employee :</h1>
	</div>

	<%
	List<Employee> list = (List<Employee>) request.getAttribute("EmpReport");
	%>

	<div class="main-content">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Role</th>
					<th scope="col">Email</th>
					<th scope="col">Status</th>
					<th scope="col">View</th>
				</tr>
			</thead>

			<tbody>

				<%
				for (Employee e : list) {
				%>

				<tr>
					<th scope="row"><%=e.getName()%></th>
					<th scope="row"><%=e.getRole()%></th>
					<th scope="row"><%=e.getEmail()%></th>
					<th scope="row"><%=e.getStatus()%></th>
					<th><a class="btn btn-warning" href="update?id=<%=e.getId()%>">View</a></th>
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