package com.deliang.minihome.handles;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.Question;
import com.deliang.minihome.entities.User;
import com.deliang.minihome.service.QuestionService;

@Controller
public class QuestionHandle {

	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("addQuestion")
	public String addQuestion() {
		return "addQuestion";
	}
	
	@RequestMapping("saveQuestion")
	public String saveQuestion(
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		User user = (User) request.getSession().getAttribute("user");
		House house = (House)request.getSession().getAttribute("house");
		System.out.println(house);
		System.out.println();
		Question question = new Question(title, content, new Date(), user, house);
		questionService.save(question);
		
		return "redirect:/zufang";
	}
	
}
