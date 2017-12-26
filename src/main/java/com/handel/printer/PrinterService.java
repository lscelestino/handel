package com.handel.printer;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.awt.print.PageFormat;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;

import org.springframework.stereotype.Component;

@Component
public class PrinterService implements Printable {

	public static final String PRINTER_NAME = "POS-58";

	public List<String> getPrinters() {

		DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
		PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();

		PrintService printServices[] = PrintServiceLookup.lookupPrintServices(flavor, pras);

		List<String> printerList = new ArrayList<String>();
		for (PrintService printerService : printServices) {
			printerList.add(printerService.getName());
		}

		return printerList;
	}

	@Override
	public int print(Graphics g, PageFormat pf, int page) throws PrinterException {
		if (page > 0) { /* We have only one page, and 'page' is zero-based */
			return NO_SUCH_PAGE;
		}

		/*
		 * User (0,0) is typically outside the imageable area, so we must
		 * translate by the X and Y values in the PageFormat to avoid clipping
		 */
		Graphics2D g2d = (Graphics2D) g;
		g2d.translate(pf.getImageableX(), pf.getImageableY());
		/* Now we perform our rendering */

		g.setFont(new Font("Roman", 0, 8));
		g.drawString("Hello world !", 0, 10);

		return PAGE_EXISTS;
	}

	public void lineBreak() {
		printString("\n");
	}

	public void printLine(String text) {
		printString(text.toUpperCase() + "\n");
	}

	public void printLineKeepCase(String text) {
		printString(text + "\n");
	}

	public void printString(String text) {
		printString(PRINTER_NAME, text);
	}

	private byte[] extractBytes() throws IOException {
		// open image
		File img = new File("D:\\Graciele\\logo.jpg");
		BufferedImage bufferedImage = ImageIO.read(img);

		// get DataBufferBytes from Raster
		WritableRaster raster = bufferedImage.getRaster();
		DataBufferByte data = (DataBufferByte) raster.getDataBuffer();

		return (data.getData());
	}

	public void printString(String printerName, String text) {

		// find the printService of name printerName
		DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
		PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();

		PrintService printService[] = PrintServiceLookup.lookupPrintServices(flavor, pras);
		PrintService service = findPrintService(printerName, printService);

		DocPrintJob job = service.createPrintJob();

		try {
			byte[] bytes;
			// important for umlaut chars
			bytes = text.getBytes("CP437");

			Doc doc = new SimpleDoc(bytes, flavor, null);
			job.print(doc, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void printBytes(String printerName, byte[] bytes) {

		DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
		PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();

		PrintService printService[] = PrintServiceLookup.lookupPrintServices(flavor, pras);
		PrintService service = findPrintService(printerName, printService);

		DocPrintJob job = service.createPrintJob();

		try {
			Doc doc = new SimpleDoc(bytes, flavor, null);
			job.print(doc, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private PrintService findPrintService(String printerName, PrintService[] services) {
		for (PrintService service : services) {
			if (service.getName().equalsIgnoreCase(printerName)) {
				return service;
			}
		}
		return null;
	}

	public void printLogo() {
		printBytes("POS-58", new byte[] { (byte) 0x1C, (byte) 0x70, (byte) 0x01, (byte) 0x00 });
	}

	public void printLogo2() {
		String code2 = "1C700100"; // my code in hex
		FileOutputStream os = null;
		try {
			os = new FileOutputStream("POS-58");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		PrintStream ps = new PrintStream(os);
		ps.print(toAscii(code2));
		ps.close();
	}

	private StringBuilder toAscii(String hex) {
		StringBuilder output = new StringBuilder();
		for (int i = 0; i < hex.length(); i += 2) {
			String str = hex.substring(i, i + 2);
			output.append((char) Integer.parseInt(str, 16));
		}
		return output;

	}
}
