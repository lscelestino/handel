package com.handel.models;

public enum PaymentMethod {
	CASH(1), CARD(2);

	public int id;

	private PaymentMethod(int id) {
		this.id = id;
	}

}
