package com.mushopl.payment;

import java.math.BigDecimal;
import java.text.DecimalFormat;

import com.handel.models.Product;

import br.com.uol.pagseguro.api.PagSeguro;
import br.com.uol.pagseguro.api.checkout.CheckoutRegistrationBuilder;
import br.com.uol.pagseguro.api.checkout.RegisteredCheckout;
import br.com.uol.pagseguro.api.common.domain.builder.PaymentItemBuilder;
import br.com.uol.pagseguro.api.common.domain.builder.SenderBuilder;
import br.com.uol.pagseguro.api.common.domain.enums.Currency;

public class PaymentUtils {
	
	
	
	public static String generateCheckoutCode(Product subscriptionPrice) {
		System.out.println("Entrou no pagamento");
		PagSeguro pagSeguro = PagSeguro.instance();
		RegisteredCheckout rc = pagSeguro.checkouts().register(new CheckoutRegistrationBuilder() 
	              .withCurrency(Currency.BRL) 
	              .withSender(new SenderBuilder()
	                  .withEmail("comprador@uol.com.br")
	                  .withName("Jose Comprador")) 
	              .addItem(new PaymentItemBuilder()
	                  .withId("0001")
	                  .withDescription("Produto PagSeguroI") 
	                  .withAmount(subscriptionPrice.getPrice())
	                  .withQuantity(1)));
		
		System.out.println("Saiu do pagamento");
		
		System.out.println(rc.getCheckoutCode());
		return rc.getCheckoutCode();
	}
	
	public static String formatMonetaryValue(BigDecimal value) {
		return new DecimalFormat("0.00").format(value);
	}
	

}
