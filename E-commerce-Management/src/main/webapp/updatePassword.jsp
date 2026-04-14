<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>

	<%@ include file="navbar.jsp"%>
	
	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="height: 90vh;">
			<div class="col-6 p-4 shadow">
				<h1>Update Password</h1>
				<form action="updatePasswordUsingOtp" method="post">

					<div class="mb-3">
						<input type="email" name="email" class="form-control"
							placeholder="Enter email">
					</div>
					<div class="mb-3">
						<input type="text" name="otp" class="form-control"
							placeholder="Enter otp">
					</div>
					<div class="mb-3">
						<input type="password" name="password" class="form-control"
							placeholder="Enter new Password">
					</div>



					<button type="submit" class="btn btn-primary">update
						password</button>
				</form>
				<a href="signup">signup</a>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>