package com.handel.models;

public enum ItemStatus {
	CONFIRMED(1), CANCELLED(2);
	
	public int id;
	
	private ItemStatus(int id) {
		this.id = id;
	}

}
