<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>
<style>
table {
font-family:arial, sans-serif;
border-collapse:collapse;
width:100%;
}
td,tr,th {
border:2px solid #dddddd;
text-align: center;
padding: 8px;
}
</style>
</head>

<body>
<script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
    $http.get("welcome.htm").then(function (response) {
        $scope.myWelcome = response.data;
    });
});
</script>

	<c:url var="addaction" value="editsupplier"></c:url>
	<form:form action="${addaction}" modelAttribute="supplier1">
<center>ID:<form:input path="id" /><br>
Name:<form:input path="name" /><br>
Address:<form:input path="address" /><br>
<input type="submit" value="add/edit"></center>
		</form:form>
		
		<div align="center">
		<div class="container">
        <table class="table">
		<table style="width:88%">
		<caption><h3> <center>Supplier List</center></h3></caption>
		<thead>
		<tr>
		<th>Supplier Id</th>
		<th>Supplier Name</th>
		<th>Supplier Address</th>
		<th>Edit</th>
		<th>Delete</th>
		</tr>
		</thead>
		<tbody>	
<c:forEach items="${supplierList }" var="supplier">
<tr>
<td><c:out value="${supplier.id }"></c:out>
<td><c:out value="${supplier.name }"></c:out>
<td><c:out value="${supplier.address }"></c:out>
<td><a href="addeditsupplier/${supplier.id}"><img alt="Edit" src="C:\Users\APPIDI\Desktop\images\edi.jpg"></a>
<td><a href="adddeletesupplier/${supplier.id}"><img alt="Delete" src="C:\Users\APPIDI\Desktop\images\delt.jpg"></a>
</tr>
</c:forEach>
</tbody>
</table>
</table>
</div>
</div>
</body>
</html>