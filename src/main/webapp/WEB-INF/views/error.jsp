<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Handel - Automação Comercial</title>
<c:url value="/" var="contextPath" />
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath }/jquery.dataTables.min.css">
<link rel="stylesheet" href="${cssPath }/font-awesome.min.css">
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath }/mgm-menu.css">
<link rel="stylesheet" href="${cssPath }/add-product.css">
<link rel="stylesheet" href="${cssPath }/jBox.css">
<link rel="stylesheet" href="${cssPath }/jBox.Image.css">
<script src="${contextPath}resources/js/jquery-2.2.4.min.js"></script>
<script src="${contextPath}resources/js/bootstrap.min.js"></script>
<script src="${contextPath}resources/js/jBox.min.js"></script>
<script src="${contextPath}resources/js/jBox.Image.min.js"></script>


</head>
<body>
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<div class="page-content">
		<i class="fa fa-exclamation-triangle red" aria-hidden="true"></i><b class="errorFont">Tente novamente!</b>

	</div>
</body>
</html>


