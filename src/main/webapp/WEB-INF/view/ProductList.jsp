<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#heading {
	position: relative;
	width: 100%;
	height: 10%;
}

#footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 10%;
	background-color: black;
	color: white;
	text-align: left;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Lis</title>
</head>
<body>
	<div id="heading">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
	<center><div>
	<form:form method="post" action="/AntiqueGalleryFrontEnd/products/admin/byCategory" modelAttribute="category">
	<form:select type="option" class="ip1" path="cid">
		<c:if test="${ not empty categories }">
			<form:option value="NONE" label="Select Category"/>
			<c:forEach var="cat" items="${ categories}">
			<c:choose>
				<c:when test="${ cat.cid == modifyProduct.category.cid}">
				<form:option value="${cat.cid }" label="${cat.cname}" selected="true"/><c:out value="${cat.cname}"></c:out></option>
				</c:when>
				<c:otherwise>
				<form:option value="${cat.cid }" label="${cat.cname}"/><c:out value="${cat.cname}"></c:out></option>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:if>
	</form:select>
	<input type="submit" value="search" name="search">
	</form:form>
	</div></center>
	<table  align="center" width="70%">
		<tr bgcolor="gray">
			<th>Product Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Supplier</th>
			<th>Product Description</th>
			<th>Stock</th>
			<th>image</th>
			<th>Action</th>
		</tr>
		<c:choose>
			<c:when test="${listProduct==null}">
				<p>no data available</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${listProduct}" var="product">
					<tr>
						<td>${product.productName}</td>
						<td>${product.price}</td>
						<td>${product.category.cname}</td>
						<td>${product.supplier.supplierName}</td>
						<td>${product.productDescription}</td>
						<td>${product.stock}</td>
						<td><img alt="img" src="/AntiqueGalleryFrontEnd/${product.imageName}" height="50px" width="50px"> </td>
						<td><form:form action="/AntiqueGalleryFrontEnd/products/admin/${product.pid}" method="post">
						<input type="submit" class="ip1" id="delete-button" value="Delete" name="deleteprod"/>
						</form:form>
						<form:form action="/AntiqueGalleryFrontEnd/products/admin/modifyview" method="post" modelAttribute="product">
						<input type="hidden" class="ip1" value="${product.pid}" name="pid"/>
						<input type="submit" class="ip1" id="edit-button" value="Update" name="saveprod"/>
						</form:form>
						</td>
					</tr>
					
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>

	<div id="footer">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>