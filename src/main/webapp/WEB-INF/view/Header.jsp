<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Menu</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery library -->

<style>
</style>
</head>
<body>
	<!--  
	<nav id="navbar-red" class="navbar navbar-inverse navbar-static-top"
		role="navigation">
	<div class="container">
		<ul class="nav navbar-nav">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-demo-navbar-collapse-1">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>-->
	<!--  	<span class="icon-bar"></span>-->

	</button>

	</ul>
	</div>
	<!--  <div class="collapse navbar-collapse" id="bs-demo-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="/AntiqueGalleryFrontEnd/index"><i
					class="fa fa-home"></i></a></li>
			<li><a href="/AntiqueGalleryFrontEnd/authLogin"><i
					class="fa fa-sign-in"></i></a></li>
			<li><a href="/AntiqueGalleryFrontEnd/authSignUp"><i
					class="fa fa-user-plus"></i></a></li>
			<li><a href="/AntiqueGalleryFrontEnd/AdminAdd">Add Data</a></li>
			<li><a href="/AntiqueGalleryFrontEnd/products/admin">ViewProducts</a></li>
			<li><a href="#"><i class="class="fafa-sign-out""></i></a></li>
			<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
			<li>
				  <div class="dropdown">
					<button class="dropbtn">Categories<span class="caret"></button>
					<div class="dropdown-content">
						<c:if test="${ not empty catList }">
							<li><a
								href="/AntiqueGalleryFrontEnd/products/byCategory/ALL">ALL</a></li>
							<c:forEach var="cat" items="${catList}">
								<li><a
									href="/AntiqueGalleryFrontEnd/products/byCategory/${cat.cid }"><c:out
											value="${cat.cname}"></c:out></a></li>
							</c:forEach>
						</c:if>
					</div>
				</div> 
				
			</li>
	
				</ul > 
				<c:if test="${pageContext.request.userPrincipal.name != null}">
		<c:out value="${SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString()}"></c:out>
		<h5 style="color:white;" align="right">
			Welcome : ${pageContext.request.userPrincipal.name} | 
			 <a href="<c:url value="/logout" />">Logout</a>
		
		</h5>
		
	</c:if>
		
	</div>-->
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/AntiqueGalleryFrontEnd/index">AntiqueGallery</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/AntiqueGalleryFrontEnd/index">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
				<ul class="dropdown-menu" style="z-index: 10;">
					<c:if test="${ not empty catList }">
						<li><a href="/AntiqueGalleryFrontEnd/products/byCategory/ALL">ALL</a></li>
						<c:forEach var="cat" items="${catList}">
							<li><a
								href="/AntiqueGalleryFrontEnd/products/byCategory/${cat.cid }"><c:out
										value="${cat.cname}"></c:out></a></li>
						</c:forEach>
					</c:if>
				</ul></li>
				<%-- <sec:authorize access="hasAuthority('ROLE_ADMIN')"> --%>
			<li><a href="/AntiqueGalleryFrontEnd/AdminAdd">Add Data</a></li>
			<li><a href="/AntiqueGalleryFrontEnd/products/admin">View
					Product</a></li>
					<li><a href="/AntiqueGalleryFrontEnd/cart/show"><i class="fa fa-shopping-cart"></i></a></li>
					<%-- </sec:authorize> --%>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/AntiqueGalleryFrontEnd/authSignUp"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="/AntiqueGalleryFrontEnd/LogIn"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</ul>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:out
				value="${SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString()}"></c:out>
			<h5 style="color: white;" align="center">
				Welcome : ${pageContext.request.userPrincipal.name} | <a
					href="<c:url value="/logout" />">Logout</a>

			</h5>

		</c:if>
	</div>
	</nav>
</body>
</html>