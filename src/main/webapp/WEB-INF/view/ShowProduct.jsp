<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	#heading{
			  position:relative;
			 width: 100%;
  			 height:10%; 
		}
	#footer{
			   position: fixed;
			   left: 0;
			   bottom: 0;
			   width: 100%;
			   height:10%;
			   background-color: black;
			   color: white;
			   text-align:left;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Do shopping</title>
</head>
<body>
<div id="heading">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
	
	<table  align="center" width="70%">
		<tr bgcolor="gray">
			<th>Product Name</th>
			<th>Price</th>
			<th>Category</th>
			<th>Supplier</th>
			<th>Stock</th>
			<th>image</th>
			<th>View Detail</th>
		</tr>
		<c:choose>
			<c:when test="${Products==null}">
				<p>no data available</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${Products}" var="product">
					<tr>
						<td>${product.productName}</td>
						<td>${product.price}</td>
						<td>${product.category.cname}</td>
						<td>${product.supplier.supplierName}</td>
						<td>${product.stock}</td>
						<td><img alt="img" src="/AntiqueGalleryFrontEnd/${product.imageName}" height="50px" width="50px"> </td>
							<td><a href="/AntiqueGalleryFrontEnd/products/details/${product.pid }">Detail</a></td>
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