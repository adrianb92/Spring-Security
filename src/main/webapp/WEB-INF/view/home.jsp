<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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
		<hr>
		<p>
			User: <security:authentication property="principal.username"/>
		</p>
		<p>
			Role: <security:authentication property="principal.authorities"/>
		</p>
		<hr>
		<security:authorize access="hasRole('MANAGER')">
			<p>
				<a href="${pageContext.request.contextPath}/leaders">Managers subsite</a>
			</p>
		</security:authorize>
		<security:authorize access="hasRole('ADMIN')">
			<p>
				<a href="${pageContext.request.contextPath}/systems">Admins subsite</a>
			</p>
		</security:authorize>
		
		<form:form	action="${pageContext.request.contextPath}/logout" method="POST">
			
			<input type="submit" value="logout" />
			
		</form:form>
	</body>
</html>