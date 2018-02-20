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
	#cs.hover{
			color:orange;
	}
	#cs{
		 border-radius: 18px;
    padding: 10px; 
    width: 100px;
	}
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
    width: 100px;
    //height: 15px;    
}
</style>
<title>Add to Cart</title>
</head>
<body>
<div id="heading">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
	<c:if test="${not empty msg}">
Message:- ${msg}
</c:if>
<c:choose>
			<c:when test="${Products!=null}">
<div class="container">
    <div class="row">
    <div class="col-sm-6" ">
    		<img alt="product image" src="/AntiqueGalleryFrontEnd/${Products.imageName }" height="200px" width="200px"/>
    </div>
    <div class="col-sm-6"">
    <h4>Product Name :- ${Products.productName}</h4>
    <h4>Product Price:- ${Products.price}</h4>
    <h4>Product description:- ${Products.productDescription}</h4>
    <h4>Prduct Stock:- ${Products.stock}</h4>
     		<div>
				<form:form method="post" action="/AntiqueGalleryFrontEnd/cart/added">
					<!-- max autoset on based of qty available stock -->
					<input type="number" min="1" max="${Products.stock }" name="qty" placeholder="add qty..." class="ip1" />
					
					<input type="hidden"  name="productId" value="${Products.pid }"/>
					</br></br>
					<input type="submit" class="ip1" value="Add to Cart" name="addtocart"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="ip1" value="chekout" name="CheckOut"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/AntiqueGalleryFrontEnd/index" id="cs">Continue Shopping</a>
				</form:form>
			</div>	
      </div>
  </div>
</div>
</c:when>
		</c:choose>
    
	
	<div id="footer">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	
</body>
</html>