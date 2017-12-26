<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- SubHeader =============================================== -->
	<!-- SubHeader =============================================== -->
	<section class="parallax_window_in" data-parallax="scroll" data-image-src="${contextPath}resources/img/sub_header_general.jpg" data-natural-width="1400" data-natural-height="470">
		<div id="sub_content_in">
			<h1>Videos</h1>
			<p>"Todos nossos vídeos"</p>
		</div>
	</section>
	<!-- End section -->
	<!-- End SubHeader ============================================ -->

	<div class="container margin_60">
		<div class="row">
			<div class="col-md-8 ">
				<hr class="add_bottom_30">

				<c:forEach items="${videos }" var="video">
				<div class="workoutlist">
					<div class="row">
						<div class="col-sm-5">
							<figure>
							<a href="${video.urlVideo }" class="video">
								<i class="arrow_triangle-right_alt2"></i>
								<img src="${video.urlImage }" width="780" height="420"  alt="Image" class="img-responsive">
							</a><span>${video.duration }</span>
							<em></em>
							</figure>
						</div>
						<div class="col-sm-7">
							<h4><a href="${video.urlVideo }" class="video">${video.title }</a></h4>
							<p>${video.description }</p>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<!-- End col -->
			<div class="col-md-4" id="sidebar">
				<div class="theiaStickySidebar">
					<div id="filters_col">
						<a data-toggle="collapse" href="#collapseFilters" aria-expanded="false" aria-controls="collapseFilters" id="filters_col_bt">Filtros </a>
						<div class="collapse" id="collapseFilters">
							<div class="filter_type">
								<h6>Tipo</h6>
								<ul>
									<li>
										<label>Todos (2)</label>
										<input type="checkbox" class="js-switch" checked>
									</li>
									<li>
										<label>Treinamento Funcional(0)</label>
										<input type="checkbox" class="js-switch">
									</li>
									<li>
										<label>Pilates e Reabilitação (2)</label>
										<input type="checkbox" class="js-switch">
									</li>
									<li>
										<label>Liberação Miofascial/Ventosaterapia (0)</label>
										<input type="checkbox" class="js-switch">
									</li>
									<li>
										<label>Qualidade de vida e Performance (0)</label>
										<input type="checkbox" class="js-switch">
									</li>
								</ul>
							</div>
						</div>
						<!--End collapse -->
					</div>
					<!--End filters col-->
				</div>
				<!--End Sticky -->
			</div>
			<!-- End col -->
		</div>
		<!-- End row -->
	</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>