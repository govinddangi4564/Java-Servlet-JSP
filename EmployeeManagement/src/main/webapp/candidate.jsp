<%@page import="java.sql.Date"%>
<%@page import="com.Employee.model.EmployeeDao"%>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
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
	width: 170px;
	height: 170px;
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

		<%
		String msg = (String) request.getAttribute("msg");
		%>

		<%
		if (msg != null) {
		%>
		<h1>
			<%=msg%>
		</h1>

		<%
		}
		%>

		<%
		EmployeeDao dao = new EmployeeDao();

		int total = dao.getTotalEmployee();
		%>

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h3 class="fw-bold">
				<%=total%>
				Employee
			</h3>



			<div class="d-flex gap-3">
				<div class="dropdown">
					<a
						class="d-flex align-items-center gap-2 text-secondary text-decoration-none"
						href="#" data-bs-toggle="dropdown"> <i class="bi bi-funnel"></i>
						<span>Filter</span>
					</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="getCandidate">All</a></li>
						<li><a class="dropdown-item"
							href="filterCandidate?status=active">Active</a></li>
						<li><a class="dropdown-item"
							href="filterCandidate?status=inactive">Inactive</a></li>
					</ul>
				</div>

				<div class="dropdown">

					<a
						class="d-flex align-items-center gap-2 text-secondary text-decoration-none"
						href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-arrow-down-up"></i> <span>Sort</span>
					</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item"
							href="sortCandidate?sort=name&order=asc"> Name (A → Z) </a></li>

						<li><a class="dropdown-item"
							href="sortCandidate?sort=name&order=desc"> Name (Z → A) </a></li>

						<li><a class="dropdown-item"
							href="sortCandidate?sort=created_at&order=desc"> Created Date
								(Recent) </a></li>

						<li><a class="dropdown-item"
							href="sortCandidate?sort=created_at&order=asc"> Created Date
								(Old) </a></li>

						<li><a class="dropdown-item"
							href="sortCandidate?sort=hire_date&order=desc"> Hire Date
								(Recent) </a></li>
					</ul>

				</div>

				<a href="register.jsp" class="btn text-white"
					style="background-color: #ff7a59;"> + Add Candidate </a>
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
							<li><a class="dropdown-item text-danger"
								href="deleteCandidate?id=<%=e.getId()%>"
								onclick="return confirm('Are you sure you want to delete the data : <%=e.getId()%> ')">Delete</a></li>
						</ul>
					</div>
				</div>

				<div class="text-center">
					<img alt="" src="Files/<%=e.getProfile()%>"
						style="height: 70px; border-radius: 50px;">
				</div>

				<div class="card-body text-center">
					<h5 class="card-title">
						<%=e.getName()%>
					</h5>
					<p class="card-text">
						<%=e.getRole()%>
					</p>
				</div>

				<p>
					<%
					if ("active".equals(e.getStatus())) {
					%>
					<span style="color: green; font-size: 14px;"> ● Active </span>
					<%
					} else {
					%>
					<span style="color: red; font-size: 14px;"> ● Inactive </span>
					<%
					}
					%>
				</p>

				<div class="card-list">
					<div class="row-item">
						<div>
							<span class="label">Department</span><br> <span
								class="value"> <%=e.getDepartment()%>
							</span>
						</div>

						<div class="text-end">
							<span class="label">Hire Date</span><br> <span class="value">
								<%=e.getHire_date()%>
							</span>
						</div>
					</div>

					<div class="contact-item">
						<i class="fas fa-envelope"></i> <span> <%=e.getEmail()%>
						</span>
					</div>

					<div class="contact-item">
						<i class="fas fa-phone"></i> <span>(+91) <%=e.getPhone()%>
						</span>
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

							<img alt="" src="Files/<%=e.getProfile()%>"
								style="height: 70px; border-radius: 50px;">

							<h4 class="mt-2">
								<%=e.getName()%>
							</h4>
							<span class="badge bg-primary"> <%=e.getRole()%>
							</span>

							<hr>

							<p>
								<strong>ID:</strong>
								<%=e.getId()%>
							</p>
							<p>
								<strong>Department:</strong>
								<%=e.getDepartment()%>
							</p>
							<p>
								<strong>Email:</strong>
								<%=e.getEmail()%>
							</p>
							<p>
								<strong>Phone:</strong>
								<%=e.getPhone()%>
							</p>
							<p>
								<strong>Join Date:</strong>
								<%=e.getHire_date()%>
							</p>
							<p>
								<strong>Status:</strong>
								<%=e.getStatus()%>
							</p>

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

		<div class="container">

			<div class="row justify-content-center">
				<div class="col-2">
					<nav aria-label="Page navigation example">
						<ul class="pagination pages">

							<%
							if (total < 8) {

							} else {

								for (int i = 0, j = 1; i <= total; i = i + 8, j++) {
							%>
							<li class="page-item"><a class="page-link"
								href="getEmployee?offset=<%=i%>"> <%=j%>
							</a></li>

							<%
							}
							}
							%>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

</body>

</html>