<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create jobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="height: 90vh;">
			<div class="col-6 shadow p-4">
				<h1 class="my-4 text-center">Add Candidate</h1>

				<form action="createJob" method="post">

					<div class="mb-3">
						<input type="text" class="form-control" name="jobTitle"
							placeholder="Job Title">
					</div>

					<div class="mb-3">
						<select class="form-select" name="role" required>
							<option value="" selected disabled>Select Role</option>

							<option value="Software Engineer">Software Engineer</option>
							<option value="Frontend Developer">Frontend Developer</option>
							<option value="Backend Developer">Backend Developer</option>
							<option value="Project Manager">Project Manager</option>
							<option value="HR Manager">HR Manager</option>
							<option value="Sales Executive">Sales Executive</option>

						</select>
					</div>

					<div class="mb-3">
						<input type="text" class="form-control" name="location"
							placeholder="Job Location">
					</div>

					<div class="mb-3">
						<select class="form-select" name="workMode" required>
							<option value="" selected disabled>Select Work Mode</option>

							<option value="Remote">Remote</option>
							<option value="Onsite">Onsite</option>
							<option value="Hybrid">Hybrid</option>

						</select>
					</div>

					<div class="mb-3">
						<select class="form-select" name="jobType" required>
							<option value="" selected disabled>Select Work Mode</option>

							<option value="Full-time">Full-time</option>
							<option value="Part-time">Part-time</option>
							<option value="Internship">Internship</option>
							<option value="Contract">Contract</option>

						</select>
					</div>

					<div class="mb-3">
						<input type="number" class="form-control" name="minExperience"
							placeholder="Minmum Experience (in years)">
					</div>

					<div class="mb-3">
						<input type="text" class="form-control" name="jobDescription"
							placeholder="Job Description">
					</div>

					<div class="mb-3 d-flex align-items-center gap-3">
						<label for="deadline" class="form-label mb-0">Deadline: </label> <input
							type="date" class="form-control" name="deadline">
					</div>

					<div class="mb-3">
						<input type="number" class="form-control" name="vacancies"
							placeholder="Total Vacancies">
					</div>

					<div class="mb-3">
						<input type="text" class="form-control" name="createdBy"
							placeholder="Created by">
					</div>

					<div class="mb-3">
						<input type="email" class="form-control" name="email"
							placeholder="Email">
					</div>

					<div class="mb-3">
						<input type="number" class="form-control" name="phone"
							placeholder="Number">
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