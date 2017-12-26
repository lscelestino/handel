
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
<script src="${contextPath}resources/js/Chart.min.js"></script>


</head>
<body>
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<div class="page-content">
		<div style="width: 500px; height: 400px; float: left">
			<canvas id="salesAmountChart"></canvas>
		</div>

		<div style="width: 500px; height: 400px; float: right">
			<canvas id="salesIncomeChart"></canvas>
		</div>


		<div style="width: 500px; height: 400px;">
			<canvas id="paymentMethodChart"></canvas>
		</div>

		<input id="hidData" type="hidden" value="${dailySales}"> <input
			id="hidDailySalesIncome" type="hidden" value="${dailySalesIncome}">
		<input id="hidLabels" type="hidden" value="${days}"> <input
			id="hidCard" type="hidden" value="${card}"> <input
			id="hidCash" type="hidden" value="${cash}">


	</div>
	<script>
		var salesAmountChart = document.getElementById('salesAmountChart')
				.getContext('2d');
		var salesIncomeChart = document.getElementById('salesIncomeChart')
				.getContext('2d');
		var paymentMethodChart = document.getElementById('paymentMethodChart')
				.getContext('2d');
		var hidData = document.getElementById('hidData');
		var hidLabels = document.getElementById('hidLabels');

		var chart1 = new Chart(salesAmountChart, {
			// The type of chart we want to create
			type : 'line',

			data : {
				labels : JSON.parse(hidLabels.value),
				datasets : [ {
					label : "Volume de vendas (Quantidade)",
					borderColor : 'rgb(255, 99, 132)',
					data : JSON.parse(hidData.value),
				} ]
			},

			// Configuration options go here
			options : {}
		});
		var chart2 = new Chart(salesIncomeChart, {
			// The type of chart we want to create
			type : 'line',

			data : {
				labels : JSON.parse(hidLabels.value),
				datasets : [ {
					label : "Total bruto (R$)",
					borderColor : 'rgb(99, 132, 255)',
					data : JSON.parse(hidDailySalesIncome.value),
				} ]
			},

			// Configuration options go here
			options : {}
		});
		var chart3 = new Chart(paymentMethodChart, {
			// The type of chart we want to create
			type : 'bar',

			data : {
				labels : JSON.parse(hidLabels.value),
				datasets : [ {
					label : "Dinheiro",
					backgroundColor : 'rgb(132, 255, 99)',
					data : JSON.parse(hidCash.value),
				}, {
					label : "Cartão",
					backgroundColor : 'rgb(132, 99, 255)',
					data : JSON.parse(hidCard.value),
				} ]
			},

			// Configuration options go here
			options : {
				scales : {
					xAxes : [ {
						stacked : true
					} ],
					yAxes : [ {
						stacked : true
					} ]
				}
			}
		});
	</script>

</body>
</html>



