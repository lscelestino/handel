<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- SubHeader =============================================== -->
	<section class="parallax_window_in" data-parallax="scroll" data-image-src="${contextPath}resources/img/sub_header_general.jpg" data-natural-width="1400" data-natural-height="470">
		<div id="sub_content_in">
			<h1>Nossas Dicas</h1>
			<p>"Veja algumas dicas de nosso personal"</p>
		</div>
	</section>
	<!-- End section -->
	<!-- End SubHeader ============================================ -->

	<div class="container_styled_1">
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-md-9">
					<c:forEach items="${blogPosts }" var="blogPost">
						<div class="post">
							<img src="${contextPath}${blogPost.image }" alt="" class="img-responsive">
							<div class="post_info clearfix">
								<div class="post-left">
									<ul>
										<li><i class="icon-calendar-empty"></i><fmt:formatDate value="${blogPost.date.time}" pattern="dd/MM/yyyy" /> <em>por André</em>
										</li>
	
									</ul>
								</div>
							</div>
							<h2>${blogPost.title }</h2>
							<p>
								${blogPost.description }
							</p>

	
						</div>
						<!-- end post -->
					</c:forEach>

					<div class="text-center">
						<ul class="pager">
							<li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Voltar</a>
							</li>
							<li class="next"><a href="#">Avançar <span aria-hidden="true">&rarr;</span></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- End col-md-9-->

				<aside class="col-md-3" id="sidebar">

					<div class="widget">
						<h4>Postagens recentes</h4>
						<ul class="recent_post">
							<c:forEach items="${blogPosts }" var="blogPost">
								<li>
									<i class="icon-calendar-empty"></i> <fmt:formatDate value="${blogPost.date.time}" pattern="dd/MM/yyyy" />
									<div>${blogPost.title }
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- End widget -->

				</aside>
				<!-- End aside -->

			</div>
		</div>
		<!-- End container -->
	</div>
	<!-- End container_styled_1 -->

<%@ include file="/WEB-INF/views/footer.jsp" %>