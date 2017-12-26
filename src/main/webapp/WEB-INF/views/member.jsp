<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<script type="text/javascript"
	src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>

<!-- SubHeader =============================================== -->
<section class="parallax_window_in" data-parallax="scroll"
	data-image-src="${contextPath}resources/img/sub_header_short.jpg"
	data-natural-width="1400" data-natural-height="470">
	<div id="sub_content_in">
		<h1>Seja um membro</h1>
		<p>"Contrate um plano e tenha acesso a todos os nossos vídeos"</p>
	</div>
</section>
<!-- End section -->
<!-- End SubHeader ============================================ -->

<div class="container margin_60">
	<!-- End col -->
	<div class="col-md-4">
		<div class="theiaStickySidebar">
			<div class="box_style_2">
				<div id="price_in" onclick="PagSeguroLightbox('${checkoutCode}')">
					<sup>R$</sup>19.95 <span class="orginal_price">R$29.90</span>
				</div>
				<div id="features">
					<h4>Mensal</h4>
					<ul>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_film"></i>Acesso a todos vídeos</a></li>
						<li><br></li>
						<li><br></li>
					</ul>
				</div>
				<p>
					<small style="line-height: 10px">Choro lobortis euripidis
						cu qui, ex melius labitur conceptam eos, sumo possim sea in. Te
						platonem ullamcorper per.</small>
				</p>
				<hr>
				<a href="#" class="btn_full">Comprar</a>
			</div>
			<!-- End box_style -->

		</div>
		<!-- End theiaStickySidebar -->
	</div>
	<!-- End col -->
	<!-- End row -->
	<div class="col-md-4">
		<div class="theiaStickySidebar">
			<div class="box_style_2">
				<div id="price_in">
					99.90<sup>$</sup> <span class="orginal_price">119.90$</span>
				</div>
				<div id="features">
					<h4>Semestral</h4>
					<ul>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_film"></i>Acesso a todos vídeos</a></li>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_tablet"></i>3 Aulas com nosso personal</a></li>
						<li><br></li>
					</ul>
				</div>

				<p>
					<small style="line-height: 10px">Choro lobortis euripidis
						cu qui, ex melius labitur conceptam eos, sumo possim sea in. Te
						platonem ullamcorper per.</small>
				</p>
				<hr>
				<a href="#" class="btn_full">Comprar</a>
			</div>
		</div>
		<!-- End box_style -->

	</div>
	<!-- End theiaStickySidebar -->
	<!-- End col -->
	<div class="col-md-4">
		<div class="theiaStickySidebar">
			<div class="box_style_2">
				<div id="price_in">
					159.90<sup>$</sup> <span class="orginal_price">189.90$</span>
				</div>
				<div id="features">
					<h4>Anual</h4>
					<ul>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_film"></i>Acesso a todos vídeos</a></li>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_tablet"></i>3 Aulas com nosso personal</a></li>
						<li><a href="#0" class="tooltip-1" data-placement="right"
							title="" data-original-title="Default tooltip"><i
								class="icon_chat_alt"></i>Contato com nosso personal</a></li>
					</ul>
				</div>
				<p>
					<small style="line-height: 10px">Choro lobortis euripidis
						cu qui, ex melius labitur conceptam eos, sumo possim sea in. Te
						platonem ullamcorper per.</small>
				</p>
				<hr>
				<a href="#" class="btn_full">Comprar</a>
			</div>
		</div>
		<!-- End box_style -->

	</div>
	<!-- End theiaStickySidebar -->

</div>
<!-- End container -->


<section class="margin_60_35" id="testimonials">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>Disponível em todas plataformas</h3>
				<p class="lead">Lorem ipsum dolor sit amet, dolore deleniti
					appareat per no. In ius aliquam suavitate repudiare, pro an quidam
					inimicus, duo liber labitur repudiandae in.</p>
				<p>
				<p>Lorem ipsum dolor sit amet, dolore deleniti appareat per no.
					In ius aliquam suavitate repudiare, pro an quidam inimicus, duo
					liber labitur repudiandae in. Nec no tamquam delenit, sit equidem
					ornatus accommodare at, pro graeco debitis deterruisset no. Eam at
					veri oratio principes, sit ad vero ipsum affert.</p>
				<div id="compatib">Compativel com Android/IOS</div>
			</div>
			<div class="col-md-6">
				<img src="${contextPath}resources/img/devices.png" width="600"
					height="355" alt="" class="img-responsive">
			</div>
		</div>
		<!--  End row -->
	</div>
	<!--  End container-->
</section>
<!--  End section-->

<%@ include file="/WEB-INF/views/footer.jsp"%>