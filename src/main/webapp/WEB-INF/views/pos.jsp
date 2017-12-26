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
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css">
<link rel="stylesheet" href="${cssPath }/font-awesome.min.css">
<link rel="stylesheet" href="${cssPath }/mgm-menu.css">
<link rel="stylesheet" href="${cssPath }/jBox.css">
<link rel="stylesheet" href="${cssPath }/jquery.modal.css"
	media="screen" />
<link rel="stylesheet" href="${cssPath }/jquery.dataTables.min.css">
<script src="${contextPath}resources/js/jquery-2.2.4.min.js"></script>
<script src="${contextPath}resources/js/jquery.blockUI.js"></script>
<script src="${contextPath}resources/js/jquery.simplemodal.js"></script>
<script src="${contextPath}resources/js/jquery.maskedinput.js"></script>
<script src="${contextPath}resources/js/jquery.jquery.maskMoney.js"></script>
<script src="${contextPath}resources/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}resources/js/jBox.min.js"></script>
<style>
body {
	background-color: #DDDDDD;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<div class="page-content">

		<div class="mainDIV">
			<div class="leftDIV">
				<div class="imgDiv">
					<img id='imgProduct' />
				</div>
				<div class="fieldsDiv">
					<div class="form-group">
						<label>Código</label>
						<div class="input-group">
							<input id="txtCode" class="form-control" type="text"
								placeholder="Pressione enter para buscar"> <span
								id="btnProductSearch" class="input-group-addon"><i
								class="fa fa-search"></i></span>
						</div>
					</div>
					<div class="form-group">
						<label>Descrição</label> <input type="text" id="txtDescription"
							class="form-control" disabled />
					</div>
					<div class="form-group">
						<label>Quantidade</label> <select id="selAmount" name="cars"
							class="form-control">
						</select>

					</div>
					<div class="form-group">
						<label>Valor Unitário</label> <input id="txtUnitPrice" type="text"
							disabled class="form-control" />
					</div>
					<div class="form-group">
						<label>Valor Total</label> <input id="txtTotalPrice" type="text"
							disabled class="form-control" />
					</div>
					<button id="btnAddItem" type="submit" class="botao">
						<i class="fa fa-plus" aria-hidden="true"></i> Adicionar
					</button>
				</div>
			</div>
			<div id="divReceipt" class="rightDIV">
				<p>CUPOM ${ticketNumber} DATA ${date} ${time}</p>
				<p>--------------------------------</p>
			</div>
		</div>
		<div class="bottomDIV">
			<button id="btnFinish" type="submit" class="botao-finalizar">
				<i class="fa fa-check" aria-hidden="true"></i> Finalizar
			</button>
			<button id="btnCancel" type="submit" class="botao-cancelar">
				<i class="fa fa-times" aria-hidden="true"></i> Cancelar
			</button>
			<button id="btnWait" type="submit" class="botao-aguardar">
				<i class="fa fa-clock-o" aria-hidden="true"></i> Aguardar
			</button>
		</div>
		<input type="hidden" id="hidTicketNumber" value="${ticketNumber}" />
		<input type="hidden" id="hidSubTotal" /> <input type="hidden"
			id="hidPaymentOption" value="1" />



		<div id="paymentDetailsModal" style="display: none;">
			<div class=".container">
				<div class="paymentDetails">
					<div style="float: left;">
						<input id="rdbCash" name="paymentMethod" type="radio" checked
							onClick="displayReceivedAmountInput(this)" class="with-font"
							value="sel" /> <label for="rdbCash">Dinheiro</label>
					</div>
					<div style="float: right;">
						<input id="rdbCard" name="paymentMethod" type="radio"
							onClick="displayReceivedAmountInput(this)" class="with-font"
							value="sel" /> <label for="rdbCard">Cartão
							(Débito/Crédito)</label>
					</div>
					<div class="paymentMethodWrapper">
						<div class="form-group">
							<label>Valor Total</label> <input id="txtTotalAmount" disabled
								type="text" class="form-control" />
						</div>
						<div class="form-group">
							<label>Alíquota de Desconto</label> <input id="txtDiscount"
								type="text" class="form-control" />
						</div>
						<div class="form-group">
							<label>Valor Recebido</label> <input id="txtReceivedAmount"
								type="text" class="form-control" />
						</div>
						<div class="form-group">
							<label>Troco</label> <input id="txtChange" disabled type="text"
								class="form-control" />
						</div>
						<button id="btnConfirmation" type="submit" class="botao-finalizar">
							<i class="fa fa-usd" aria-hidden="true"></i> Concluir
						</button>
					</div>
				</div>
			</div>
		</div>

		<div id="productSearchModal" style="display: none;">
			<div class=".container">
				<table id="grdSearchProducts" class="display">
					<thead>
						<tr>
							<th>Código</th>
							<th>Descrição</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">
							<tr>
								<td>${product.code }</td>
								<td>${product.description }</td>
								<td><div class="action-buttons">
										<a class="green" onclick="searchModal('${product.code}')"><i
											class="fa fa-plus"></i></a> <a class="blue" data-toggle="tooltip"
											title="<img src='${product.imagePath}' width='180px' height='180px' />">
											<i class="fa fa-camera"></i>
										</a>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
		var btnAddItem = document.getElementById("btnAddItem");
		var btnFinish = document.getElementById("btnFinish");
		var btnCancel = document.getElementById("btnCancel");
		var btnWait = document.getElementById("btnWait");
		var btnConfirmation = document.getElementById("btnConfirmation");
		var btnProductSearch = document.getElementById("btnProductSearch");

		var selAmount = document.getElementById("selAmount");
		var hidTicketNumber = document.getElementById("hidTicketNumber");
		var hidSubTotal = document.getElementById("hidSubTotal");
		var hidPaymentOption = document.getElementById("hidPaymentOption");
		var imgProduct = document.getElementById("imgProduct");

		var txtDescription = document.getElementById("txtDescription");
		var txtUnitPrice = document.getElementById("txtUnitPrice");
		var txtTotalPrice = document.getElementById("txtTotalPrice");
		var txtCode = document.getElementById("txtCode");
		var txtTotalAmount = document.getElementById("txtTotalAmount");
		var txtDiscount = document.getElementById("txtDiscount");
		var txtChange = document.getElementById("txtChange");
		var txtReceivedAmount = document.getElementById("txtReceivedAmount");

		var divReceipt = document.getElementById("divReceipt");

		var modPaymentDetails = new jBox('Modal', {
			width : 500,
			height : 450,
			attach : '#btnFinish',
			title : 'Detalhes do pagamento',
			content : $('#paymentDetailsModal')
		});

		var modProductSearch = new jBox('Modal', {
			width : 700,
			height : 510,
			attach : '#btnProductSearch',
			title : 'Buscar produtos',
			content : $('#productSearchModal')
		});

		$('document').ready(function() {
			prepareForNewSale();
		});

		function prepareForNewSale() {
			cleanForm();
			disableButtons();
			$("#txtDiscount").mask("9?9%");
			$("#txtReceivedAmount").maskMoney({
				symbol : 'R$ ',
				showSymbol : true,
				thousands : '.',
				decimal : ',',
				symbolStay : true
			});
		}

		function disableButtons() {
			btnFinish.disabled = true;
			btnCancel.disabled = true;
			btnWait.disabled = true;
		}

		function enableButtons() {
			btnFinish.disabled = false;
			btnCancel.disabled = false;
			btnWait.disabled = false;
		}

		var itemNumber = 0;

		function cleanForm() {
			btnAddItem.disabled = true;
			selAmount.disabled = true;
			txtDescription.value = "";
			txtUnitPrice.value = "";
			txtTotalPrice.value = "";
			imgProduct.src = "";
			txtCode.value = "";
			populateAmountOptions(0, selAmount);
			txtCode.focus();
		}

		function enableForm() {
			btnAddItem.disabled = false;
			selAmount.disabled = false;
			selAmount.focus();
		}

		btnFinish.addEventListener("click", function() {
			openPaymentDetails();
		});

		btnProductSearch.addEventListener("click", function() {
			$('a[data-toggle="tooltip"]').tooltip({
				animated : 'fade',
				placement : 'left',
				html : true
			});
		});

		btnAddItem.addEventListener("click", function() {
			var p = document.createElement('p');
			var p2 = document.createElement('p');
			p2.align = 'right';
			itemNumber += 1;
			p.innerHTML = pad(itemNumber, 3) + ' ' + txtDescription.value;
			divReceipt.appendChild(p);
			p2.innerHTML = selAmount.options[selAmount.selectedIndex].value
					+ 'UN  X ' + txtUnitPrice.value + ' = '
					+ txtTotalPrice.value;
			divReceipt.appendChild(p2);
			divReceipt.scrollTop = divReceipt.scrollHeight;

			//ajax call
			var xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					hidSubTotal.value = xhttp.responseText;
				}
			};

			xhttp.open("GET", "addItemToSale?ticketNumber="
					+ hidTicketNumber.value + "&productCode=" + txtCode.value
					+ "&quantity="
					+ selAmount.options[selAmount.selectedIndex].value, true);
			xhttp.send();

			cleanForm();
			enableButtons();

		});

		function pad(n, len) {
			return (new Array(len + 1).join('0') + n).slice(-len);
		}

		function maskCurrency(objTextBox, SeparadorMilesimo, SeparadorDecimal,
				e) {
			var sep = 0;
			var key = '';
			var i = j = 0;
			var len = len2 = 0;
			var strCheck = '0123456789';
			var aux = aux2 = '';
			var whichCode = (window.Event) ? e.which : e.keyCode;
			var currencySymbol = 'R$ ';
			if (whichCode == 13 || whichCode == 8)
				return true;
			objTextBox.value = objTextBox.value.substring(3);
			if (objTextBox.value.length < 6) {
				key = String.fromCharCode(whichCode); // Valor para o código da Chave  
				if (strCheck.indexOf(key) == -1)
					return false; // Chave inválida  
				len = objTextBox.value.length;
				for (i = 0; i < len; i++)
					if ((objTextBox.value.charAt(i) != '0')
							&& (objTextBox.value.charAt(i) != SeparadorDecimal))
						break;
				aux = '';
				for (; i < len; i++)
					if (strCheck.indexOf(objTextBox.value.charAt(i)) != -1)
						aux += objTextBox.value.charAt(i);
				aux += key;
				len = aux.length;
				if (len == 0)
					objTextBox.value = '';
				if (len == 1)
					objTextBox.value = '0' + SeparadorDecimal + '0' + aux;
				if (len == 2)
					objTextBox.value = '0' + SeparadorDecimal + aux;
				if (len > 2) {
					aux2 = '';
					for (j = 0, i = len - 3; i >= 0; i--) {
						if (j == 3) {
							aux2 += SeparadorMilesimo;
							j = 0;
						}
						aux2 += aux.charAt(i);
						j++;
					}
					objTextBox.value = '';
					len2 = aux2.length;
					for (i = len2 - 1; i >= 0; i--)
						objTextBox.value += aux2.charAt(i);
					objTextBox.value += SeparadorDecimal
							+ aux.substr(len - 2, len);
				}
			}
			objTextBox.value = currencySymbol + objTextBox.value;
			return false;
		}

		txtCode.addEventListener("keydown", function(e) {
			if (e.keyCode === 13) { //checks whether the pressed key is "Enter"
				switchCssClass(e.target, 'form-control-error', 'form-control');
				search(e.target.value);
			}
		});

		function searchModal(code) {
			txtCode.value = code;
			search(code);
			modProductSearch.close();
		}

		function search(code) {
			$.blockUI({
				message : null
			});
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					$.unblockUI();
					var data = JSON.parse(xhttp.responseText);
					if (data.product) {
						onSearchSuccess(data.product);
					} else {
						onSearchFailed(e.target);
					}
				}
			};
			xhttp.open("GET", "searchProduct?code=" + code, true);
			xhttp.send();

		}

		function openPaymentDetails() {
			txtTotalAmount.value = hidSubTotal.value;
			txtDiscount.focus();

			txtDiscount.addEventListener("keydown", function(e) {
				if (e.keyCode === 13) {
					applyDiscount(e.target.value);
					txtReceivedAmount.focus();
				}
			});

			txtDiscount.addEventListener("blur", function() {
				applyDiscount(txtDiscount.value);
			});

			txtReceivedAmount.addEventListener("keydown", function(e) {
				if (e.keyCode === 13) {
					calculateChange(e.target.value);
				}
			});

			txtReceivedAmount.addEventListener("blur", function(e) {
				calculateChange(e.target.value);
			});

			btnConfirmation.addEventListener("click", function() {
				finish();
			});
		}

		function applyDiscount(amount) {
			var discount = amount.replace('%', '');
			var totalAmount = hidSubTotal.value;
			txtTotalAmount.value = (totalAmount - ((totalAmount / 100) * discount))
					.toFixed(2);
		}

		function calculateChange(received) {
			var totalAmount = txtTotalAmount.value;
			txtChange.value = (received - totalAmount).toFixed(2);
		}

		function finish() {
			modPaymentDetails.close();
			$.blockUI({
				message : '<h1>Finalizando...</h1>',
				css : {
					border : 'none',
					padding : '15px',
					backgroundColor : '#000',
					'-webkit-border-radius' : '10px',
					'-moz-border-radius' : '10px',
					opacity : .5,
					color : '#fff'
				}
			});

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					$.unblockUI();
					location.reload();
					prepareForNewSale();
				}
			};
			xhttp.open("GET", "finish?ticketNumber=" + hidTicketNumber.value
					+ "&paymentOptionId=" + hidPaymentOption.value
					+ "&totalAmount=" + txtTotalAmount.value + "&discount="
					+ extractDiscount() + "&receivedAmount="
					+ extractReceivedAmount(), true);
			xhttp.send();

		}

		function extractDiscount() {
			if (txtDiscount.value) {
				return txtDiscount.value.replace('%', '');
			}
			return "0";
		}

		function extractReceivedAmount() {
			if (txtReceivedAmount.value) {
				return txtReceivedAmount.value;
			}
			return "0";
		}

		function onSearchSuccess(product) {
			enableForm();
			populateAmountOptions(product.quantity, selAmount);
			txtDescription.value = product.description;
			txtUnitPrice.value = txtTotalPrice.value = convertToMonetary(product.price);
			imgProduct.src = product.imagePath;

		}

		function onSearchFailed(element) {
			switchCssClass(element, 'form-control', 'form-control-error');
			imgProduct.src = 'imagem-produtos/notfound.png';
		}

		function switchCssClass(element, oldClass, newClass) {
			element.classList.remove(oldClass);
			element.classList.add(newClass);
		}

		function populateAmountOptions(max, select) {
			select.innerHTML = "";
			for (var i = 1; i <= max; i++) {
				var opt = document.createElement('option');
				opt.value = i;
				opt.innerHTML = i;
				select.appendChild(opt);
			}
		}

		selAmount.onchange = function() {
			var multiplier = this.value;
			var unitPrice = parseFromMonetary(txtUnitPrice.value);
			txtTotalPrice.value = convertToMonetary(unitPrice * multiplier);

		}

		function convertToMonetary(value) {
			return ('R$ ' + value.toFixed(2)).replace('.', ',');
		}

		function parseFromMonetary(value) {
			return value.replace(',', '.').replace('R$ ', '');
		}

		function displayReceivedAmountInput(c) {
			var txtReceivedAmount = document
					.getElementById("txtReceivedAmount");
			if (c.id == "rdbCard") {
				hidPaymentOption.value = "2";
				txtReceivedAmount.disabled = true;
			} else if (c.id == "rdbCash") {
				hidPaymentOption.value = "1";
				txtReceivedAmount.disabled = false;
			}
		}

		$('#grdSearchProducts').DataTable({
			"language" : {
				"lengthMenu" : "Exibir _MENU_ registros por página",
				"zeroRecords" : "Nenhum registro encontrado",
				"info" : "Página _PAGE_ de _PAGES_",
				"infoEmpty" : "Nenhum registro disponível",
				"infoFiltered" : "(Filtrado a partir de _MAX_ registros)",
				"search" : "Buscar"
			},
			"lengthChange" : false
		});
	</script>

</body>
</html>