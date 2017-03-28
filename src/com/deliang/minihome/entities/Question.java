package com.deliang.minihome.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name = "MINIHOME_QUESTION")
@Entity
public class Question {

	private Integer id;
	private String title;
	private String content;
	private Date createTime;

	private User user;
	private House house;

	public Question() { }

	public Question(String title, String content, Date createTime, User user, House house) {
		super();
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.user = user;
		this.house = house;
	}

	@GeneratedValue
	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIME)
	@Column(name="CREATE_TIME")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JoinColumn(name="USER_ID")
	@ManyToOne(targetEntity=User.class)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@JoinColumn(name="HOUSE_ID")
	@ManyToOne(targetEntity=House.class)
	public House getHouse() {
		return house;
	}
	
	public void setHouse(House house) {
		this.house = house;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", content="
				+ content + ", createTime=" + createTime + ", user=" + user
				+ "]";
	}

}
