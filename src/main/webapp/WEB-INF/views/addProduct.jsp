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


</head>
<body>
	<%@ include file="/WEB-INF/views/menu.jsp"%>
	<div class="page-content">
		<input id="hidProductSaved" type="hidden" value="${productSaved}" />
		<input id="hidEditMode" type="hidden" value="${editMode}" /> <input
			id="hidQuantity" type="hidden" value="${product.quantity}" />

		<div class="addProduct">
			<div class="leftDIV">
				<form:form method="POST" action="/saveProduct"
					modelAttribute="product" enctype="multipart/form-data">
					<form:hidden path="id" />
					<form:hidden id="hidImagePath" path="imagePath" />
					<div class="form-group">
						<label class="small-label">Código</label>
						<form:input id="txtCode" path="code" value="${product.code}"
							cssClass="form-control" />
					</div>
					<div class="form-group">
						<label class="small-label">Descrição</label>
						<form:input id="txtDescription" path="description"
							cssClass="form-control" />
					</div>
					<div class="form-group">
						<label class="small-label">Valor Unitário</label>
						<fmt:setLocale value="pt_BR" scope="session" />
						<fmt:formatNumber type='currency' value='${product.price}'
							var="formattedPrice" />
						<form:input id="txtPrice" value="${formattedPrice }" path="price"
							cssClass="form-control"
							onKeyPress="return(maskCurrency(this,'.',',',event))" />
					</div>
					<div class="form-group">
						<label class="small-label">Quantidade</label>
						<form:select id="selQuantity" path="quantity"
							cssClass="form-control" />
					</div>
					<div class="form-group">
						<label for="file-upload" class="custom-file-upload"> <i
							class="fa fa-camera"></i> Imagem
						</label> <input name="image" id="file-upload" type="file" />
					</div>
					<button id="btnSubmit" type="submit" class="btn btn-primary">Salvar</button>

				</form:form>
			</div>
			<div class="imageDetail">
				<div class="imageDiv">
					<img id='imgProduct' />
				</div>
				<label class="smaller-label" id="lblFileName"></label>
			</div>
		</div>

		<script>
			var txtCode = document.getElementById("txtCode");
			var txtDescription = document.getElementById("txtDescription");
			var txtPrice = document.getElementById("txtPrice");
			var selQuantity = document.getElementById("selQuantity");
			var filUpload = document.getElementById("file-upload");
			var lblFileName = document.getElementById("lblFileName");
			var hidEditMode = document.getElementById("hidEditMode");
			var hidImagePath = document.getElementById("hidImagePath");
			var hidQuantity = document.getElementById("hidQuantity");
			var hidProductSaved = document.getElementById("hidProductSaved");
			var imgProduct = document.getElementById("imgProduct");

			filUpload.onchange = function() {
				readURL(this);
			};

			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						imgProduct.src = e.target.result;
					}

					reader.readAsDataURL(input.files[0]);
					lblFileName.innerHTML = input.value.match(/[^\/\\]+$/);
				}
			}

			prepareForm();

			function prepareForm() {
				if (!hidEditMode.value) {
					txtCode.focus();
					txtCode.value = "";
					txtDescription.value = "";
					txtPrice.value = "";
					populateQuantityOptions(50, selQuantity);
				} else {
					imgProduct.src = hidImagePath.value;
					populateQuantityOptions(50, selQuantity);
					setQuantity();
				}
			}

			function populateQuantityOptions(max, select) {
				select.innerHTML = "";
				for (var i = 1; i <= max; i++) {
					var opt = document.createElement('option');
					opt.value = i;
					opt.innerHTML = i;
					select.appendChild(opt);
				}
			}

			function setQuantity() {
				for (var i = 0, j = selQuantity.options.length; i < j; ++i) {
					if (selQuantity.options[i].innerHTML === hidQuantity.value) {
						selQuantity.selectedIndex = i;
						break;
					}
				}
			}

			function maskCurrency(objTextBox, SeparadorMilesimo,
					SeparadorDecimal, e) {
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

			function validateForm(objTextBox) {
				if (objTextBox.value.length < 1) {
					document.getElementById("errorMessage").style.display = "block";
					document.getElementById("btnSubmit").disabled = true;
				} else {
					document.getElementById("errorMessage").style.display = "none";
					document.getElementById("btnSubmit").disabled = false;
				}
			}
		</script>

	</div>
</body>
</html>