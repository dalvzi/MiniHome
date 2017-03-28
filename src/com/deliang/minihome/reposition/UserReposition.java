package com.deliang.minihome.reposition;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deliang.minihome.entities.User;

public interface UserReposition extends JpaRepository<User, Integer> {

	User getByUsernameAndPassword(String username, String password);
	
	User getByUsername(String username);
}
