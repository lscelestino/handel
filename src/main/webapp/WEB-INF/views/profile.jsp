<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- SubHeader =============================================== -->
<section class="parallax_window_in" data-parallax="scroll" data-image-src="${contextPath}resources/img/sub_header_about.jpg" data-natural-width="1400" data-natural-height="470">
	<div id="sub_content_in">
		<h1>Personal Trainer</h1>
		<p>Conheça o Profissional</p>
	</div>
</section>
<!-- End section -->
<!-- End SubHeader ============================================ -->
   
   <div class="container_styled_1">
       <div class="container margin_60">
         <div class="row">
         <aside class="col-md-3" id="sidebar">
         <div class="theiaStickySidebar">
           	<div class="profile">
	<p class="text-center"><img src="${contextPath}resources/img/teacher_2_small.jpg" alt="Teacher" class="img-circle styled_2"></p>
       		  <ul class="social_teacher">
                   <li><a href="#"><i class="icon-facebook"></i></a></li>
                   <li><a href="#"><i class="icon-twitter"></i></a></li>
               </ul>   
                <ul>
                    <li>Nome <strong class="pull-right">André Pavani Grecco</strong> </li>
                    <li>Email <strong class="pull-right">andré.grecco@gmail.com</strong></li>
                    <li>Telefone  <strong class="pull-right">16 3335-3737</strong></li>
               </ul>
             
		</div><!-- End box-sidebar -->
           </div>
           </aside>
         	<div class="col-md-9">
           	<div class="box_style_6">
               		<div class="indent_title_in">
                   <i class="icon_document_alt"></i>
			<h3>Perfil</h3>
			<p></p>
		</div>
           	<div class="wrapper_indent">

					<p>CREF 124.107-G/SP</p>
					
                       <p>O trabalho como treinador e personaltrainer surgiu de forma espontânea e natural na vida de André Pavani. Ainda como professor universitário na área de ciências ambientais, passou a compartilhar seu conhecimento como mountain biker e naturalista com iniciantes do ciclismo, que o procuravam para ensinar técnicas de pilotagem.

					O passa tempo rapidamente se tornou uma nova profissão e hoje atua exclusivamente como treinador de alta performance para atletas amadores e profissionais, e personaltrainer de pessoas que buscam qualidade de vida, reabilitação funcional e postural, portadores de necessidades especiais e idosos, utilizando-se do principio do reequilíbrio funcional.</p>

                       <p>Profissional formado em Educação Física, Ecologia e Mestre em Esportes de Aventura pela Universidade Estadual Paulista, tem seu trabalho focado na convergência de planejamento, observação e percepção das necessidades de seus alunos e clientes. Todos os programas de treinamento passam por uma criteriosa avaliação funcional e anamnese, detalhando estilo de vida, hábitos alimentares e condições de saúde, permitindo o desenvolvimento de um programa personalizado e sistêmico para cada um de seus alunos.</p>

					<p>Sua ampla formação acadêmica e técnica – FunctionalPatternsLevel3, FunctionalMovementScreen, Core 360, Solo Core Training, TRX, Pilates de solo e aparelhos, Jonnhy G.Spinning, permite a utilização de um ampla gama de ferramentas de treinamento, tornando-o dinâmico, desafiador e motivador a cada sessão.</p>
                    	
					<div class="row">
                       	<div class="col-md-6">
                           	<ul class="list_3">
                                   <li><strong>Educação Física</strong><p>Universidade Estadual Paulista</p></li>
                                   <li><strong>Ecologia</strong><p>Universidade Estadual Paulista</p></li>
                                   <li><strong>Mestrado em Esportes de Aventura</strong><p>Universidade Estadual Paulista</p></li>
                               </ul>
                           </div>

                       </div><!-- End row--> 
               </div><!--wrapper_indent -->
               <hr class="styled_2">
               	<div class="indent_title_in">
                   <i class="icon_archive_alt"></i>
			<h3>Aulas</h3>

		</div>
           	<div class="wrapper_indent">
                       		
                               <div class="table-responsive">
                                 <table class="table table-striped" id="trainer_courses">
                                   <thead>
                                     <tr>
                                       <th>Nome</th>
                                     </tr>
                                   </thead>
                                   <tbody>
                                     <tr>
                                       <td><a href="#">Treinamento Funcional</a></td>
                                     </tr>
                                      <tr>
                                       <td><a href="#">Pilates e Reabilitação</a></td>
                                     </tr>
                                      <tr>
                                       <td><a href="#">Liberação Miofascial e Ventosaterapia</a></td>
                                     </tr>
                                     <tr>
                                       <td><a href="#">Qualidade de vida e Performance</a></td>
                                     </tr>
                                   </tbody>
                                 </table>
                                 </div>
               </div><!--wrapper_indent -->
               </div>
           </div>
           
       </div><!--End row -->
       </div><!--End container -->
       </div>
        
<%@ include file="/WEB-INF/views/footer.jsp" %>