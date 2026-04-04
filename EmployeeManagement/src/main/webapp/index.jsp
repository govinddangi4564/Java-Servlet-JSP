<%@page import="com.Employee.model.EmployeeDao"%>
<%@page import="com.Employee.model.Jobs"%>
<%@page import="com.Employee.model.JobsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
.card-hover:hover {
	transform: scale(1.03);
	transition: 0.3s;
}
</style>

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content">

		<!-- Heading -->
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h2 class="fw-bold">Dashboard</h2>
			<span class="text-muted">Welcome Admin 👋</span>
		</div>

		<!-- STAT CARDS -->
		<div class="row g-4">

			<%
			JobsDao jDao = new JobsDao();
			int totalJobs = jDao.getTotalJobs();
			%>
			
			<%
			EmployeeDao eDao = new EmployeeDao();
			int totalEmp = eDao.getTotalEmployee();
			%>

			<!-- Total Jobs -->
			<div class="col-md-3">
				<div class="card shadow card-hover border-0">
					<div class="card-body text-center">
						<i class="bi bi-briefcase-fill fs-1 text-primary"></i>
						<h5 class="mt-2">Total Jobs</h5>
						<h3 class="fw-bold text-primary"><%=totalJobs %></h3>
					</div>
				</div>
			</div>

			<!-- Total Candidates -->
			<div class="col-md-3">
				<div class="card shadow card-hover border-0">
					<div class="card-body text-center">
						<i class="bi bi-people-fill fs-1 text-success"></i>
						<h5 class="mt-2">Candidates</h5>
						<h3 class="fw-bold text-success"><%=totalEmp %></h3>
					</div>
				</div>
			</div>
			
			<%
			int active = jDao.getActiveJobs();
			int InActive = jDao.getInActiveJobs();
			%>

			<!-- Active Jobs -->
			<div class="col-md-3">
				<div class="card shadow card-hover border-0">
					<div class="card-body text-center">
						<i class="bi bi-check-circle-fill fs-1 text-warning"></i>
						<h5 class="mt-2">Active Jobs</h5>
						<h3 class="fw-bold text-warning"><%=active %></h3>
					</div>
				</div>
			</div>

			<!-- Closed Jobs -->
			<div class="col-md-3">
				<div class="card shadow card-hover border-0">
					<div class="card-body text-center">
						<i class="bi bi-x-circle-fill fs-1 text-danger"></i>
						<h5 class="mt-2">Closed Jobs</h5>
						<h3 class="fw-bold text-danger"><%=InActive %></h3>
					</div>
				</div>
			</div>

		</div>

		<!-- QUICK ACTIONS -->
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card shadow border-0">
					<div class="card-body">
						<h5 class="mb-3">Quick Actions</h5>

						<a href="createJob" class="btn btn-primary me-2 mb-2"> <i
							class="bi bi-plus-circle"></i> Add Job
						</a> <a href="viewJobs" class="btn btn-outline-primary me-2 mb-2">
							<i class="bi bi-briefcase"></i> View Jobs
						</a> <a href="register.jsp" class="btn btn-success me-2 mb-2"> <i
							class="bi bi-person-plus"></i> Add Candidate
						</a> <a href="getCandidate" class="btn btn-outline-success mb-2">
							<i class="bi bi-people"></i> View Candidates
						</a>
					</div>
				</div>
			</div>

			<!-- SYSTEM INFO -->
			<div class="col-md-6">
				<div class="card shadow border-0">
					<div class="card-body">
						<h5 class="mb-3">System Info</h5>

						<p>
							<strong>Total Departments:</strong> 6
						</p>
						<p>
							<strong>Work Modes:</strong> Remote / Hybrid / Onsite
						</p>
						<p>
							<strong>Job Types:</strong> Full-time, Part-time, Internship
						</p>
						<p>
							<strong>System Status:</strong> <span class="text-success">Running</span>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- RECENT ACTIVITY -->
		<div class="row mt-5">
			<div class="col-md-12">
				<div class="card shadow border-0">
					<div class="card-body">
						<h5 class="mb-3">Recent Activity</h5>

						<ul class="list-group">
							<li class="list-group-item"><i
								class="bi bi-check-circle text-success"></i> New Job "Backend
								Developer" added</li>

							<li class="list-group-item"><i
								class="bi bi-person-plus text-primary"></i> New Candidate
								registered</li>

							<li class="list-group-item"><i
								class="bi bi-pencil-square text-warning"></i> Job "Frontend
								Developer" updated</li>

							<li class="list-group-item"><i
								class="bi bi-x-circle text-danger"></i> Job "Sales Executive"
								closed</li>
						</ul>

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