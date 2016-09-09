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
<title>Product</title>
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

	<c:url var="addaction" value="editproduct"></c:url>
	<form:form action="${addaction}" modelAttribute="product1"
	enctype="mulipart/form-data" method="Post">
	
<center>ID:<form:input path="id" /><br>
Name:<form:input path="name" /><br>
Description:<form:input path="description" /><br>
Price:<form:input path="price" /><br>
<td>Category:</td>
	<td><form:select path="categoryid" requried="true">
	<c:forEach items="${categoryList}" var="category">
	<form:option class="input1" value="${category.id }">${category.name}
	</form:option>
	</c:forEach>
	</form:select>
	
	<td>Supplier:</td>
	<td><form:select path="supplierid" requried="true">
	<c:forEach items="${supplierList}" var="supplier">
	<form:option class="input1" value="${supplier.id }">${supplier.name}
	</form:option>
	</c:forEach>
	</form:select>
	</td>
  <td>Image:</td>
<td><form:input type="file"
class="btn btn-default btn-block form control" path="image"
requried="true"/></td>
<input type="submit" value="add/edit">
</center>
		</form:form>
			
		<div align="center">
		<div class="container">
  <table class="table">
  <table style="width:88%">
		<caption><center><h3>Product List</h3></center></caption>
    <thead>
      <tr>
        <th>Product Id</th>
		<th>Product Name</th>
	<th>Product Description</th>
		<th>Product Price</th>
		<th>category</th>
		<th>supplier</th>
		<th>Image</th>
		<th>Edit</th>
		<th>Delete</th>
      </tr>
    </thead>
		<tbody>	
<c:forEach items="${productList }" var="product">
<tr>
<td><c:out value="${product.id }"></c:out></td>
<td><c:out value="${product.name }"></c:out></td>
<td><c:out value="${product.description }"></c:out></td>
<td><c:out value="${product.price }"></c:out></td>
<td><c:out value="${product.categoryid}"></c:out></td>
<td><c:out value="${product.supplierid }"></c:out></td>
<td><c:out value="${product.image }"></c:out></td>

<td><a href="addeditproduct/${product.id}"><img alt="Edit" src="C:\Users\APPIDI\Desktop\images\edi.jpg"></a></td>
<td><a href="adddeleteproduct/${product.id}"><img alt="Delete" src="C:\Users\APPIDI\Desktop\images\delt.jpg"></a></td>
</tr>
</c:forEach>
</tbody>
</table>
      </table>
</div>	
</table>
</div>
</body>
</html>
		
	