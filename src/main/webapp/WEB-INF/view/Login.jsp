<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Here</title>
 
 <style>
p{
border : 1px solid powderblue;
margin : 
}
</style>
 
</head>
 <body style="padding-top:">
	<div class="container">
		<section id="content">
			<form action="perform_login" method="post">
			<h1 align="center">Login</h1>
               <div align="center">

             <table>
				<div>
				<tr>
			    <td><label for="username">Name:</label></td>
					<td><p><input type="text" placeholder="Username" required id="username" name="username" 
						pattern=".{3,10}" title="minimum length for name is 3"/></p></td>
						</tr>
				</div>
				
				<div>
				<tr>
				<td><label for="password">Password:</label></td>
					<td><p><input type="password" placeholder="Password" required id="password" name="password" 
					pattern=".{3,10}" title="Enter valied credentials"/></p></td>
					</tr>
				</div>
				</table>
				<div>
				    <input type="submit" value="Login" />  <a href="Registration">Register</a>
				</div>
				
			</form>
			
			
		</section>
		
	</div>
 
 
<c:forEach items="${productList}" var="product"><tr>
<div class="responsive">
	 <div class="img">
						<!-- --<div class="thumbnail">-->
							  <div class="col-md-4">
							<a href="ShowProduct/${product.id}"> 
     					<img height="150px" width="150px" alt="${product.id }"
     					src="<c:url value="/resources/images/product/${product.id }.jpg"></c:url>"></a>
     					<div class="desc">
     					<c:url var="action" value="addtocart/${product.id}"></c:url>
			<form:form action="${action}" modelAttribute="cart">
			<td id="td1"><c:out value="${product.name}" />
			<td id="td1"><c:out value="${product.price}" />
			<input type="submit" class="btn btn-primary" value="Add To Cart" />
			</form:form>
			</td>
		</div>
		</div>
		</div>
		</div>			
</tr>
</c:forEach>
 
 
</body>
</html>