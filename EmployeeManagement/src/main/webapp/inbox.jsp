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

		<div class="card shadow border-0 mt-4">
			<div class="card-body">
				<h5 class="mb-3">Inbox / Notifications</h5>

				<ul class="list-group">

					<li class="list-group-item"><i
						class="bi bi-person-plus text-success"></i> Rahul Sharma applied
						for Backend Developer <small class="text-muted float-end">2
							mins ago</small></li>

					<li class="list-group-item"><i
						class="bi bi-briefcase text-primary"></i> Job "Frontend Developer"
						updated <small class="text-muted float-end">10 mins ago</small></li>

					<li class="list-group-item"><i
						class="bi bi-exclamation-circle text-danger"></i> Job "Sales
						Executive" deadline expired <small class="text-muted float-end">Today</small>
					</li>

					<li class="list-group-item"><i
						class="bi bi-check-circle text-warning"></i> New job "HR Manager"
						added <small class="text-muted float-end">Yesterday</small></li>

				</ul>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>