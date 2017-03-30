package com.deliang.minihome.handles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deliang.minihome.entities.Reply;
import com.deliang.minihome.service.ReplyService;

@Controller
public class ReplyHandle {

	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("addReply")
	@ResponseBody
	public String add(Reply reply) {
		replyService.add(reply);
		return "";
	}
	
}
