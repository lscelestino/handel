package com.handel.models;

public enum SaleStatus {
	OPEN(1), COMPLETED(2), WAITING(3);

	public int id;

	private SaleStatus(int id) {
		this.id = id;
	}

}
