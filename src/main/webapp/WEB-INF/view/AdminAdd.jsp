<%@ page language="java" contentType="text/html;charset=ISO-8859-1" import="com.Model.*" pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Oswald:700|Patua+One|Roboto+Condensed:700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Admin Add</title>
<style>
body {font-family: Arial;}
.ip1 {
    border-radius: 18px;
    padding: 10px; 
    width: 200px;
    //height: 15px;    
}
/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}


/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
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
</style>
</head>

<c:choose>
	<c:when test="${not empty event}">
		<body onload="openPages(event, '${event}')">	
	</c:when>
	<c:otherwise>
		<body>
	</c:otherwise>
</c:choose>

<div id="heading" >
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
<h4>Welcome Admin Add Data Here </h4>
<div class="tab">
  <button class="tablinks" onclick="openPages(event, 'Category')">Category</button>
  <button class="tablinks" onclick="openPages(event, 'Supplier')">Supplier</button>
  <button class="tablinks" onclick="openPages(event, 'Product')">Product</button>
</div>
<c:if test="${not empty msg}">
Message:- ${msg}
</c:if>
<div id="Category" class="tabcontent">
  <h3>Category</h3>
	<div>
		<form:form method="post" modelAttribute="category" action="/AntiqueGalleryFrontEnd/AdminAdd/saveCategory">
			<form:input type="text" class="ip1" path="cid" placeholder="insert category Id here"/><br><br>
			<form:input type="text" class="ip1" path="cname" placeholder="insert category name here"/><br><br>
			<input type="submit" class="ip1" value="save" name="save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="ip1" value="cancel" name="cancel"/>
		</form:form>
	</div>
</div>

<div id="Supplier" class="tabcontent">
  <h3>Supplier</h3>
	<div>
		<form:form method="post" modelAttribute="supplier" action="/AntiqueGalleryFrontEnd/AdminAdd/saveSuppliper">
			<form:input type="text" class="ip1" path="sid" placeholder="insert Supplier Id here"/><br><br>
			<form:input type="text" class="ip1" path="supplierName" placeholder="insert Supplier name here"/></br></br>
			<input type="submit" class="ip1" value="save" name="save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="ip1" value="cancel" name="cancel"/>
		</form:form>
	</div>
</div>

<div id="Product" class="tabcontent">
  <h3>Product</h3>
	<div>
	
	<c:choose>
	<c:when test="${not empty modifyProduct}">
			
			<form:form method="post" modelAttribute="product" action="/AntiqueGalleryFrontEnd/products/admin/updateproduct" enctype="multipart/form-data">
			<form:input type="text" class="ip1" path="productName" value="${ modifyProduct.productName}"/><br>
			<form:input type="hidden" class="ip1" path="pid" value="${ modifyProduct.pid}"/>
			<form:input type="number" class="ip1" path="price" value="${ modifyProduct.price}"/></br>
			<form:input type="number" class="ip1" path="stock" value="${ modifyProduct.stock}"/></br>
			<form:input type="text" class="ip1" path="productDescription" value="${ modifyProduct.productDescription}"/></br>	
			 <form:select type="option" class="ip1" path="category">
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
			 <form:select type="option" class="ip1" path="supplier">
				<c:if test="${ not empty suppliers }">
					<form:option value="NONE" label="Select Supplier"/>
					<c:forEach var="supplier" items="${ suppliers}">
						
						<c:choose>
						<c:when test="${ supplier.sid == modifyProduct.supplier.sid}">
						<form:option value="${supplier.sid}" label="${supplier.supplierName}" selected="true"/><c:out value="${supplier.supplierName}"></c:out></option>
						</c:when>
						<c:otherwise>
						<form:option value="${supplier.sid}" label="${supplier.supplierName}"/><c:out value="${supplier.supplierName}"></c:out></option>
						</c:otherwise>
					</c:choose>
						
						
						
					</c:forEach>
				</c:if>
			</form:select>
			<form:input type="file" class="ip1" path="pimage"></form:input> 
			<input type="text" name="image" value="${ modifyProduct.imageName}" disabled="disabled">
			<input type="submit" class="ip1" value="modify" name="save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="ip1" value="cancel" name="cancel"/>

		</form:form>
			
	</c:when>
	<c:otherwise>
		
		
		<form:form method="post" modelAttribute="product" action="/AntiqueGalleryFrontEnd/AdminAdd/saveProduct" enctype="multipart/form-data">
			<form:input type="text" class="ip1" path="productName" placeholder="insert Product Name here"/><br>
			<form:input type="number" class="ip1" path="price" placeholder="insert Product Price in INR"/></br>
			<form:input type="number" class="ip1" path="stock" placeholder="insert Product inventory"/></br>
			<form:input type="text" class="ip1" path="productDescription" placeholder="insert Product description here"/></br>	
			 <form:select type="option" class="ip1" path="category">
				<c:if test="${ not empty categories }">
					<form:option value="NONE" label="Select Category"/>
					<c:forEach var="cat" items="${ categories}">
						<form:option value="${cat.cid }" label="${cat.cname}"/><c:out value="${cat.cname}"></c:out></option>
					</c:forEach>
				</c:if>
				<c:if test="${ empty catList }">						
						<form:option value="none" label="Category not found."/>
				</c:if>
			</form:select>
			 <form:select type="option" class="ip1" path="supplier">
				<c:if test="${ not empty suppliers }">
					<form:option value="NONE" label="Select Supplier"/>
					<c:forEach var="supplier" items="${ suppliers}">
						<form:option value="${supplier.sid}" label="${supplier.supplierName}"/><c:out value="${supplier.supplierName}"></c:out></option>
					</c:forEach>
				</c:if>
				<c:if test="${ empty supplierList }">						
						<form:option value="node" label="Supplier not found."/>
				</c:if>
			</form:select>
			<form:input type="file" class="ip1" path="pimage"></form:input> 
			
			<input type="submit" class="ip1" value="save" name="save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="ip1" value="cancel" name="cancel"/>

		</form:form>
		
		
	</c:otherwise>
</c:choose>
	
		
	</div>
</div>


<script>
function openPages(evt, tabname) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabname).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>

	<%-- <div id="footer">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div> --%>
</body>
</html>