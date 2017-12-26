<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Handel - Automação Comercial">

<title>Handel - Automação Comercial</title>

<c:url value="/" var="contextPath" />


<!-- Favicons-->
<link rel="shortcut icon" href="${contextPath}resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" type="image/x-icon"
	href="${contextPath}resources/img/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
	href="${contextPath}resources/img/apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
	href="${contextPath}resources/img/apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
	href="${contextPath}resources/img/apple-touch-icon-144x144-precomposed.png">

<link href="${contextPath}resources/css/base.css" rel="stylesheet">

<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath }/product.css">
<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">
<link rel="stylesheet" href="${cssPath }/add-product.css">
<link rel="stylesheet" href="${cssPath }/list-product.css">
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath }/font-awesome.min.css">
<link rel="stylesheet" href="${cssPath }/jquery.dataTables.min.css">

<script src="${contextPath}resources/js/jquery-2.2.4.min.js"></script>
<script src="${contextPath}resources/js/modernizr.js"></script>
<script src="${contextPath}resources/js/bootstrap.min.js"></script>
<script src="${contextPath}resources/js/jquery.dataTables.min.js"></script>

</head>

<body>

	<!--[if lte IE 8]>
        <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a>.</p>
    <![endif]-->

	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->

	<!-- Header ================================================== -->
	<header>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-3">
					<a href="/" id="logo"> <img
						src="${contextPath}resources/img/logo.png" width="95" height="27"
						alt="" data-retina="true" class="logo_normal"> <img
						src="${contextPath}resources/img/logo.png" width="95" height="27"
						alt="" data-retina="true" class="logo_sticky">
					</a>
				</div>
				<nav class="col-xs-9">
					<a class="cmn-toggle-switch cmn-toggle-switch__htx open_close"
						href="javascript:void(0);"><span>Menu mobile</span></a>
					<div class="main-menu">
						<div id="header_menu">
							<img src="${contextPath}resources/img/logo2.png" width="95"
								height="27" alt="Re:Balancing" data-retina="true">
						</div>
						<a href="#" class="open_close" id="close_in"><i
							class="icon_close"></i></a>
						<ul>
							<li><a href="/sales">PDV</a></li>
							<li><a href="/products">Produtos</a></li>
							<li><a href="/teste">Teste</a></li>

						</ul>
					</div>
					<!-- End main-menu -->
				</nav>
			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</header>
	<!-- End Header =============================================== -->