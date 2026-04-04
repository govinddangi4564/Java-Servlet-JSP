<%@page import="com.Employee.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

</head>

<body>

	<%@ include file="sidebar.jsp"%>

	<div class="main-content d-flex justify-content-center"
		style="min-height: 100vh; background: #f5f7fa; padding-top: 40px;">

		<div style="width: 450px;">

			<a href="employeesReport" class="btn mb-3"
				style="background: #fff; border-radius: 10px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); font-size: 16px;">
				<i class="bi bi-arrow-left"></i> Back
			</a>

			<%
			Employee e = (Employee) request.getAttribute("viewEmployee");
			if (e != null) {
			%>

			<div class="card shadow-lg border-0 p-4" style="border-radius: 20px;">

				<div class="text-center mb-4">
					<img src="Files/<%=e.getProfile()%>" class="rounded-circle shadow"
						style="height: 110px; width: 110px; object-fit: cover; border: 4px solid #fff;">

					<h3 class="fw-bold mt-3 mb-1" style="font-size: 26px;">
						<%=e.getName()%>
					</h3>

					<p class="text-muted" style="font-size: 18px;">
						<%=e.getRole()%>
					</p>

					<span class="badge px-3 py-2"
						style="font-size:14px;
                    <%="active".equals(e.getStatus()) ? "background:#28a745;" : "background:#dc3545;"%>">
						● <%=e.getStatus().equals("active") ? "Active" : "Inactive"%>
					</span>
				</div>

				<div class="p-3 mb-3 rounded" style="background: #f1f3f6;">
					<div class="d-flex justify-content-between">
						<div>
							<small class="text-muted">Department</small>
							<p class="fw-semibold mb-0" style="font-size: 18px;">
								<%=e.getDepartment()%>
							</p>
						</div>

						<div class="text-end">
							<small class="text-muted">Hire Date</small>
							<p class="fw-semibold mb-0" style="font-size: 18px;">
								<%=e.getHire_date()%>
							</p>
						</div>
					</div>
				</div>

				<div class="p-3 rounded" style="background: #f9fafc;">
					<div class="d-flex align-items-center mb-3">
						<i class="bi bi-envelope-fill me-3"
							style="font-size: 20px; color: #0d6efd;"></i> <span
							style="font-size: 17px;"><%=e.getEmail()%></span>
					</div>

					<div class="d-flex align-items-center">
						<i class="bi bi-telephone-fill me-3"
							style="font-size: 20px; color: #0d6efd;"></i> <span
							style="font-size: 17px;">(+91) <%=e.getPhone()%></span>
					</div>
				</div>

			</div>

			<%
			}
			%>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>