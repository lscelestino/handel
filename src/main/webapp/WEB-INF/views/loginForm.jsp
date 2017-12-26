<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Re:Balancing</title>

<c:url value="/resources/css" var="cssPath"/>
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">
</head>
<body>


	<div class="container">
	
	<h1>Login Admin</h1>
	

	<form:form servletRelativeAction="/login" method="post">
        <div class="form-group">
            <label>Username</label> 
            <input name="username" type="text" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input name="password" type="password" class="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form:form>
    
    </div>
</body>
</html>