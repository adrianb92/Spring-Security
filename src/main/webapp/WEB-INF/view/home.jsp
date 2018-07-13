<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Company Home Page</title>
	</head>
	<body>
		<h2>Company Home Page</h2>
		<hr>
		<p>Welcome to the Company Home Page</p>
		
		<form:form	action="${pageContext.request.contextPath}/logout" method="POST">
			
			<input type="submit" value="logout" />
			
		</form:form>
	</body>
</html>