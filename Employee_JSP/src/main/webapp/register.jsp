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

	<%@ include file="navbar.jsp"%>

	<%
	String msg = (String) request.getAttribute("msg");
	%>

	<%
	if (msg != null) {
	%>
	<h1>
		<%=msg%></h1>

	<%
	}
	%>

	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="height: 90vh;">
			<div class="col-6 shadow p-4">
				<h1 class="my-4 text-center">Register</h1>

				<form action="register" method="post">
					<div class="mb-3">
						<label class="form-control">Name</label> <input type="text"
							class="form-control" name="name">
					</div>

					<div class="mb-3">
						<label class="form-control">Age</label> <input type="number"
							class="form-control" name="age">
					</div>

					<div class="mb-3">
						<label class="form-control">Salary</label> <input type="number"
							class="form-control" name="salary">
					</div>

					<div class="mb-3">
						<label class="form-control">Email</label> <input type="email"
							class="form-control" name="email">
					</div>

					<div class="mb-3">
					<label class="form-control">Department</label>
						<select class="form-select" name="department" required>
							<option value="" selected disabled>Choose Department</option>
							<option value="CS">CS</option>
							<option value="IT">IT</option>
							<option value="ME">ME</option>
							<option value="CE">CE</option>
							<option value="EE">EE</option>
							<option value="EC">EC</option>
						</select>
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