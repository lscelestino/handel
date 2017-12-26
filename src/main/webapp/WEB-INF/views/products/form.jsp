<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Mushopl</title>

<c:url value="/resources/css" var="cssPath"/>
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">
</head>
<body>

	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build() }">Mushop</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="${s:mvcUrl('PC#list').build() }">Products List</a></li>
	        <li><a href="${s:mvcUrl('PC#form').build() }">Register Product</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a href="#">
		        <security:authentication property="principal" var="user"/>
		        User: ${user.username}
		    </a></li>
		    <li><a href="/logout">
		        Logout
		    </a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>

	<div class="container">
	
	<h1>Register Product</h1>
	

	<form:form action="/products" method="post" 
		commandName="product" enctype="multipart/form-data">
        <div class="form-group">
            <label>Title</label> 
            <form:input path="title" cssClass="form-control"/>
            <form:errors path="title" />
        </div>
        <div class="form-group">
            <label>Description</label>
            <form:textarea path="description" cssClass="form-control"/>
            <form:errors path="description" />
        </div>

        <div class="form-group">
            <label>Pages</label> 
            <form:input path="pages" cssClass="form-control"/>
            <form:errors path="pages" />
        </div>
       

        <c:forEach items="${types}" var="typePrice" varStatus="status">
            <div class="form-group">
                <label>${typePrice}</label>
                <form:input path="prices[${status.index}].value" cssClass="form-control"/>
                <form:hidden path="prices[${status.index}].type" value="${typePrice}"/>
            </div>
        </c:forEach>
        
        <button type="submit" class="btn btn-primary">Register</button>
    </form:form>
    
    </div>
</body>
</html>