package com.deliang.minihome.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Table(name = "MINIHOME_USER")
@Entity
public class User {

	private Integer id;
	
	private String nikename;
	
	private String username;
	
	private String password;
	
	private String telephone;
	
	private String email;
	
	private String headImgPath;

	public User() { }

	public User(String username, String nikename, String password, String telephone, String email, String headImgPath) {
		super();
		this.username = username;
		this.nikename = nikename;
		this.password = password;
		this.telephone = telephone;
		this.email = email;
		this.headImgPath = headImgPath;
	}

	@Column(name="HEAD_IMG_PATH")
	public String getHeadImgPath() {
		return headImgPath;
	}
	
	public void setHeadImgPath(String headImgPath) {
		this.headImgPath = headImgPath;
	}
	
	public String getNikename() {
		return nikename;
	}
	
	public void setNikename(String nikename) {
		this.nikename = nikename;
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

	@Override
	public String toString() {
		return "User [id=" + id + ", nikename=" + nikename + ", username="
				+ username + ", password=" + password + ", telephone="
				+ telephone + ", email=" + email + "]";
	}

}
