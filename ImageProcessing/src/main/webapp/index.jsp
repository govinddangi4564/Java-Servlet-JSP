<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="img">
		<input type="submit" value="submit">
	</form>
	
	<a href="show.jsp">View Images</a>

</body>
</html>