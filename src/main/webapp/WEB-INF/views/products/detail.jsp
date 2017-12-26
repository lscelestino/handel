<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="/WEB-INF/views/header.jsp" %>

	<article id="${product.id }">
		  <header id="product-highlight" class="clearfix">
		    <div id="product-overview" class="container">
		      <img width="280px" height="395px" src="https://images-na.ssl-images-amazon.com/images/I/81aua6jLqHL._AC_UL320_SR256,320_.jpg?v=1435245145" class="product-featured-image" />
		      <h1 class="product-title">${product.title }</h1>
		      <p class="product-author">
		        <span class="product-author-link">
		          
		        </span>
		      </p>	
			
		    <p class="book-description">
		    	${product.description }
		    </p>
		    </div>
		  </header>
	
	  
	  <section class="buy-options clearfix">  
	  <form:form servletRelativeAction="/${pageContext.request.remoteUser}/add" method="post" cssClass="container">
	    <ul id="variants" class="clearfix">
	    <input type="hidden" value="${product.id }" name="productId"/>
	    <c:forEach items="${product.prices }" var="price">
			<c:if test="${not empty price.value}">
	    	  <li class="buy-option">
	            <input type="radio" name="typePrice" class="variant-radio" 
	            		id="type" value="${price.type }"  checked  />
	            <label  class="variant-label"> ${price.type } </label>
	            <small class="compare-at-price">$ 39,90</small>
	            <p class="variant-price" itemprop="price"> ${price.value }</p>
	          </li>
          	</c:if>
	    </c:forEach>           
	    </ul>
	    <button type="submit" class="submit-image icon-basket-alt" alt="Buy now" title="Buy now '${product.title }'!"></button>
	    
	  </form:form>
	  
	</section>
	  
	  <section class="data product-detail">
	    <h2 class="section-title">Book information:</h2>
	    <p>Pages: <span>${product.pages }</span></p>
	    <p></p>
	  </section>
	</div>
	
	</article>	

	
	<%@ include file="/WEB-INF/views/footer.jsp" %>