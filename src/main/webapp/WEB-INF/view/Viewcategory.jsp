<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%-- <center><h1>Welcome to Your Cart</h1> --%>
${emptycart}

<div align="center">
		<div class="container">
  <table class="table">
  <table style="width:100%">
    <thead>
      <tr>
		<th> Name</th>
	<th> Description</th>
		<th>Price</th>
		<th>Image</th>
      </tr>
    </thead>
		<tbody>	
<c:forEach items="${productList }" var="product">
<tr>
<td><c:out value="${product.name }"></c:out></td>
<td><c:out value="${product.description }"></c:out></td>
<td><c:out value="${product.price }"></c:out></td>
<td><div class="thumbnail">
<img height="100px" width="100px" alt="${product.id }"
src="<c:url value="/resources/images/product/${product.id }.jpg"></c:url>">
 </div></td>
</tr>
</c:forEach>
</tbody>









<%-- <table style="width:100%">
<tr>
<th> Name</th>
<th>image</th>
<th>Price</th>
<th>Description</th>
</tr>
		<c:forEach items="${productList}" var="product">
			<tr>
			
				<td><c:out value="${product.name }"></c:out></td>
				<td><div class="thumbnail">
                 <img height="100px" width="100px" alt="${product.id }"
                      src="<c:url value="/resources/images/product/${product.id }.jpg"></c:url>">
                      <td><c:out value="${product.price }"></c:out></td>
				<td><c:out value="${product.description }"></c:out></td>
				
				
</div></td>
			</tr>
		</c:forEach>
	</table> --%>
</body>
</html>