package com.deliang.minihome.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Table(name = "MINIHOME_USER")
@Entity
public class User {

	private Integer id;
	
	private String username;
	
	private String password;
	
	private String telephone;
	
	private String email;

	public User() { }

	public User(String username, String password, String telephone, String email) {
		super();
		this.username = username;
		this.password = password;
		this.telephone = telephone;
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@GeneratedValue
	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", telephone=" + telephone + ", email=" + email
				+ "]";
	}

}
