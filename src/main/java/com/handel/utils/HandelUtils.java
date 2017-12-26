package com.handel.utils;

import org.apache.commons.text.RandomStringGenerator;
import org.springframework.stereotype.Component;

@Component
public class HandelUtils {
	
	public String generateProductCode() {
		RandomStringGenerator generator = new RandomStringGenerator.Builder()
			     .withinRange('A', 'Z')
			     .build();
		
		RandomStringGenerator generator2 = new RandomStringGenerator.Builder()
			     .withinRange('0', '9')
			     .build();
		
		return generator.generate(3) + generator2.generate(3);
	}

}
