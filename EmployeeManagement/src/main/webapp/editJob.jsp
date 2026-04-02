<%@page import="com.Employee.model.Jobs"%>
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

	<%
	Jobs j = (Jobs) request.getAttribute("getJob");
	%>

	<%
	if (j != null) {
	%>

	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="min-height: 90vh;">

			<div class="col-6 shadow p-4 rounded">

				<h2 class="text-center mb-4">Edit Job</h2>

				<form action="editJob" method="post">

					<input type="hidden" value="<%=j.getId()%>" name="id">

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Job Title</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="jobTitle"
								value="<%=j.getTitle()%>" required>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Role</label>
						<div class="col-sm-7">
							<select class="form-select" name="role" required>
								<option value="" disabled
									<%=(j.getRole() == null) ? "selected" : ""%>>Select Role</option>
								<option value="Software Engineer"
									<%="Software Engineer".equals(j.getRole()) ? "selected" : ""%>>Software
									Engineer</option>
								<option value="Frontend Developer"
									<%="Frontend Developer".equals(j.getRole()) ? "selected" : ""%>>Frontend
									Developer</option>
								<option value="Backend Developer"
									<%="Backend Developer".equals(j.getRole()) ? "selected" : ""%>>Backend
									Developer</option>
								<option value="Project Manager"
									<%="Project Manager".equals(j.getRole()) ? "selected" : ""%>>Project
									Manager</option>
								<option value="HR Manager"
									<%="HR Manager".equals(j.getRole()) ? "selected" : ""%>>HR
									Manager</option>
								<option value="Sales Executive"
									<%="Sales Executive".equals(j.getRole()) ? "selected" : ""%>>Sales
									Executive</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Work Mode</label>
						<div class="col-sm-7">
							<select class="form-select" name="workMode" required>
								<option value="" disabled
									<%=(j.getWorkMode() == null) ? "selected" : ""%>>Select
									Work Mode</option>
								<option value="Remote"
									<%="Remote".equals(j.getWorkMode()) ? "selected" : ""%>>Remote</option>
								<option value="Onsite"
									<%="Onsite".equals(j.getWorkMode()) ? "selected" : ""%>>Onsite</option>
								<option value="Hybrid"
									<%="Hybrid".equals(j.getWorkMode()) ? "selected" : ""%>>Hybrid</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Job Type</label>
						<div class="col-sm-7">
							<select class="form-select" name="jobType" required>
								<option value="" disabled
									<%=(j.getJobType() == null) ? "selected" : ""%>>Select Job
									Type</option>
								<option value="Full-time"
									<%="Full-time".equals(j.getJobType()) ? "selected" : ""%>>Full-time</option>
								<option value="Part-time"
									<%="Part-time".equals(j.getJobType()) ? "selected" : ""%>>Part-time</option>
								<option value="Internship"
									<%="Internship".equals(j.getJobType()) ? "selected" : ""%>>Internship</option>
								<option value="Contract"
									<%="Contract".equals(j.getJobType()) ? "selected" : ""%>>Contract</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Location</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="location"
								value="<%=j.getLocation()%>" required>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Min
							Experience</label>
						<div class="col-sm-7">
							<input type="number" class="form-control" name="minExperience"
								value="<%=j.getMinExperience()%>" required>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Description</label>
						<div class="col-sm-7">
							<textarea class="form-control" name="jobDescription" rows="3"><%=j.getJobDescription()%></textarea>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Deadline</label>
						<div class="col-sm-7">
							<input type="date" class="form-control"
								value="<%=j.getDeadline()%>" name="deadline">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Vacancies</label>
						<div class="col-sm-7">
							<input type="number" class="form-control"
								value="<%=j.getTotalVacancies()%>" name="vacancies">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Status</label>
						<div class="col-sm-7">
							<select class="form-select" name="status" required>
								<option value="Open"
									<%="Open".equals(j.getStatus()) ? "selected" : ""%>>Open</option>
								<option value="Closed"
									<%="Closed".equals(j.getStatus()) ? "selected" : ""%>>Closed</option>
								<option value="On Hold"
									<%="On Hold".equals(j.getStatus()) ? "selected" : ""%>>On
									Hold</option>
							</select>
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Created By</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="createdBy"
								value="<%=j.getCreatedBy()%>">
						</div>
					</div>

					<div class="mb-3 row">
						<label class="col-sm-3 col-form-label text-end">Email</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" name="email"
								value="<%=j.getEmail()%>">
						</div>
					</div>

					<div class="mb-4 row">
						<label class="col-sm-3 col-form-label text-end">Phone</label>
						<div class="col-sm-7">
							<input type="number" class="form-control" name="phone"
								value="<%=j.getPhone()%>">
						</div>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary px-4">
							Update Job</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<%
	}
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>