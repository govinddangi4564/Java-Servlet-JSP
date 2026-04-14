<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>

<style>
.masonry {
	column-count: 4;
	column-gap: 20px;
}

.masonry .card {
	display: inline-block;
	width: 100%;
	margin-bottom: 20px;
}

/* Responsive */
@media ( max-width : 992px) {
	.masonry {
		column-count: 3;
	}
}

@media ( max-width : 768px) {
	.masonry {
		column-count: 2;
	}
}

@media ( max-width : 576px) {
	.masonry {
		column-count: 1;
	}
}
</style>

<body>
	<%@ include file="navbar.jsp"%>
	<h1>Hello, world!</h1>

	<div class="container">
		<div class="masonry">

			<%
			List<Products> list = (List<Products>) request.getAttribute("Products");
			for (Products p : list) {
			%>

			<div class="card shadow-sm mb-4">
				<div class="card h-100">
					<img src="files/<%=p.getImage()%>" class="card-img-top" alt="...">

					<div class="card-body">
						<h5 class="card-title"><%=p.getBrand()%></h5>

						<%
						String desc = p.getDescription();
						int len = desc.length();
						%>

						<p class="card-text">
							<span class="short-text"> <%=desc.substring(0, Math.min(100, len))%>
							</span>

							<%
							if (len > 100) {
							%>
							<span class="full-text" style="display: none;"> <%=desc.substring(100)%>
							</span>
							<%
							}
							%>
						</p>

						<%
						if (len > 100) {
						%>
						<button class="btn btn-primary read-btn">Read More</button>
						<%
						}
						%>

						<a href="details?id=<%=p.getId()%>" class="btn btn-secondary">Details</a>
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

	<script type="text/javascript">
		document.querySelectorAll(".read-btn").forEach(function(button) {
			button.addEventListener("click", function() {

				let cardBody = this.closest(".card-body");

				let shortText = cardBody.querySelector(".short-text");
				let fullText = cardBody.querySelector(".full-text");

				if (fullText.style.display === "none") {
					fullText.style.display = "inline";
					this.innerText = "Read Less";
				} else {
					fullText.style.display = "none";
					this.innerText = "Read More";
				}

			});
		});
	</script>
</body>
</html>