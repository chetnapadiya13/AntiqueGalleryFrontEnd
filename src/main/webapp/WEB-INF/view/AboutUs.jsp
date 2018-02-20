<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AboutUs</title>
<style>
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
</head>
<body>
	<div id="heading" >
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
	<center>
	<div>
		<h1>About Us</h1>
	</div></center>
	
	<div id="footer">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>