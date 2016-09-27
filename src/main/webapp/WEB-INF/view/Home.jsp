<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.carousel-inner>.item>img, 
.carousel-inner>.item>a>img {
width: 70%;
	margin: auto;
}
h1 {text-align:center;
font-style:italic;
font-size:50px;
text-decoration:underline;
color:white;}

p{
text-align:right;
}
</style>
</head>

<body background="https://awesomewallpapers.files.wordpress.com/2016/01/purple-blur.jpg">
	<h1><b>SHOPPERS STOP<img alt="logo" src="http://cartype.com/pics/65/small/ss_impala_rear_panel_63emblem.jpg" width="55" height="55"></b></h1>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    </div>
    <ul class="nav navbar-nav">
    <li class="active"><a href="Home"><p>Home<span class="glyphicon glyphicon-home"></span></p></a></li>
    <!-- -<li> <a href="Admin"><p>Admin<span class="glyphicon glyphicon-user"></span></p></a></li> -->
     <li> <a href="Cart"><p>Cart<span class="glyphicon glyphicon-shopping-cart"></span></p></a></li>
  
<sec:authorize access="isAuthenticated()">
    <li> <a href="<c:url value="/perform_logout" />">Logout</a></li>
	<li><a>Welcome<sec:authentication property="principal.username"/></a></li>
</sec:authorize>
    <sec:authorize access="!isAuthenticated()">
    <li> <a href="Registration"><p>Register<span class="glyphicon glyphicon-user"></span></p></a></li>
    <li> <a href="Login"><p>Login<span class="glyphicon glyphicon-user"></span></p></a></li>
    </sec:authorize>
    </ul>
    

<!-- <div class="col-sm-4 col-sm-offset-0">
<div id="imaginary_container">
<div class="input-group stylish-input-group">
<input type="text" class="form-control" placeholder="Search">
<span class="input-group-addon">
<button type="submit">
<span class="glyphicon glyphicon-search"></span>
</button>
</span>
</div>
</div></div>
			 -->
				<ul > 					
					<li><c:forEach items="${CategoryList}" var="category">
							<a href="view/${category.id }"><c:out value="${category.name}" />
							<span class="glyphicon glyphicon-menu-right"></span></a>
						</c:forEach></li>
				</ul></li> 
    </div></a></li></ul>
  </div>
</nav>
${registered}
<div ng-view></div>

	<script>
		var app = angular.module("myapp", [ "ngRoute" ]);
		app.config(function($routeProvider) {
			$routeProvider.when("/", {
				templateUrl : "Home"
			}).when("/login", {
				templateUrl : "login"
			}).when("/registration", {
				templateUrl : "registration"
			});
		});
	</script>
<c:choose>
		<c:when test="${UserClickedadmin}">
			<c:import url="/WEB-INF/view/Admin.jsp"></c:import>
		</c:when>
	</c:choose>
<c:choose>
		<c:when test="${UserClickedlogin}">
			<c:import url="/WEB-INF/view/Login.jsp"></c:import>
		</c:when>
	</c:choose>
<c:choose>

		<c:when test="${UserClickeduser}">
			<c:import url="/WEB-INF/view/Registration.jsp"></c:import>
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

	<c:choose>
		<c:when test="${UserClickedsupplier}">
			<c:import url="/WEB-INF/view/Supplier.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedcart}">
			<c:import url="/WEB-INF/view/Cart.jsp"></c:import>
		</c:when>
	</c:choose>
</body>

	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>
.
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="http://images.techtimes.com/data/images/full/247796/samsung-suhd-tv.jpg" 
					width="50" height="50">
				</div>

				<div class="item">
					<img src="http://i1-news.softpedia-static.com/images/news2/Watch-Microsoft-s-Ad-for-the-HP-Stream-Ultracheap-Chromebook-Killer-465141-3.jpg" alt="accessories"
						width="460" height="345">
				</div>

				<div class="item">
					<img src="https://i.ytimg.com/vi/-qzsO76k540/maxresdefault.jpg" alt="home2"
						width="460" height="345">
				</div>
				
				<div class="item">
					<img src="https://i.ytimg.com/vi/IRiFZFTZME0/maxresdefault.jpg" alt="home2"
						width="460" height="345">
				</div>
				
				<div class="item">
					<img src="https://s-media-cache-ak0.pinimg.com/564x/5d/ac/4f/5dac4f2ee8af96d9581ca79cb070afd7.jpg" alt="home2"
						width="460" height="345">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			
			 <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

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
			<!-- <input type="submit" class="btn btn-primary" value="Add To Cart" /> -->
			</form:form>
			</td>
		</div>
		</div>
		</div>
		</div>			
</tr>
</c:forEach>

<div ng-view></div>

	<script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script>
</html>











