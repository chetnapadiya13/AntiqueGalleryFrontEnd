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
<title>Thank you</title>
</head>
<body>
<div id="heading">
		<jsp:include page="Header.jsp"></jsp:include>
</div>

<div class="container">
    <div class="row">
    <center><h1>Thanks For Shopping with us........</h1></center>
  </div>
</div>

    
	
<div id="footer">
	<jsp:include page="Footer.jsp"></jsp:include>
</div>
	
</body>
</html>