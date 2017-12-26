<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="/WEB-INF/views/header.jsp" %>
			
	<section id="index-section" class="container middle">

		<h1 class="cdc-call">Books</h1>
		<ul class="clearfix book-collection">

			<!-- Aqui você fará a repetição -->
			<c:forEach items="${products }" var="product">
			<li><a href="${s:mvcUrl('PC#detail').arg(0, product.id).build() }" class="block clearfix">
					<h2 class="product-title">${product.title }</h2>
					<img width="143"
						height="202"
						src="https://images-na.ssl-images-amazon.com/images/I/81aua6jLqHL._AC_UL320_SR256,320_.jpg?v=1411490181"
						alt="Java 8"
						title="Java 8"/>
					<small class="buy-button">Buy it</small>
			</a></li>
			</c:forEach>
			
			<!-- Fechando aqui -->
			
		</ul>

	</section>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	
