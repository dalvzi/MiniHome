package com.deliang.minihome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.Question;
import com.deliang.minihome.reposition.QuestionRepostion;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepostion questionRepostion;
	
	@Transactional
	public void save(Question question) {
		questionRepostion.saveAndFlush(question);
	}
	
	public List<Question> getList(House house) {
		return questionRepostion.getByHouse(house);
	}
	
}
