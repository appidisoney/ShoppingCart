<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${IndividualProduct}" var="product">
			<div class="col-xs-3 ">
				<div class="img"><a href="IndividualItem/${product.id}"></a>

<h1><c:out value="${product.name }"/></h1>
<div class="thumbnail">
<img height="300px" width="300px" alt="${product.id }"
				src="<c:url value="/resources/images/${product.id }.jpg"></c:url>">
		</div>
		<div align="right">
		<c:out value="${product.description}"/><br>
						<c:out value="${product.price }"/><br>
				</div>
				</div>
				</div>
</c:forEach>

</body>
</html>