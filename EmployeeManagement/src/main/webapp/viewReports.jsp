<%@page import="com.Employee.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
.card-hover:hover {
	transform: translateY(-5px);
	transition: 0.3s;
}

.main-content {
	padding: 20px;
}
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">

		<!-- Heading -->
		<div class="mb-4">
			<h2 class="fw-bold">Reports Dashboard</h2>
			<p class="text-muted">View and analyze system reports</p>
		</div>

		<!-- REPORT CARDS -->
		<div class="row g-4">

			<!-- Employee Report -->
			<div class="col-md-6">
				<div class="card shadow border-0 card-hover h-100">
					<div class="card-body text-center">

						<i class="bi bi-people-fill fs-1 text-primary"></i>

						<h4 class="mt-3">Employee Reports</h4>
						<p class="text-muted">View candidate details, status, and
							performance reports</p>

						<a href="employeesReport" class="btn btn-primary px-4"> <i
							class="bi bi-eye"></i> View Report
						</a>

					</div>
				</div>
			</div>

			<!-- Job Report -->
			<div class="col-md-6">
				<div class="card shadow border-0 card-hover h-100">
					<div class="card-body text-center">

						<i class="bi bi-briefcase-fill fs-1 text-success"></i>

						<h4 class="mt-3">Job Reports</h4>
						<p class="text-muted">Analyze job postings, vacancies, and
							hiring status</p>

						<a href="jobReports" class="btn btn-success px-4"> <i
							class="bi bi-eye"></i> View Report
						</a>

					</div>
				</div>
			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>