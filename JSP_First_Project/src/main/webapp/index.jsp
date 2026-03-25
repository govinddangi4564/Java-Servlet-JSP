<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!List<String> names = List.of("Govind", "Akshat", "Rizwan");%>

	<% for(String s : names){ %>
	<h1>
		<%= s %></h1>

	<%} %>
</body>
</html>