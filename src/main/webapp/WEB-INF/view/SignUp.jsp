<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
			   height:5%;
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
<div class="container" id="wrap" style="height:100%">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form:form action="/AntiqueGalleryFrontEnd/authSignUp"  modelAttribute="user"  method="post" accept-charset="utf-8" class="form" role="form">
					<legend>Sign Up</legend>
					<h4>It's free and always will be.</h4>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<form:input type="text" path="firstName" class="form-control input-sm" placeholder="First Name" />
						</div>
						<div class="col-xs-6 col-md-6">
							<form:input type="text" path="lastName" class="form-control input-sm" placeholder="Last Name" />
						</div>
					</div>
					<form:input type="email" class="form-control input-sm" placeholder="Your Email" path="email"/>
					<form:password path="password" name="password" class="form-control input-sm" placeholder="Password" />
					<input type="password" name="confirm_password" value="" class="form-control input-sm" placeholder ="Confirm Password" />
					<label>Birth Date</label>
					<div class="row">
						<div class="col-xs-4 col-md-4">
							<form:input type="date" path="dob" class="form-control input-sm"/>
						</div>
					</div>
					<label>Gender : </label> <label class="radio-inline"> 
					<form:radiobutton value="male" path="gender"/>
					 Male
					</label> <label class="radio-inline"> 
					<form:radiobutton value="female" path="gender" /> Female
					</label> <br /> 
					<form:textarea path="address" rows="2" cols="20"
					 value="" class="form-control input-sm" placeholder="Your Address" /></label></br>
					<span class="help-block">By clicking Create my
						account, you agree to our Terms and that you have read our Data
						Use Policy, including our Cookie Use.</span>
					<button class="btn btn-lg btn-primary btn-block signup-btn"
						type="submit">Create my account</button>
				</form:form>
			</div>
		</div>
	</div>
</div>
	<div id="footer">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>