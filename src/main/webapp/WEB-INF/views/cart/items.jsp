<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
	  <meta charset="utf-8"/>
		  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="icon"
			href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979"
			type="image/ico" />
		<link href="https://plus.googlecom/108540024862647200608"
			rel="publisher"/>
		<title>Mushopl</title>
		<link href="${contextPath}resources/css/cssbase-min.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
			rel='stylesheet'/>
		<link href="${contextPath}resources/css/fonts.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-ie7.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-embedded.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/layout-colors.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/responsive-style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/guia-do-programador-style.css" 
			rel="stylesheet" type="text/css"  media="all"  />
	    <link href="${contextPath}resources/css/produtos.css" 
	    	rel="stylesheet" type="text/css"  media="all"  />
</head>
<body>

<header id="layout-header">
    <div class="clearfix container">
        <div id="header-content">
            <nav id="main-nav">
                <ul class="clearfix">
                    <li>
                        <a href="/${pageContext.request.remoteUser}" rel="nofollow"> 
                            Cart ( ${quantity} )
                        </a>
                    </li>
                    <li>
                        <a href="/logout" rel="nofollow"> 
                            Logout
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
	<nav class="categories-nav">
    <ul class="container">
        <li class="category"><a href="/">Home</a></li>
        <li class="category"><a href="#">
                Agile </a></li>
        <li class="category"><a href="#">
                Back End </a></li>
        <li class="category"><a href="#">
                Java </a></li>
        <li class="category"><a href="#">
                C# </a></li>
        <li class="category"><a href="#">
                Mobile </a></li>
    </ul>
	</nav>
	
	<c:if test="${not empty shoppingCart.items}">
	<section class="container middle">
	<div><h1>${success }</h1></div>
	<div><h1>${fail }</h1></div>
	
		  <h2 id="cart-title">Your Shopping Cart</h2>
		  
		  
		    <table id="cart-table">
		      <colgroup>
		        <col class="item-col"/>
		        <col class="item-price-col"/>
		        <col class="item-quantity-col"/>
		        <col class="line-price-col"/>
		        <col class="delete-col"/>
		      </colgroup>
		      <thead>
		        <tr>
		          <th class="cart-img-col"></th>
		          <th width="65%">Item</th>
		          <th width="10%">Price</th>
		          <th width="10%">Quantity</th>

		          <th width="5%"></th>
		        </tr>
		      </thead>
		      <tbody>
		      	<c:forEach items="${shoppingCart.items }" var="item">
			      <tr>
			          <td class="cart-img-col"><img src="https://images-na.ssl-images-amazon.com/images/I/81aua6jLqHL._AC_UL320_SR256,320_.jpg?v=1435245145" width="71px" height="100px"/></td>
			          <td class="item-title">${item.product.title }</td>
			          <td class="numeric-cell">${item.price }</td>
			          <td class="quantity-input-cell">
			          	<input type="number" min="0" readonly="readonly" id="quantity" name="quantity"
			          		 	value="1"/></td>

			          <td class="remove-item">
				          <form:form action="/${pageContext.request.remoteUser}/remove" method="post">
				          <input type="hidden" value="${item.id }" name="itemId"/>
					          <input type="image" 
					          	src="${contextPath }resources/imagens/excluir.png" alt="Remove" title="Remove" /></a>
				           </form:form>
			          </td>
			      </tr>
		      	</c:forEach>
		      </tbody>
			      <tfoot>
			        <tr>
			          <td colspan="3">
			          <form:form action="/payment/finalize" method="post">
				          <input type="submit" class="checkout" name="checkout" 
				          		value="Checkout" id="checkout"/></td>
			          </form:form>
			          <td class="numeric-cell">${shoppingCart.total }</td><td></td>
			        </tr>
			      </tfoot>
		    </table>
		</section> 
		</c:if>
		<c:if test="${empty shoppingCart.items}">
			<div><h1>You don't have any item in your cart.</h1></div>
		</c:if>
		
	<footer id="layout-footer">
    <div class="clearfix container">
        <div id="collections-footer">
            <!-- cdc-footer -->
            <p class="footer-title">Programming</p>
            <ul class="footer-text-links">
                <li><a href="#">Java</a></li>
                <li><a href="#">Mobile</a></li>
                <li><a href="#">Games</a></li>
            </ul>
        </div>
        <div id="social-footer">
            <!-- books-footer -->
            <p class="footer-title">About us</p>
            <ul class="footer-text-links">
                <li><a href="#" rel="nofollow">Books</a></li>
                <li><a href="#">Company</a></li>
            </ul>
        </div>

    </div>
</footer>
</body>
</html>