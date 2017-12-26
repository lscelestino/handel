<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- SubHeader =============================================== -->
	<section class="parallax_window_in" data-parallax="scroll" data-image-src="${contextPath}resources/img/sub_header_about.jpg" data-natural-width="1400" data-natural-height="470">
		<div id="sub_content_in">
			<h1>Sobre a academia</h1>
			<p>Nosso ambiente</p>
		</div>
	</section>
	<!-- End section -->
	<!-- End SubHeader ============================================ -->

	<div class="container_styled_1">
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-md-6">
					<h2 class="nomargin_top">Esporte Fino Treinamento e Reabilitação Funcional</h2>
					<p class="lead">O Esporte Fino Treinamento e Reabilitação Funcional é um dos mais completos espaços de treinamento 100% funcional, trabalhando de forma diferenciada e com metodologia exclusiva.</p>
					<p>Equipamentos de última geração, ambiente moderno e contemporâneo proporcionam aos seus alunos privacidade e descontração nas sessões de treinamento.</p>
					
					<p>Fitness, performance para atletas, treinamento específicos para modalidades esportivas, reprogramação postural, reabilitação e recuperação de padrões motores, desenvolvimento motor para crianças e maior autonomia para a terceira idade são os objetivos do Esporte Fino.</p>
					
					<p>Se você está a procura de um corpo mais forte, flexível, harmonioso e com menos risco de lesões, essa é a proposta do Esporte Fino.</p>
				</div>
				<div class="col-md-5 col-md-offset-1 hidden-sm hidden-xs">
					<img src="${contextPath}resources/img/academia1.jpg" alt="" class="img-responsive">
				</div>
			</div>
			<!-- End row -->
		</div>
	</div>
	<div class="container margin_60">
		<h2 class="main_title"><em></em>O Ambiente<span>Nosso Espaço</span></h2>

		<!--Team Carousel -->
		<div class="row">
			<div class="owl-carousel team-carousel">

				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia2.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>

				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia3.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>

				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia4.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>

				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia5.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia6.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia7.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia8.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia9.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia10.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia11.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia12.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>
				
				<div class="team-item">
					<div class="team-item-img">
						<img src="${contextPath}resources/img/team/academia13.jpg" alt="">
						<div class="team-item-detail">
							<div class="team-item-detail-inner">
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!--End Team Carousel-->
	</div>
	<!-- End container -->

<%@ include file="/WEB-INF/views/footer.jsp" %>