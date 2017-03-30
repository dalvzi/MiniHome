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


@Table(name = "MINIHOME_REPLY")
@Entity
public class Reply {

	private Integer id;
	private String content;
	private Date createTime;

	private User user;
	private Question question;

	public Reply() { }

	public Reply(String content, Date createTime, User user, Question question) {
		super();
		this.content = content;
		this.createTime = createTime;
		this.user = user;
		this.question = question;
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

	@JoinColumn(name="QUESTION_ID")
	@ManyToOne(targetEntity=Question.class)
	public Question getQuestion() {
		return question;
	}
	
	public void setQuestion(Question question) {
		this.question = question;
	}
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", Content=" + content + ", createTime="
				+ createTime + ", user=" + user + ", question=" + question + "]";
	}

}
