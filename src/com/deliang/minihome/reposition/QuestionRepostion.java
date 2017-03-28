package com.deliang.minihome.reposition;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deliang.minihome.entities.House;
import com.deliang.minihome.entities.Question;

public interface QuestionRepostion extends JpaRepository<Question, Integer>{
	
	List<Question> getByHouse(House house);
	
}
