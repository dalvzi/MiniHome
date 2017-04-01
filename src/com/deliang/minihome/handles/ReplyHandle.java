package com.deliang.minihome.handles;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.deliang.minihome.entities.Question;
import com.deliang.minihome.entities.Reply;
import com.deliang.minihome.entities.User;
import com.deliang.minihome.service.QuestionService;
import com.deliang.minihome.service.ReplyService;

@Controller
public class ReplyHandle {

	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value="addReply",method=RequestMethod.POST)
	@ResponseBody
	public String add(
			@RequestParam("content") String content,
			@RequestParam("questionId") int questionId,
			HttpServletRequest request
			) {
		User user = (User) request.getSession().getAttribute("user");
		Question question = questionService.getById(questionId);
		Reply reply = new Reply(content, new Date(), user, question);
		replyService.add(reply);
		return "json";
	}
	
}
