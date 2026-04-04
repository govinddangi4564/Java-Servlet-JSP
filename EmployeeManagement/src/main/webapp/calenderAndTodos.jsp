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

		<div class="row mt-5">

			<!-- CALENDAR / SCHEDULE -->
			<div class="col-md-6">
				<div class="card shadow border-0 h-100">
					<div class="card-body">
						<h5 class="mb-3">📅 Schedule</h5>

						<ul class="list-group">

							<li class="list-group-item"><strong>10 Apr:</strong> Backend
								Developer Deadline <span class="badge bg-danger float-end">Deadline</span>
							</li>

							<li class="list-group-item"><strong>12 Apr:</strong>
								Interview - Rahul Sharma <span
								class="badge bg-primary float-end">Interview</span></li>

							<li class="list-group-item"><strong>15 Apr:</strong> Joining
								- Priya Singh <span class="badge bg-success float-end">Joining</span>
							</li>

							<li class="list-group-item"><strong>18 Apr:</strong> HR
								Meeting <span class="badge bg-warning float-end">Meeting</span>
							</li>

						</ul>
					</div>
				</div>
			</div>

			<!-- TODOS -->
			<div class="col-md-6">
				<div class="card shadow border-0 h-100">
					<div class="card-body">
						<h5 class="mb-3">📝 Todos</h5>

						<ul class="list-group">

							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								<span>Review new candidates</span> <input type="checkbox">
							</li>

							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								<span>Schedule interviews</span> <input type="checkbox">
							</li>

							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								<span>Update job status</span> <input type="checkbox">
							</li>

							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								<span>Call shortlisted candidates</span> <input type="checkbox">
							</li>

						</ul>

					</div>
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