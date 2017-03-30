package com.deliang.minihome.reposition;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deliang.minihome.entities.Question;
import com.deliang.minihome.entities.Reply;

public interface ReplyReposition extends JpaRepository<Reply, Integer> {

	List<Reply> getByQuestion(Question question);
	
}
