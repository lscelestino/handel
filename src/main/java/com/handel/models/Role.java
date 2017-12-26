package com.handel.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by djlima on 5/23/17.
 */
@Entity
@Table(name = "roles", uniqueConstraints = {@UniqueConstraint(columnNames = {"username", "name"})})
public class Role implements GrantedAuthority {


	private static final long serialVersionUID = 1L;
	@Id
	private String name;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "username", nullable = false)
	private User user;
	
	public Role() { }
	
	public Role(String name, User user) {
		this.name = name;
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getAuthority() {
		return this.name;
	}
	
}
