<%@page import="com.Employee.model.Jobs"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Jobs</title>

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


<style type="text/css">
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
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">

		<%
		List<Jobs> list = (List<Jobs>) request.getAttribute("jobs");
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

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h3 class="fw-bold">
				<%=(list != null) ? list.size() : 0%>
				Jobs
			</h3>

			<div class="d-flex gap-3">
				<div class="dropdown">
					<a
						class="d-flex align-items-center gap-2 text-secondary text-decoration-none"
						href="#" data-bs-toggle="dropdown"> <i class="bi bi-funnel"></i>
						<span>Filter</span>
					</a>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="viewJobs">All</a></li>
						<li><a class="dropdown-item" href="filterJobs?status=open">Open</a></li>
						<li><a class="dropdown-item" href="filterJobs?status=closed">Closed</a></li>
						<li><a class="dropdown-item" href="filterJobs?status=on hold">On
								Hold</a></li>
					</ul>
				</div>

				<a href="createJob.jsp" class="btn text-white"
					style="background-color: #ff7a59;"> + Add Jobs </a>
			</div>
		</div>


		<div class="container mt-4">
			<div class="row g-4">

				<%
				if (list != null) {
					for (Jobs j : list) {
				%>

				<div class="col-md-6 col-lg-6">
					<div class="card shadow-sm h-100">

						<div class="card-top">
							<div class="dropdown">
								<button class="btn btn-light btn-sm" data-bs-toggle="dropdown">⋯</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Edit</a></li>
									<li><a class="dropdown-item text-danger"
										href="deleteJobs?id=<%=j.getId()%>"
										onclick="return confirm('Are you sure you want to delete the data : <%=j.getId()%> ')">Delete</a></li>
								</ul>
							</div>
						</div>

						<div class="card-body">
							<p>
							<h5 class="card-title mb-1 left-0">
								Job Title: <b><%=j.getTitle()%></b>
							</h5>
							<br>
							<p class="text-muted mb-1"><%=j.getJobDescription()%></p>

							<hr>

							<div class="d-flex justify-content-between text-start">
								<div>
									<small class="text-muted">Role</small><br> <b><%=j.getRole()%></b>
								</div>

								<div>
									<small class="text-muted">Work Mode</small><br> <b><%=j.getWorkMode()%></b>
								</div>

								<div class="text-end">
									<small class="text-muted">Job Type</small><br> <b><%=j.getJobType()%></b>
								</div>

								<div class="text-end">
									<small class="text-muted">Experience</small><br> <b><%=j.getMinExperience()%></b>
								</div>

							</div>
							<br>

							<div class="d-flex justify-content-between text-start">
								<div>
									<small class="text-muted">Deadline</small><br> <b><%=j.getDeadline()%></b>
								</div>

								<div>
									<small class="text-muted">Total Vacancies</small><br> <b><%=j.getTotalVacancies()%></b>
								</div>

								<div class="text-end">
									<small class="text-muted">Status</small><br> <b><%=j.getStatus()%></b>
								</div>

							</div>

							<br>

							<div class="d-flex justify-content-between text-start">
								<div>
									<small class="text-muted">Company mail</small><br> <b><%=j.getEmail()%></b>
								</div>

								<div>
									<small class="text-muted">Company phone</small><br> <b>(+91)
										<%=j.getPhone()%></b>
								</div>
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
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>