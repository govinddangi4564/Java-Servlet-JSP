<%@page import="com.Employee.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Candidate</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<%
	Employee e = (Employee) request.getAttribute("getEmp");
	%>

	<%
	if (e != null) {
	%>

	<div class="main-content">

		<div class="row justify-content-center align-items-center"
			style="min-height: 65vh;">

			<a href="getCandidate"
				class="text-decoration-none d-inline-block mb-2"> <i
				class="bi bi-arrow-left"></i> Back
			</a>

			<div class="col-6 shadow p-4 rounded">

				<h2 class="text-center mb-4">Edit Candidate</h2>

				<form action="editCandidate" method="post">

					<input type="hidden" value="<%=e.getId()%>" name="id">

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Role</label>
						<div class="col-sm-7">
							<select class="form-select" name="role" required>
								<option value="" disabled
									<%=(e.getRole() == null) ? "selected" : ""%>>Select
									Role</option>

								<option value="Software Engineer"
									<%="Software Engineer".equals(e.getRole()) ? "selected" : ""%>>Software
									Engineer</option>

								<option value="Frontend Developer"
									<%="Frontend Developer".equals(e.getRole()) ? "selected" : ""%>>Frontend
									Developer</option>

								<option value="Backend Developer"
									<%="Backend Developer".equals(e.getRole()) ? "selected" : ""%>>Backend
									Developer</option>

								<option value="Project Manager"
									<%="Project Manager".equals(e.getRole()) ? "selected" : ""%>>Project
									Manager</option>

								<option value="HR Manager"
									<%="HR Manager".equals(e.getRole()) ? "selected" : ""%>>HR
									Manager</option>

								<option value="Sales Executive"
									<%="Sales Executive".equals(e.getRole()) ? "selected" : ""%>>Sales
									Executive</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Department</label>
						<div class="col-sm-7">
							<select class="form-select" name="department" required>
								<option value="" disabled
									<%=(e.getDepartment() == null) ? "selected" : ""%>>Select
									Department</option>

								<option value="IT"
									<%="IT".equals(e.getDepartment()) ? "selected" : ""%>>IT</option>

								<option value="HR"
									<%="HR".equals(e.getDepartment()) ? "selected" : ""%>>Human
									Resources</option>

								<option value="FIN"
									<%="FIN".equals(e.getDepartment()) ? "selected" : ""%>>Finance</option>

								<option value="OPS"
									<%="OPS".equals(e.getDepartment()) ? "selected" : ""%>>Operations</option>

								<option value="MKT"
									<%="MKT".equals(e.getDepartment()) ? "selected" : ""%>>Marketing</option>

								<option value="SUPPORT"
									<%="SUPPORT".equals(e.getDepartment()) ? "selected" : ""%>>Customer
									Support</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Phone</label>
						<div class="col-sm-7">
							<input type="number" class="form-control" name="phone"
								value="<%=e.getPhone()%>">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Email</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" name="email"
								value="<%=e.getEmail()%>">
						</div>
					</div>

					<div class="mb-4 row">
						<label class="col-sm-3 col-form-label text-end">Status</label>
						<div class="col-sm-7">
							<select class="form-select" name="status" required>
								<option value="active"
									<%="active".equals(e.getStatus()) ? "selected" : ""%>>Active</option>

								<option value="inactive"
									<%="inactive".equals(e.getStatus()) ? "selected" : ""%>>Inactive</option>
							</select>
						</div>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary px-4">
							Update Candidate</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<%
	}
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>