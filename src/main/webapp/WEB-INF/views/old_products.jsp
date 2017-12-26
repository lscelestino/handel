<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<%@ include file="/WEB-INF/views/header.jsp"%>

<!-- SubHeader =============================================== -->
<section class="parallax_window_in" data-parallax="scroll"
	data-image-src="${contextPath}resources/img/products.jpg"
	data-natural-width="1400" data-natural-height="100">
	<div id="sub_content_in">
		<h1>Produtos</h1>
	</div>
</section>
<!-- End section -->
<!-- End SubHeader ============================================ -->

<a href="/addProduct"><div class="botao">Novo Produto</div></a>

<table class="table table-bordered table-striped table-hover">
	<tr>
		<th>Código</th>
		<th>Descrição</th>
		<th>Preço</th>
		<th>Quantidade</th>
		<th>Ações</th>
	</tr>

	<c:forEach items="${products}" var="product">
		<tr>
			<td>${product.code }</td>
			<td>${product.description }</td>
			<td>${product.price }</td>
			<td>${product.quantity }</td>
			<td><a data-toggle="tooltip"
				title="<img src='${product.imagePath}' width='180px' height='180px' />">
					<i class="fa fa-camera"></i>
			</a></td>
			<%-- 			<td><label onclick="showImage('${product.imagePath}')"><i --%>
			<!-- 					class="fa fa-camera"></i></label></td> -->
		</tr>
	</c:forEach>
</table>

<div id="divImg" style="display: none">
	<img id="img" src="" />
</div>

<script>
	$('a[data-toggle="tooltip"]').tooltip({
		animated : 'fade',
		placement : 'left',
		html : true
	});
	// 	var divImg = document.getElementById("divImg");
	// 	var img = document.getElementById("img");

	// 	function showImage(imagePath) {
	// 		divImg.style.display = "block";
	// 		img.src = imagePath;
	// 	}
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>