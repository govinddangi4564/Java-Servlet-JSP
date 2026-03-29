<%@page import="com.Employee.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

<style>
body {
	font-family: Arial, sans-serif;
}

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 35px;
	padding: 20px;
}

.card {
	border: 1px solid #ddd;
	border-radius: 12px;
	padding: 15px;
	background: #fff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	position: relative;
}

.card-top {
	position: absolute;
	top: 10px;
	right: 10px;
}

.menu-btn {
	border: none;
	background: transparent;
	font-size: 20px;
	cursor: pointer;
}

.profile-img {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	border: 3px solid gray;
	object-fit: cover;
}

.card-title {
	margin-top: 10px;
}

.card-text {
	color: gray;
	font-size: 14px;
}

.card-list {
	margin-top: 10px;
	padding-top: 10px;
	border-top: 1px solid #eee;
}

.row-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.label {
	color: gray;
	font-size: 13px;
}

.value {
	font-size: 14px;
	font-weight: 500;
}

.contact-item {
	display: flex;
	align-items: center;
	gap: 8px;
	margin: 5px 0;
	color: #555;
	font-size: 14px;
}
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">

		<%
		List<Employee> list = (List<Employee>) request.getAttribute("Emp");
		%>

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h3 class="fw-bold">
				<%=(list != null) ? list.size() : 0%>
				Employee
			</h3>

			<div class="d-flex gap-3">
				<a href="register.jsp" class="btn text-white"
					style="background-color: #ff7a59;">+ Add Candidate</a>
			</div>
		</div>

		<div class="card-container">

			<%
			if (list != null) {
				for (Employee e : list) {
			%>

			<div class="card">

				<div class="card-top">
					<div class="dropdown">
						<button class="btn btn-light btn-sm" data-bs-toggle="dropdown">⋯</button>

						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
								data-bs-target="#viewModal<%=e.getId()%>"> View </a></li>
							<li><a class="dropdown-item"
								href="editCandidate?id=<%=e.getId()%>">Edit</a></li>
							<li><a class="dropdown-item" href="#">Delete</a></li>
						</ul>
					</div>
				</div>

				<div class="text-center">
					<img src="employee.jpg" class="profile-img">
				</div>

				<div class="card-body text-center">
					<h5 class="card-title"><%=e.getName()%></h5>
					<p class="card-text"><%=e.getRole()%></p>
				</div>

				<div class="card-list">
					<div class="row-item">
						<div>
							<span class="label">Department</span><br> <span
								class="value"><%=e.getDepartment()%></span>
						</div>

						<div class="text-end">
							<span class="label">Hire Date</span><br> <span class="value"><%=e.getHire_date()%></span>
						</div>
					</div>

					<div class="contact-item">
						<i class="fas fa-envelope"></i> <span><%=e.getEmail()%></span>
					</div>

					<div class="contact-item">
						<i class="fas fa-phone"></i> <span>(+91) <%=e.getPhone()%></span>
					</div>
				</div>

			</div>

			<div class="modal fade" id="viewModal<%=e.getId()%>" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<div class="modal-header">
							<h5 class="modal-title">Employee Profile</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<div class="modal-body text-center">

							<img src="employee.jpg" class="profile-img"
								style="width: 100px; height: 100px;">

							<h4 class="mt-2"><%=e.getName()%></h4>
							<span class="badge bg-primary"><%=e.getRole()%></span>

							<hr>

							<p>
								<strong>ID:</strong>
								<%=e.getId()%></p>
							<p>
								<strong>Department:</strong>
								<%=e.getDepartment()%></p>
							<p>
								<strong>Email:</strong>
								<%=e.getEmail()%></p>
							<p>
								<strong>Phone:</strong>
								<%=e.getPhone()%></p>
							<p>
								<strong>Join Date:</strong>
								<%=e.getHire_date()%></p>
							<p>
								<strong>Status:</strong>
								<%=e.getStatus()%></p>

						</div>

						<div class="modal-footer">
							<button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			}
			%>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

</body>
</html>