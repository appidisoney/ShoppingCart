<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix= "c" uri ="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://www.springframework.org/tags/form" prefix ="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<style>
ul {
    list-style-type: none;
    margin: 10;
    padding: 0;
    overflow: hidden;
    background-color: /* #06DEEC */;
}

li {
    float: left;
}

li a {
    display: inline-block;
    color:;
    text-align: center;
    padding: 4px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: white;
}

</style> 
</head>
<body>

<center><body background="http://www.solanoaidscoalition.org/blog/wp-content/uploads/2014/11/Paper-Grunge-Background-11.jpg">
   <h1><b>SHOPPERS STOP<img alt="logo" src="http://cartype.com/pics/65/small/ss_impala_rear_panel_63emblem.jpg" width="55" height="55"></b></h1>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    
    <ul class="nav navbar-nav">
    <li class=""><a href="Home"><p>Home<span class="glyphicon glyphicon-home"></span></p></a></li> 
 <!--    <sec:authorize access="!isAuthenticated()"> -->
    <li> <a href="Registration"><p>Register<span class="glyphicon glyphicon-user"></span></p></a></li>
    <li> <a href="Login"><p>Login<span class="glyphicon glyphicon-user"></span></p></a></li>
   <!--  </sec:authorize> -->
    
</nav>

    <ul > 			
					<li><c:forEach items="${CategoryList}" var="category">
							<a href="view/${category.id }"><c:out value="${category.name}" />
							<span class="glyphicon glyphicon-menu-right"></span></a>
						</c:forEach></li>
				</ul>
      
    
 <center><h2> Welcome to Shopping cart</h2></center> 
${message}<br>

<hr color="">

 <div >
    <ul>
      <li><a href="Supplier">Supplier</a></li>
      <li><a href="Product">Product</a></li>
      <li><a href="Category">Category</a></li>
      <li><a href="perform_logout">Logout</a></li>
    </ul>
  </div>
  ${msg}
${msg1 }

<script>
var app = angular.module("myapp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
       
    .when("/Supplier",{
    	templateUrl : "Supplier"
    })
     .when("/Category",{
    	templateUrl : "Category"
    })
    .when("/Product", {
        templateUrl : "Product"
    });
});
</script>

 <c:choose>
<c:when test="${UserClickedsupplier}">
<c:import url="/WEB-INF/view/Supplier.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${UserClickedcategory}">
<c:import url="/WEB-INF/view/Category.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${UserClickedproduct}">
<c:import url="/WEB-INF/view/Product.jsp"></c:import>
</c:when>
</c:choose>

</body>
</html>