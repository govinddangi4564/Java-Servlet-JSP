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

	<%@ include file="navbar.jsp"%>

	<div class="container">
		<h1 class="my-4">Read Employee :</h1>
	</div>

	<%
	List<Employee> list = (List<Employee>) request.getAttribute("Emp");
	%>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Age</th>
					<th scope="col">Email</th>
					<th scope="col">Salary</th>
					<th scope="col">Department</th>
				</tr>
			</thead>

			<tbody>

				<%
				for (Employee e : list) {
				%>

				<tr>
					<th scope="row"><%=e.getId()%></th>
					<th scope="row"><%=e.getName()%></th>
					<th scope="row"><%=e.getAge()%></th>
					<th scope="row"><%=e.getEmail()%></th>
					<th scope="row"><%=e.getSalary()%></th>
					<th scope="row"><%=e.getDepartment()%></th>
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