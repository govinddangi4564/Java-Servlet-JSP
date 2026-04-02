<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
	font-family: Arial;
}

.sidebar {
	width: 230px;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: #f8f9fa;
	padding: 15px;
	border-right: 1px solid #ddd;
}

.sidebar a {
	text-decoration: none;
	color: #333;
	display: block;
	padding: 15px;
	border-radius: 6px;
	margin-bottom: 4px;
}

.sidebar a:hover {
	background-color: #e9ecef;
	color: orange;
}

.sidebar small {
	margin-left: 10px;
	color: grey;
}

.topbar {
	margin-left: 250px;
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 20px;
	border-bottom: 1px solid #ddd;
	background: #fff;
}

.topbar input {
	border: none;
	outline: none;
}

.topbar-right {
	display: flex;
	align-items: center;
	gap: 15px;
}

.icon-btn {
	border: none;
	background: #f1f1f1;
	padding: 8px;
	border-radius: 50%;
}

.notification {
	position: relative;
}

.notification span {
	position: absolute;
	top: 0;
	right: 0;
	background: red;
	color: #fff;
	border-radius: 50%;
	font-size: 10px;
	padding: 2px 5px;
}

.profile {
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

.main-content {
	margin-left: 250px;
	padding: 20px;
}
</style>

</head>

<body>

	<div class="sidebar">
		<h4 class="text-center mb-4">Infoviaan</h4>

		<a href="index.jsp"><i class="fas fa-tachometer-alt"></i>
			Dashboard</a> <a href="#"><i class="fas fa-inbox"></i> Inbox</a> <a
			href="#"><i class="fas fa-calendar-alt"></i> Calendar & Todos</a> <small>RECRUITMENT</small>
		<a href="viewJobs"><i class="fas fa-briefcase"></i> Jobs</a> <a
			href="getCandidate"><i class="fas fa-users"></i> Candidates</a> <a
			href="#"><i class="fas fa-user-plus"></i> My Referrals</a> <a
			href="#"><i class="fas fa-globe"></i> Career Site</a> <small>ORGANIZATION</small>
		<a href="#"><i class="fas fa-sitemap"></i> Structure</a> <a href="viewReports.jsp"><i
			class="fas fa-chart-bar"></i> Report</a> <a href="#"><i
			class="fas fa-cog"></i> Settings</a>
	</div>

	<div class="topbar">
		<form action="searchCandidate" method="get">
			<i class="fas fa-search"></i> <input type="text" name="search"
				placeholder="Search...">
		</form>

		<div class="topbar-right">
			<button class="icon-btn">
				<i class="fas fa-cog"></i>
			</button>

			<div class="notification">
				<button class="icon-btn">
					<i class="fas fa-bell"></i>
				</button>
				<span>0</span>
			</div>

			<img src="employee.jpg" class="profile">
		</div>
	</div>

</body>
</html>