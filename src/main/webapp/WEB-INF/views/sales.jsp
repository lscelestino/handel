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
<link rel="stylesheet" href="${cssPath }/list-product.css">
<link rel="stylesheet" href="${cssPath }/mgm-menu.css">
<script src="${contextPath}resources/js/jquery-2.2.4.min.js"></script>
<script src="${contextPath}resources/js/bootstrap.min.js"></script>
<script src="${contextPath}resources/js/jquery.dataTables.min.js"></script>


</head>
<body>

	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<div class="page-content">
		<table id="salesGrid" class="display">
			<thead>
				<tr>
					<th>Ticket</th>
					<th>Data</th>
					<th>Valor Total</th>
					<th>Método de pagamento</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sales}" var="sale">
					<tr>
						<td>${sale.id}</td>
						<fmt:setLocale value="pt_BR" scope="session" />
						<fmt:formatDate type="both" timeStyle="short"
							value='${sale.startDate}' var="formattedDate" />
						<td>${formattedDate}</td>

						<fmt:formatNumber type='currency' value='${sale.totalAmount}'
							var="formattedTotalAmount" />
						<td>${formattedTotalAmount}</td>

						<td><i
									class="${sale.paymentMethodClass}"></i></td>
						<td><div class="action-buttons">
								<a href="/editProduct?code=${sale.id }"><i
									class="fa fa-eye orange"></i></a>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$('#salesGrid')
										.DataTable(
												{
													"language" : {
														"lengthMenu" : "Exibir _MENU_ registros por página",
														"zeroRecords" : "Nenhum registro encontrado",
														"info" : "Página _PAGE_ de _PAGES_",
														"infoEmpty" : "Nenhum registro disponível",
														"infoFiltered" : "(Filtrado a partir de _MAX_ registros)",
														"search" : "Buscar"
													},
													"lengthChange" : false,
													"searching" : false,
													"order" : [ [ 1, "desc" ] ]
												});
							});

			$('a[data-toggle="tooltip"]').tooltip({
				animated : 'fade',
				placement : 'left',
				html : true
			});
		</script>
	</div>
</body>
</html>