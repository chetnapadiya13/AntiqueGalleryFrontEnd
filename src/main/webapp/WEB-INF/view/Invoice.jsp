<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<h3>Your Order placed successful, Thank You for shopping with US</h3>
<br>
<br>
	<c:out value="${userdetails.firstName }"></c:out> <c:out value="${userdetails.lastName }"></c:out><br>
	<c:out value="${userdetails.address }"></c:out><br><br><br>
		<!--user detail name address total -->
		Total Item Quantity:- <c:out value="${totalQty }"></c:out>
		Grand Total:- <c:out value="${total }"></c:out>
	</div>
	<div class="btn btn-success pull-left btn-fyi"><span class="glyphicon glyphicon-chevron-left"></span> <center><a href="/AntiqueGalleryFrontEnd/index" id="cs">Continue Shopping</a></center></div>
</body>
</html>