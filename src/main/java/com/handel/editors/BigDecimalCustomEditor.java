package com.handel.editors;

import java.math.BigDecimal;

import org.springframework.beans.propertyeditors.CustomNumberEditor;

public class BigDecimalCustomEditor extends CustomNumberEditor {

	public BigDecimalCustomEditor(Class<BigDecimal> numberClass, boolean allowEmpty)
			throws IllegalArgumentException {
		super(numberClass, allowEmpty);
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		String value = text.substring(3).replace(',', '.');
		setValue(new BigDecimal(value));
	}


}
