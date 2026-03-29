<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Candidate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>

	<%@ include file="sidebar.jsp"%>

	<%
	String msg = (String) request.getAttribute("msg");
	%>

	<%
	if (msg != null) {
	%>
	<h1 style="margin-left: 150px">
		<%=msg%></h1>

	<%
	}
	%>

	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="height: 90vh;">
			<div class="col-6 shadow p-4">
				<h1 class="my-4 text-center">Add Candidate</h1>

				<form action="addCandidate" method="post">
					<div class="mb-3">
						<label class="form-control">Name</label> <input type="text"
							class="form-control" name="name">
					</div>

					<div class="mb-3">
						<label class="form-label">Role</label> <select class="form-select"
							name="role" required>
							<option value="" selected disabled>Choose Role</option>

							<option value="Software Engineer">Software Engineer</option>
							<option value="Frontend Developer">Frontend Developer</option>
							<option value="Backend Developer">Backend Developer</option>
							<option value="Project Manager">Project Manager</option>
							<option value="HR Manager">HR Manager</option>
							<option value="Sales Executive">Sales Executive</option>

						</select>
					</div>

					<div class="mb-3">
						<label class="form-label">Department</label> <select
							class="form-select" name="department" required>
							<option value="" selected disabled>Choose Department</option>

							<option value="IT">IT</option>
							<option value="HR">Human Resources</option>
							<option value="FIN">Finance</option>
							<option value="OPS">Operations</option>
							<option value="MKT">Marketing</option>
							<option value="SUPPORT">Customer Support</option>

						</select>
					</div>

					<div class="mb-3">
						<label class="form-control">Email</label> <input type="email"
							class="form-control" name="email">
					</div>
					
					<div class="mb-3">
						<label class="form-control">Phone</label> <input type="number"
							class="form-control" name="phone">
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>