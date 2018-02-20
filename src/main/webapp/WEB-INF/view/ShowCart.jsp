<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	.ip1 {
    border-radius: 18px;
    padding: 10px; 
    width: 200px;
    //height: 15px;    
}
</style>
<title>My Cart</title>
</head>
<body>
<div id="heading">
		<jsp:include page="Header.jsp"></jsp:include>
</div>

<div class="container">
    <div class="row">
    
    <table  align="center" width="70%">
		<tr bgcolor="gray">
			<th>Product Name</th>
			<th>Price</th>
			<th>Quentity</th>
			<th>image</th>
			<th>Action</th>
		</tr>
		<c:choose>
			<c:when test="${cartList==null}">
				<p>no data available</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${cartList}" var="cart">
					<tr>
						<td>${cart.cartProductName}</td>
						<td>${cart.cartPrice}</td>
						<td>${cart.cartQty}</td>
						
						<td><img alt="img" src="/AntiqueGalleryFrontEnd/${cart.cartImage}" height="50px" width="50px"> </td>
						<td><form:form action="/AntiqueGalleryFrontEnd/cart/remove" method="post">
						<input type="hidden"  value="${cart.cartId }" name="cartId"/>
						<input type="submit" class="ip1" id="delete-button" value="Delete" name="deleteprod"/>
						</form:form>
						</td>
					</tr>
					
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	<center><form:form action="/AntiqueGalleryFrontEnd/cart/checkout" method="get" >
						<input type="submit" class="ip1" id="edit-button" value="Checkout" name="checkout"/>
						</form:form></center>
	<center><a href="/AntiqueGalleryFrontEnd/index" id="cs">Continue Shopping</a></center>
	
    		<!--current user cart with delete  -->
    		<!--continue.. shopping  -->
    		<!--Payment process  -->
    		<!--Payment type Radio Button list  -->
    		<!--Payment  -->
  </div>
</div>

    
	
<div id="footer">
	<jsp:include page="Footer.jsp"></jsp:include>
</div>
	
</body>
</html>