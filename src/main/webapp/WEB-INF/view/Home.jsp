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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home Page</title>
</head>
<body> <!-- background="C:\Users\APPIDI\Desktop\images\Background.jpg"> -->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Shoppers stop</a>
    </div>
    
     <div align="right"><form class"well form-search">
      <input type="text" class "span3 search query" placeholder "search....."/>
      <button class "btn">Search</button></form>
      
        <body>
    <div class="container">
      <p><span class="glyphicon glyphicon-user"><a href="Admin"> Admin</a>
      </span></p>
     <a href="Login"> Login Here</a>
<a href="Registration"> Register Here</a></class>
    
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Clothes
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Womens Wear</a></li>
          <li><a href="#">Mens Wear</a></li>
          <li><a href="#">Kids Wear</a></li> 
        </ul>
      </li>
      
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Accessories
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      <li><a href="#">Womens Accessories</a></li>
          <li><a href="#">Mens Accessories</a></li>
          </ul>
          </li>
         <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Home Needs
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
         
      <li><a href="#">Home Applications</a></li>
      <li><a href="#">kitchen items</a></li>
          <li><a href="#">furniture</a></li>
          <li><a href="#">Bed sheets</a></li>  
    </ul>
  </div>
</nav>

<c:if test="${UserClickedRegisterHere} ==true">
<jsp:include page= "Registration.jsp"></jsp:include>
</c:if>

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

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</head>
<body background="C:\Users\APPIDI\Desktop\images\Background.jpg">

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="E:\New folder\clothes.jpg" alt="Clothes" width="460" height="345">
      </div>

      <div class="item">
        <img src="E:\New folder\accessories.jpg" alt="accessories" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="E:\New folder\home needs.jpg" alt="home nedds" width="460" height="345">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

</body>
</html>