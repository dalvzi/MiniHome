package com.deliang.minihome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.deliang.minihome.entities.User;
import com.deliang.minihome.reposition.UserReposition;

@Service
public class UserService {

	@Autowired
	private UserReposition userReposition;
	
	@Transactional
	public User get(String username, String password) {
		return userReposition.getByUsernameAndPassword(username, password);
	}
	
	@Transactional
	public User get(String username) {
		return userReposition.getByUsername(username);
	}
	
	@Transactional
	public void save(User user) {
		userReposition.saveAndFlush(user);
	}
	
}
