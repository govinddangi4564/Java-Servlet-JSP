<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoviaan", "root", "Govind");
	PreparedStatement pst = con.prepareStatement("select * from imageData");
	ResultSet rs = pst.executeQuery();

	while (rs.next()) {
	%>

	<img alt="" src="Files/<%=rs.getString("name")%>"
		style="height: 150px; border-radius: 20px; margin: 10px;">

	<%
	}
	%>

</body>
</html>