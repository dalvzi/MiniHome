package com.deliang.minihome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.deliang.minihome.entities.Question;
import com.deliang.minihome.entities.Reply;
import com.deliang.minihome.reposition.ReplyReposition;

@Service
public class ReplyService {

	@Autowired
	private ReplyReposition replyReposition;
	
	public void add(Reply reply) {
		replyReposition.saveAndFlush(reply);
	}
	
	public List<Reply> getList(Question question) {
		return replyReposition.getByQuestion(question);
	}
	
	
}
