<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<style>
p {
	border: 1px solid powderblue;
	margin:
}
</style>
</head>

<body style="padding-top:">
	<div class="container">
        <section id="content">
			<c:url var="addAction" value="adduser"></c:url>
			<form:form action="${addAction}" commandName="userDetails" method="post">
				
				<h1 align="center">Register</h1>
               <div align="center">

             <table>
				<div>
				<tr>
			    <td><label for="username">Name:</label></td>
					<td><p><form:input path="username" type="text" placeholder="Username"
					pattern=".{5,10}" required="true" id="username" name="username"
					title="minimum length for username is 5" />
					</p></td></tr>
				</div>
            
				<div>
				<tr>
			    <td><label for="password">Password:</label></td>
					<td><p><form:input path="password" type="password" placeholder="Password"
					 pattern=".{3,8}" required="true" id="password" name="password" 
						title="minimum length for passsword is 3" />
						</p></td></tr>
				</div>
				
				<div>
				<tr>
			    <td><label for="email">Email:</label></td>
					<td><p><form:input path="email" type="email" placeholder="Email"
						required="true" id="username" name="username" />
						</p></td></tr>
				</div>
				
				<div>
				<tr>
			    <td><label for="contact">Contact:</label></td>
					<td><p><form:input path="contact" type="text" placeholder="Contact"
						pattern="^[789]\d{9}$" required="true" id="username"
						name="username" title="Enter valid mobile number" />
						</p></td></tr>
				</div> 
				
				<div>
				<tr>
			    <td><label for="address">Address:</label></td>
					<td><p><form:input path="address" type="text" placeholder="Address"
						pattern=".{5,10}" required="true" id="username"
						name="username" title="minimum length of address is 5" />
						</p></td></tr>
				</div> 
				</table>
				<div>
					<input type="submit" value="Register" /><a href="Login">Sign In</a>
				</div>

			</form:form>
		
		</section>
		</div>
</body>
</html>










