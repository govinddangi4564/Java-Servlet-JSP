<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Products</title>
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
				<h1>Add Products</h1>
				<form action="addProduct" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<input type="text" name="title" class="form-control"
							placeholder="Enter title">
					</div>
					<div class="mb-3">
						<input type="text" name="category" class="form-control"
							placeholder="Enter Category">
					</div>
					<div class="mb-3">
						<input type="text" name="brand" class="form-control"
							placeholder="Enter Brand">
					</div>
					<div class="mb-3">
						<textarea name="description" class="form-control"
							placeholder="Enter Description" rows="4"></textarea>
					</div>
					<div class="mb-3">
						<input type="number" name="rating" class="form-control"
							placeholder="Enter Rating (1-5)" min="1" max="5" required>
					</div>
					<div class="mb-3">
						<input type="number" name="price" class="form-control"
							placeholder="Enter price">
					</div>
					<div class="mb-3">
						<input type="file" name="img" class="form-control"
							placeholder="Enter file">
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