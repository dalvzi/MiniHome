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


@Table(name = "MINIHOME_COMMENT")
@Entity
public class Comment {

	private Integer id;
	private String Content;
	private Date createTime;

	private User user;
	private House house;

	public Comment() { }

	public Comment(String content, Date createTime, User user, House house) {
		super();
		Content = content;
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

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
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
		return "Comment [id=" + id + ", Content=" + Content + ", createTime="
				+ createTime + ", user=" + user + ", house=" + house + "]";
	}

}
