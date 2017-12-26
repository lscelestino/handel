package com.handel.printer;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.handel.models.Item;
import com.handel.models.Sale;

@Component
public class ReceiptHelper {

	private static final String DASHED_LINE = "--------------------------------";

	@Autowired
	private PrinterService printerService;

	private DecimalFormat df;

	private DecimalFormat getDecimalFormat() {
		if (this.df == null) {
			df = new DecimalFormat();
			df.setMaximumFractionDigits(2);
			df.setMinimumFractionDigits(2);
			df.setGroupingUsed(false);
		}
		return this.df;
	}
	
	public void test() {
		printerService.printLine("abc");
	}

	public void printReceipt(Sale sale) {
		String dateTime = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(sale.getStartDate());
		printerService.printLogo();
		printerService.printLine("       MODAS E PERFUMARIA");
		printerService.printLineKeepCase("R Nicolau Carneiro Leao - 226");
		printerService.printLineKeepCase("Centro - 3392 5892");
		printerService.printLine(DASHED_LINE);
		printerService.printLine(String.format("CUPOM %04d DATA %s", sale.getId(), dateTime));
		printerService.printLine(DASHED_LINE);
		int lineCounter = 1;
		int itemCounter = 0;
		BigDecimal total = BigDecimal.ZERO;
		BigDecimal totalItem = BigDecimal.ZERO;
		for (Item item : sale.getItems()) {
			totalItem = item.getUnitPrice().multiply(new BigDecimal(item.getQuantity()));
			printerService.printLine(String.format("%03d %s", lineCounter, item.getProduct().getDescription()));
			printerService.printLine(padLeft(item.getQuantity(), 5) + " UN x " + padLeft(format(item.getUnitPrice()), 4)
					+ " = " + padLeft(format(totalItem), 4));
			printerService.lineBreak();
			total = total.add(totalItem);
			lineCounter++;
			itemCounter += item.getQuantity();
		}
		printerService.printLine(DASHED_LINE);
		printerService.printLine(String.format("%d %s | Valor total %s", itemCounter,
				itemCounter > 1 ? "Itens" : "Item", format(total)));
		printerService.printLine(DASHED_LINE);
		
		if (sale.getPaymentMethod() == 1) {
			printerService.printLine("Pagamento em dinheiro");
			printerService.printLine("Valor Recebido:" + sale.getReceived());
			printerService.printLine("Troco:" + sale.getTotalAmount().subtract(sale.getReceived()));
		} else {
			printerService.printLine("Pagamento em cartao");
		}
		printerService.printLine(DASHED_LINE);
		printerService.printLine("Obrigado pela preferencia!");
		printerService.lineBreak();
		printerService.lineBreak();
		printerService.lineBreak();
	}

	private String format(BigDecimal value) {
		return getDecimalFormat().format(value.setScale(2, RoundingMode.HALF_EVEN));
	}

	private String padRight(String s, int n) {
		return String.format("%1$-" + n + "s", s);
	}

	private String padLeft(Integer i, int n) {
		return padLeft(i.toString(), n);
	}

	private String padLeft(String s, int n) {
		return String.format("%1$" + n + "s", s);
	}

}
