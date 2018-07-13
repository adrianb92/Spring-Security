<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
		<link rel="stylesheet"
		 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	</head>
	<body>
	
	<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">
			
			<div class="panel panel-primary">

				<div class="panel-heading">
					<div class="panel-title">Register New User</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">
	
					<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
					modelAttribute="crmUser"
					class="form-horizontal">
					
						<div class="form-group">
							<div class="col-xs-15">
						      	<div>
					
									<!-- Check for registration error -->
									<c:if test="${registrationError != null}">
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${registrationError}
										</div>
									</c:if>
										
					            </div>
					        </div>
					    </div>
					    
					    <div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							<!-- User name -->
							<form:input path="userName" placeholder="username" class="form-control" />
						</div>
						
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 	
							<!-- Password -->
							<form:password path="password" placeholder="password" class="form-control" />
						</div>
										
						<button type="submit" class="btn btn-primary">Register</button>
						
					</form:form>
					
					</div>

			</div>
			
		</div>
		
	</body>
</html>